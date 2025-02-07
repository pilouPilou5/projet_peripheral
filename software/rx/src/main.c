/*
 * Copyright (c) 2021 Nordic Semiconductor ASA
 *
 * SPDX-License-Identifier: LicenseRef-Nordic-5-Clause
 */

#include <stddef.h>
#include <errno.h>
#include <zephyr/kernel.h>
#include <zephyr/bluetooth/direction.h>
#include <zephyr/bluetooth/hci_types.h>
#include <zephyr/bluetooth/hci_vs.h>

#include <zephyr/bluetooth/bluetooth.h>
#include <zephyr/bluetooth/direction.h>
#include <stdio.h>
#include <math.h>

#define DEVICE_NAME CONFIG_BT_DEVICE_NAME
#define DEVICE_NAME_LEN (sizeof(DEVICE_NAME) - 1)
#define PEER_NAME_LEN_MAX 30
#define M_PI 3.1415
#define NB_ANT 4
float pi = M_PI ;
#define f  2400000000 
#define  c  300000000 
float lbd = c/(float)f ;
float  d ;

float theta;
/* The Bluetooth Core specification allows controller to wait 6
 * periodic advertising events for
 * synchronization establishment, hence timeout must be longer than that.
 */
#define SYNC_CREATE_TIMEOUT_INTERVAL_NUM 7
/* Maximum length of advertising data represented in hexadecimal format */
#define ADV_DATA_HEX_STR_LEN_MAX (BT_GAP_ADV_MAX_EXT_ADV_DATA_LEN * 2 + 1)

static struct bt_le_per_adv_sync *sync;
static bt_addr_le_t per_addr;
static volatile bool per_adv_found;
static bool scan_enabled;
static uint8_t per_sid;
static uint32_t sync_create_timeout_ms;

static K_SEM_DEFINE(sem_per_adv, 0, 1);
static K_SEM_DEFINE(sem_per_sync, 0, 1);
static K_SEM_DEFINE(sem_per_sync_lost, 0, 1);

#if defined(CONFIG_BT_DF_CTE_RX_AOA)
/* Example sequence of antenna switch patterns for antenna matrix designed by
 * Nordic. For more information about antenna switch patterns see README.rst.
 */
static const uint8_t ant_patterns[] = { 0x2, 0x0, 0x1, 0x3 };
#endif /* CONFIG_BT_DF_CTE_RX_AOA */

static inline uint32_t adv_interval_to_ms(uint16_t interval)
{
	return interval * 5 / 4;
}

static const char *phy2str(uint8_t phy)
{
	switch (phy) {
	case 0: return "No packets";
	case BT_GAP_LE_PHY_1M: return "LE 1M";
	case BT_GAP_LE_PHY_2M: return "LE 2M";
	case BT_GAP_LE_PHY_CODED: return "LE Coded";
	default: return "Unknown";
	}
}

static const char *cte_type2str(uint8_t type)
{
	switch (type) {
	case BT_DF_CTE_TYPE_AOA: return "AOA";
	case BT_DF_CTE_TYPE_AOD_1US: return "AOD 1 [us]";
	case BT_DF_CTE_TYPE_AOD_2US: return "AOD 2 [us]";
	case BT_DF_CTE_TYPE_NONE: return "";
	default: return "Unknown";
	}
}

static const char *packet_status2str(uint8_t status)
{
	switch (status) {
	case BT_DF_CTE_CRC_OK: return "CRC OK";
	case BT_DF_CTE_CRC_ERR_CTE_BASED_TIME: return "CRC not OK, CTE Info OK";
	case BT_DF_CTE_CRC_ERR_CTE_BASED_OTHER: return "CRC not OK, Sampled other way";
	case BT_DF_CTE_INSUFFICIENT_RESOURCES: return "No resources";
	default: return "Unknown";
	}
}

static bool data_cb(struct bt_data *data, void *user_data)
{
	char *name = user_data;
	uint8_t len;

	switch (data->type) {
	case BT_DATA_NAME_SHORTENED:
	case BT_DATA_NAME_COMPLETE:
		len = MIN(data->data_len, PEER_NAME_LEN_MAX - 1);
		memcpy(name, data->data, len);
		name[len] = '\0';
		return false;
	default:
		return true;
	}
}

static void sync_cb(struct bt_le_per_adv_sync *sync,
		    struct bt_le_per_adv_sync_synced_info *info)
{
	char le_addr[BT_ADDR_LE_STR_LEN];

	bt_addr_le_to_str(info->addr, le_addr, sizeof(le_addr));

