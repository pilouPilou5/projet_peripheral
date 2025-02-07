#include <zephyr/kernel.h>
#include <zephyr/device.h>
#include <zephyr/drivers/gpio.h>
#include <zephyr/sys/util.h>
#include <zephyr/sys/printk.h>
#include <inttypes.h>

#define SLEEP_TIME_MS 1

/* Configuration du bouton SW0 (alias) */
#define SW0_NODE DT_ALIAS(sw0)
#if !DT_NODE_HAS_STATUS_OKAY(SW0_NODE)
#error "Unsupported board: sw0 devicetree alias is not defined"
#endif
static const struct gpio_dt_spec button0 = GPIO_DT_SPEC_GET_OR(SW0_NODE, gpios, {0});

/* Configuration de la LED LED0 (alias) */
static struct gpio_dt_spec led0 = GPIO_DT_SPEC_GET_OR(DT_ALIAS(led0), gpios, {0});

/* Configuration du bouton SW2 (alias) */
#define SW2_NODE DT_ALIAS(sw1)
#if !DT_NODE_HAS_STATUS_OKAY(SW2_NODE)
#error "Unsupported board: sw1 devicetree alias is not defined"
#endif
static const struct gpio_dt_spec button1 = GPIO_DT_SPEC_GET_OR(SW2_NODE, gpios, {0});

/* Configuration de la LED LED1 (alias) */
static struct gpio_dt_spec led1 = GPIO_DT_SPEC_GET_OR(DT_ALIAS(led1), gpios, {0});
/////////////////////////////////////////////////////////////////////////////////////////////
static const struct gpio_dt_spec out0 = GPIO_DT_SPEC_GET(DT_PATH(zephyr_user), out0_gpios);
static const struct gpio_dt_spec out1 = GPIO_DT_SPEC_GET(DT_PATH(zephyr_user), out1_gpios);

///////////////////////////////////////////////////////////////////////////////////////////////////////////////
void button_pressed(const struct device *dev, struct gpio_callback *cb, uint32_t pins) {
    printk("Button pressed at %" PRIu32 "\n", k_cycle_get_32());
}

int main(void) {
    int ret;

    /* Configurer le bouton SW0 */
    if (!gpio_is_ready_dt(&button0)) {
        printk("Error: button0 device %s is not ready\n", button0.port->name);
        return 0;
    }
    ret = gpio_pin_configure_dt(&button0, GPIO_INPUT);
    if (ret != 0) {
        printk("Error %d: failed to configure %s pin %d\n", ret, button0.port->name, button0.pin);
        return 0;
    }

    /* Configurer le bouton SW2 */
    if (!gpio_is_ready_dt(&button1)) {
        printk("Error: button1 device %s is not ready\n", button1.port->name);
        return 0;
    }
    ret = gpio_pin_configure_dt(&button1, GPIO_INPUT);
    if (ret != 0) {
        printk("Error %d: failed to configure %s pin %d\n", ret, button1.port->name, button1.pin);
        return 0;
    }

    /* Configurer la LED LED0 */
    if (led0.port && !gpio_is_ready_dt(&led0)) {
        printk("Error %d: LED0 device %s is not ready\n", ret, led0.port->name);
        led0.port = NULL;
    }
    if (led0.port) {
        ret = gpio_pin_configure_dt(&led0, GPIO_OUTPUT);
        if (ret != 0) {
            printk("Error %d: failed to configure LED0 device %s pin %d\n", ret, led0.port->name, led0.pin);
            led0.port = NULL;
        }
    }

    /* Configurer la LED LED1 */
    if (led1.port && !gpio_is_ready_dt(&led1)) {
        printk("Error %d: LED1 device %s is not ready\n", ret, led1.port->name);
        led1.port = NULL;
    }
    if (led1.port) {
        ret = gpio_pin_configure_dt(&led1, GPIO_OUTPUT);
        if (ret != 0) {
            printk("Error %d: failed to configure LED1 device %s pin %d\n", ret, led1.port->name, led1.pin);
            led1.port = NULL;
        }
    }

    
    if (!gpio_is_ready_dt(&out0)) {
        printk("Error: gpio_5v device %s is not ready\n", out0.port->name);
        return 0;
    }
    ret = gpio_pin_configure_dt(&out0, GPIO_OUTPUT);
    if (ret != 0) {
        printk("Error %d: failed to configure gpio_5v device %s pin %d\n", ret, out0.port->name, out0.pin);
        return 0;
    }

    if (!gpio_is_ready_dt(&out1)) {
        printk("Error: gpio_5v device %s is not ready\n", out1.port->name);
        return 0;
    }
    ret = gpio_pin_configure_dt(&out1, GPIO_OUTPUT);
    if (ret != 0) {
        printk("Error %d: failed to configure gpio_5v device %s pin %d\n", ret, out1.port->name, out1.pin);
        return 0;
    }

    printk("Press the buttons\n");
    while (1) {
        int val0 = gpio_pin_get_dt(&button0);
        int val1 = gpio_pin_get_dt(&button1);

        if (led0.port && val0 >= 0) {
            gpio_pin_set_dt(&led0, val0);
            gpio_pin_set_dt(&out0, val0);

        }
       
        if (led1.port && val1 >= 0) {
            gpio_pin_set_dt(&led1, val1);
            gpio_pin_set_dt(&out1, val1);
        }

        k_msleep(SLEEP_TIME_MS);
    }

    return 0;
}