	printk("PER_ADV_SYNC[%u]: [DEVICE]: %s synced, "
	       "Interval 0x%04x (%u ms), PHY %s\n",
	       bt_le_per_adv_sync_get_index(sync), le_addr, info->interval,
	       adv_interval_to_ms(info->interval), phy2str(info->phy));

	k_sem_give(&sem_per_sync);
}

static void term_cb(struct bt_le_per_adv_sync *sync,
		    const struct bt_le_per_adv_sync_term_info *info)
{
	char le_addr[BT_ADDR_LE_STR_LEN];

	bt_addr_le_to_str(info->addr, le_addr, sizeof(le_addr));

	printk("PER_ADV_SYNC[%u]: [DEVICE]: %s sync terminated\n",
	       bt_le_per_adv_sync_get_index(sync), le_addr);

	k_sem_give(&sem_per_sync_lost);
}

static void recv_cb(struct bt_le_per_adv_sync *sync,
		    const struct bt_le_per_adv_sync_recv_info *info,
		    struct net_buf_simple *buf)
{
	static char data_str[ADV_DATA_HEX_STR_LEN_MAX];
	char le_addr[BT_ADDR_LE_STR_LEN];

	bt_addr_le_to_str(info->addr, le_addr, sizeof(le_addr));
	bin2hex(buf->data, buf->len, data_str, sizeof(data_str));

	printk("PER_ADV_SYNC[%u]: [DEVICE]: %s, tx_power %i, "
	       "RSSI %i, CTE %s, data length %u, data: %s\n",
	       bt_le_per_adv_sync_get_index(sync), le_addr, info->tx_power,
	       info->rssi, cte_type2str(info->cte_type), buf->len, data_str);
}

static float theta_est(struct bt_df_per_adv_sync_iq_samples_report const *report){
	float theta_mean ;
	int nb_phase  = (report->sample_count-8); // les 8 premier echantillons sont des references 
	int nb_block = nb_phase%NB_ANT ; 
	float tab_phase [nb_phase] ; //tableau de phase
	float tab_mean_phase[NB_ANT]; // tableau des moyennes des phases par anthenne  
	float tab_dlt_phase[nb_phase-1]; // tableau de diférence de phase 
	float tab_theta_est[NB_ANT-1]; // tableau des estimation de theta

	//printf("nb_phase = %d\n", (nb_phase-1)/4);
	
	float tab_sync[8];
	for (int i=0; i<8; i++){
		int8_t I = report->sample[i].i; 
		int8_t Q = report->sample[i].q;
		float phase = atan2f((float)Q,(float)I);
		tab_sync[i]  = phase;
		//printf("sync %d: Phase = %.6f\n", i,phase);
	}

	float sync = 0, dlt_sync;
	for (int i=0; i<7; i++){
		dlt_sync = tab_sync[i+1] - tab_sync[i];
		//printf("dlt_sync av magouille : %f  ", dlt_sync);
		if(dlt_sync > 2*pi){
			dlt_sync -= 2*pi;
		}
		if(dlt_sync < 0){
			dlt_sync += 2*pi;
		}
		//printf("dlt_sync ap magouille : %f\n", dlt_sync);
		sync += dlt_sync;
	}
	sync /= 7;
	//printf("sync = %f\n", sync);

	for (int i =0 ;i <nb_phase; i++ ){
		int8_t I = report->sample[i+8].i; 
		int8_t Q = report->sample[i+8].q;
		float phase = atan2(Q,I);
		tab_phase[i]  = phase;
		//printf("Sample %d: Phase = %.6f\n", i-8,phase);
		
	}
	//printf("lambda : %f		d : %f\n", lbd, d);
	
	float dlt_phase;
	for (int i=0; i<nb_phase-1; i++){
		dlt_phase = tab_phase [i+1] - tab_phase [i];// - 4*sync;
		if(dlt_phase > pi){
			dlt_phase -= 2*pi;
		}
		if(dlt_phase < -pi){
			dlt_phase += 2*pi;
		}
		tab_dlt_phase[i] = dlt_phase;
		
		//tab_theta_est[i] = asinf((lbd*tab_dlt_phase[i])/(2*pi*d));

		printf("delta phase %d = %f \n",i, dlt_phase);
		//printf("int arcsin = %f\n",(lbd*tab_dlt_phase[i])/(2*pi*d));
		//printf("diff %d  = %f\n",i+1,tab_dlt_phase[i]) ;
		//printf("theta estime %d  = %f\n",i,tab_theta_est[i]) ;
		
		//sum += dlt_phase; 
	}
	///////////delta phase matrix
	/*float avg;
	int div;
	for (int i =0 ;i <4; i++ ){
		for (int j =0 ;j <4; j++ ){
			avg = 0;
			div = 0;
			for (int k =0 ;k <nb_phase-3; k+=4 ){
				dlt_phase = tab_phase [k+j] - tab_phase [k+i];
				if(dlt_phase > pi){
					dlt_phase -= 2*pi;
				}
				if(dlt_phase < -pi){
					dlt_phase += 2*pi;
				}
				avg+=fabsf(dlt_phase);
				avg += dlt_phase;
				div++;
				
			}
			//printf("%d ", div);
			printf("%5.2f ", avg/div);
		}
		printf("\n");
	}*/

	float sum = 0;
	int div = 0;
	for (int i=0; i<nb_phase-1; i+=4){
		sum+=tab_dlt_phase[i];
		div++;
	}
	
	float dlt_mean = sum/(div);
	printf("dlt_mean = %f\n", dlt_mean);
	theta_mean = asinf((lbd*dlt_mean)/(2*pi*d));
	return(theta_mean);
}
//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
static void cte_recv_cb(struct bt_le_per_adv_sync *sync,
                        struct bt_df_per_adv_sync_iq_samples_report const *report)
{
    int i;

    printk("CTE[%u]: samples count %d, cte type %s, slot durations: %u [us], "
           "packet status %s, RSSI %i\n",
           bt_le_per_adv_sync_get_index(sync), report->sample_count,
           cte_type2str(report->cte_type), report->slot_durations,
           packet_status2str(report->packet_status), report->rssi);

    // Vérification du type d'échantillons
    if (report->sample_type == BT_DF_IQ_SAMPLE_8_BITS_INT) {
		
		theta = theta_est(report);
		printf("theta moyen = %f\n\n",theta*180/pi);


    } else if (report->sample_type == BT_DF_IQ_SAMPLE_16_BITS_INT) {
        // Affichage des phases pour des échantillons IQ 16 bits
        for (i = 0; i < report->sample_count; i++) {
            int16_t I = report->sample16[i].i; // Composante In-phase
            int16_t Q = report->sample16[i].q; // Composante Quadrature

            // Calcul de la phase (en radians) de l'échantillon IQ
            float phase = atan2f(Q,I);

            // Convertir la phase en degrés pour une meilleure lisibilité
            double phase_deg = phase * (180.0/ M_PI);
			printf("!!16 Bit!!, phase = %f\n", phase_deg);
			
        }
    } else {
        printk("Unknown IQ sample type.\n");
    }
}
//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

static struct bt_le_per_adv_sync_cb sync_callbacks = {
	.synced = sync_cb,
	.term = term_cb,
	.recv = recv_cb,
	.cte_report_cb = cte_recv_cb,
};

static void scan_recv(const struct bt_le_scan_recv_info *info,
		      struct net_buf_simple *buf)
{
	char le_addr[BT_ADDR_LE_STR_LEN];
	char name[PEER_NAME_LEN_MAX];

	(void)memset(name, 0, sizeof(name));

	bt_data_parse(buf, data_cb, name);

	bt_addr_le_to_str(info->addr, le_addr, sizeof(le_addr));

	// printk("[DEVICE]: %s, AD evt type %u, Tx Pwr: %i, RSSI %i %s C:%u S:%u "
	//        "D:%u SR:%u E:%u Prim: %s, Secn: %s, Interval: 0x%04x (%u ms), "
	//        "SID: %u\n",
	//        le_addr, info->adv_type, info->tx_power, info->rssi, name,
	//        (info->adv_props & BT_GAP_ADV_PROP_CONNECTABLE) != 0,
	//        (info->adv_props & BT_GAP_ADV_PROP_SCANNABLE) != 0,
	//        (info->adv_props & BT_GAP_ADV_PROP_DIRECTED) != 0,
	//        (info->adv_props & BT_GAP_ADV_PROP_SCAN_RESPONSE) != 0,
	//        (info->adv_props & BT_GAP_ADV_PROP_EXT_ADV) != 0, phy2str(info->primary_phy),
	//        phy2str(info->secondary_phy), info->interval, adv_interval_to_ms(info->interval),
	//        info->sid);

	if (!per_adv_found && info->interval) {
		sync_create_timeout_ms =
			adv_interval_to_ms(info->interval) * SYNC_CREATE_TIMEOUT_INTERVAL_NUM;
		per_adv_found = true;
		per_sid = info->sid;
		bt_addr_le_copy(&per_addr, info->addr);

		k_sem_give(&sem_per_adv);
	}
}

static struct bt_le_scan_cb scan_callbacks = {
	.recv = scan_recv,
};

static void create_sync(void)
{
	struct bt_le_per_adv_sync_param sync_create_param;
	int err;

	printk("Creating Periodic Advertising Sync...");
	bt_addr_le_copy(&sync_create_param.addr, &per_addr);
	sync_create_param.options = 0;
	sync_create_param.sid = per_sid;
	sync_create_param.skip = 0;
	sync_create_param.timeout = 0xa;
	err = bt_le_per_adv_sync_create(&sync_create_param, &sync);
	if (err) {
		printk("failed (err %d)\n", err);
		return;
	}
	printk("success.\n");
}

static int delete_sync(void)
{
	int err;

	printk("Deleting Periodic Advertising Sync...");
	err = bt_le_per_adv_sync_delete(sync);
	if (err) {
		printk("failed (err %d)\n", err);
		return err;
	}
	printk("success\n");

	return 0;
}

static void enable_cte_rx(void)
{
	int err;

	const struct bt_df_per_adv_sync_cte_rx_param cte_rx_params = {
		.max_cte_count = 5,
#if defined(CONFIG_BT_DF_CTE_RX_AOA)
		.cte_types = BT_DF_CTE_TYPE_ALL,
		.slot_durations = 0x2,
		.num_ant_ids = ARRAY_SIZE(ant_patterns),
		.ant_ids = ant_patterns,
#else
		.cte_types = BT_DF_CTE_TYPE_AOD_1US | BT_DF_CTE_TYPE_AOD_2US,
#endif /* CONFIG_BT_DF_CTE_RX_AOA */
	};

	printk("Enable receiving of CTE...\n");
	err = bt_df_per_adv_sync_cte_rx_enable(sync, &cte_rx_params);
	if (err) {
		printk("failed (err %d)\n", err);
		return;
	}
	printk("success. CTE receive enabled.\n");
}

static int scan_init(void)
{
	printk("Scan callbacks register...");
	bt_le_scan_cb_register(&scan_callbacks);
	printk("success.\n");

	printk("Periodic Advertising callbacks register...");
	bt_le_per_adv_sync_cb_register(&sync_callbacks);
	printk("success.\n");

	return 0;
}

static int scan_enable(void)
{
	struct bt_le_scan_param param = {
		.type = BT_LE_SCAN_TYPE_ACTIVE,
		.options = BT_LE_SCAN_OPT_FILTER_DUPLICATE,
		.interval = BT_GAP_SCAN_FAST_INTERVAL,
		.window = BT_GAP_SCAN_FAST_WINDOW,
		.timeout = 0U,
	};

	int err;

	if (!scan_enabled) {
		printk("Start scanning...");
		err = bt_le_scan_start(&param, NULL);
		if (err) {
			printk("failed (err %d)\n", err);
			return err;
		}
		printk("success\n");
		scan_enabled = true;
	}

	return 0;
}

static void scan_disable(void)
{
	int err;

	printk("Scan disable...");
	err = bt_le_scan_stop();
	if (err) {
		printk("failed (err %d)\n", err);
		return;
	}
	printk("Success.\n");

	scan_enabled = false;
}

int main(void)
{
	d = lbd/2 ;
	
	int err;

	printk("Starting Connectionless Locator Demo\n");

	printk("Bluetooth initialization...");
	err = bt_enable(NULL);
	if (err) {
		printk("failed (err %d)\n", err);
	}
	printk("success\n");

	scan_init();

	scan_enabled = false;

	while (true) {
		per_adv_found = false;
		scan_enable();

		printk("Waiting for periodic advertising...\n");
		err = k_sem_take(&sem_per_adv, K_FOREVER);
		if (err) {
			printk("failed (err %d)\n", err);
			return 0;
		}
		printk("success. Found periodic advertising.\n");

		create_sync();

		printk("Waiting for periodic sync...\n");
		err = k_sem_take(&sem_per_sync, K_MSEC(sync_create_timeout_ms));
		if (err) {
			printk("failed (err %d)\n", err);
			err = delete_sync();
			if (err) {
				return 0;
			}
			continue;
		}
		printk("success. Periodic sync established.\n");

		enable_cte_rx();

		/* Disable scan to cleanup output */
		scan_disable();

		printk("Waiting for periodic sync lost...\n");
		err = k_sem_take(&sem_per_sync_lost, K_FOREVER);
		if (err) {
			printk("failed (err %d)\n", err);
			return 0;
		}
		printk("Periodic sync lost.\n");
	}
}
