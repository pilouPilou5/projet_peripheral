# Install script for directory: C:/ncs/v2.9.0/zephyr

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "C:/Program Files/Zephyr-Kernel")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "MinSizeRel")
  endif()
  message(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
endif()

# Set the component getting installed.
if(NOT CMAKE_INSTALL_COMPONENT)
  if(COMPONENT)
    message(STATUS "Install component: \"${COMPONENT}\"")
    set(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  else()
    set(CMAKE_INSTALL_COMPONENT)
  endif()
endif()

# Is this installation the result of a crosscompile?
if(NOT DEFINED CMAKE_CROSSCOMPILING)
  set(CMAKE_CROSSCOMPILING "TRUE")
endif()

# Set default install directory permissions.
if(NOT DEFINED CMAKE_OBJDUMP)
  set(CMAKE_OBJDUMP "C:/ncs/toolchains/b620d30767/opt/zephyr-sdk/arm-zephyr-eabi/bin/arm-zephyr-eabi-objdump.exe")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("C:/Users/antoi/OneDrive/Bureau/Projet/projet_indus/projet_peripheral/projet_peripheral/software/tx/build/tx/zephyr/arch/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("C:/Users/antoi/OneDrive/Bureau/Projet/projet_indus/projet_peripheral/projet_peripheral/software/tx/build/tx/zephyr/lib/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("C:/Users/antoi/OneDrive/Bureau/Projet/projet_indus/projet_peripheral/projet_peripheral/software/tx/build/tx/zephyr/soc/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("C:/Users/antoi/OneDrive/Bureau/Projet/projet_indus/projet_peripheral/projet_peripheral/software/tx/build/tx/zephyr/boards/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("C:/Users/antoi/OneDrive/Bureau/Projet/projet_indus/projet_peripheral/projet_peripheral/software/tx/build/tx/zephyr/subsys/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("C:/Users/antoi/OneDrive/Bureau/Projet/projet_indus/projet_peripheral/projet_peripheral/software/tx/build/tx/zephyr/drivers/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("C:/Users/antoi/OneDrive/Bureau/Projet/projet_indus/projet_peripheral/projet_peripheral/software/tx/build/tx/modules/nrf/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("C:/Users/antoi/OneDrive/Bureau/Projet/projet_indus/projet_peripheral/projet_peripheral/software/tx/build/tx/modules/mcuboot/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("C:/Users/antoi/OneDrive/Bureau/Projet/projet_indus/projet_peripheral/projet_peripheral/software/tx/build/tx/modules/mbedtls/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("C:/Users/antoi/OneDrive/Bureau/Projet/projet_indus/projet_peripheral/projet_peripheral/software/tx/build/tx/modules/trusted-firmware-m/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("C:/Users/antoi/OneDrive/Bureau/Projet/projet_indus/projet_peripheral/projet_peripheral/software/tx/build/tx/modules/cjson/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("C:/Users/antoi/OneDrive/Bureau/Projet/projet_indus/projet_peripheral/projet_peripheral/software/tx/build/tx/modules/azure-sdk-for-c/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("C:/Users/antoi/OneDrive/Bureau/Projet/projet_indus/projet_peripheral/projet_peripheral/software/tx/build/tx/modules/cirrus-logic/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("C:/Users/antoi/OneDrive/Bureau/Projet/projet_indus/projet_peripheral/projet_peripheral/software/tx/build/tx/modules/openthread/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("C:/Users/antoi/OneDrive/Bureau/Projet/projet_indus/projet_peripheral/projet_peripheral/software/tx/build/tx/modules/suit-processor/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("C:/Users/antoi/OneDrive/Bureau/Projet/projet_indus/projet_peripheral/projet_peripheral/software/tx/build/tx/modules/memfault-firmware-sdk/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("C:/Users/antoi/OneDrive/Bureau/Projet/projet_indus/projet_peripheral/projet_peripheral/software/tx/build/tx/modules/canopennode/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("C:/Users/antoi/OneDrive/Bureau/Projet/projet_indus/projet_peripheral/projet_peripheral/software/tx/build/tx/modules/chre/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("C:/Users/antoi/OneDrive/Bureau/Projet/projet_indus/projet_peripheral/projet_peripheral/software/tx/build/tx/modules/lz4/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("C:/Users/antoi/OneDrive/Bureau/Projet/projet_indus/projet_peripheral/projet_peripheral/software/tx/build/tx/modules/nanopb/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("C:/Users/antoi/OneDrive/Bureau/Projet/projet_indus/projet_peripheral/projet_peripheral/software/tx/build/tx/modules/zscilib/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("C:/Users/antoi/OneDrive/Bureau/Projet/projet_indus/projet_peripheral/projet_peripheral/software/tx/build/tx/modules/cmsis/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("C:/Users/antoi/OneDrive/Bureau/Projet/projet_indus/projet_peripheral/projet_peripheral/software/tx/build/tx/modules/cmsis-dsp/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("C:/Users/antoi/OneDrive/Bureau/Projet/projet_indus/projet_peripheral/projet_peripheral/software/tx/build/tx/modules/cmsis-nn/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("C:/Users/antoi/OneDrive/Bureau/Projet/projet_indus/projet_peripheral/projet_peripheral/software/tx/build/tx/modules/fatfs/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("C:/Users/antoi/OneDrive/Bureau/Projet/projet_indus/projet_peripheral/projet_peripheral/software/tx/build/tx/modules/hal_nordic/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("C:/Users/antoi/OneDrive/Bureau/Projet/projet_indus/projet_peripheral/projet_peripheral/software/tx/build/tx/modules/hal_st/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("C:/Users/antoi/OneDrive/Bureau/Projet/projet_indus/projet_peripheral/projet_peripheral/software/tx/build/tx/modules/hal_wurthelektronik/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("C:/Users/antoi/OneDrive/Bureau/Projet/projet_indus/projet_peripheral/projet_peripheral/software/tx/build/tx/modules/hostap/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("C:/Users/antoi/OneDrive/Bureau/Projet/projet_indus/projet_peripheral/projet_peripheral/software/tx/build/tx/modules/libmetal/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("C:/Users/antoi/OneDrive/Bureau/Projet/projet_indus/projet_peripheral/projet_peripheral/software/tx/build/tx/modules/liblc3/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("C:/Users/antoi/OneDrive/Bureau/Projet/projet_indus/projet_peripheral/projet_peripheral/software/tx/build/tx/modules/littlefs/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("C:/Users/antoi/OneDrive/Bureau/Projet/projet_indus/projet_peripheral/projet_peripheral/software/tx/build/tx/modules/loramac-node/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("C:/Users/antoi/OneDrive/Bureau/Projet/projet_indus/projet_peripheral/projet_peripheral/software/tx/build/tx/modules/lvgl/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("C:/Users/antoi/OneDrive/Bureau/Projet/projet_indus/projet_peripheral/projet_peripheral/software/tx/build/tx/modules/mipi-sys-t/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("C:/Users/antoi/OneDrive/Bureau/Projet/projet_indus/projet_peripheral/projet_peripheral/software/tx/build/tx/modules/nrf_wifi/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("C:/Users/antoi/OneDrive/Bureau/Projet/projet_indus/projet_peripheral/projet_peripheral/software/tx/build/tx/modules/open-amp/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("C:/Users/antoi/OneDrive/Bureau/Projet/projet_indus/projet_peripheral/projet_peripheral/software/tx/build/tx/modules/picolibc/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("C:/Users/antoi/OneDrive/Bureau/Projet/projet_indus/projet_peripheral/projet_peripheral/software/tx/build/tx/modules/segger/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("C:/Users/antoi/OneDrive/Bureau/Projet/projet_indus/projet_peripheral/projet_peripheral/software/tx/build/tx/modules/tinycrypt/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("C:/Users/antoi/OneDrive/Bureau/Projet/projet_indus/projet_peripheral/projet_peripheral/software/tx/build/tx/modules/uoscore-uedhoc/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("C:/Users/antoi/OneDrive/Bureau/Projet/projet_indus/projet_peripheral/projet_peripheral/software/tx/build/tx/modules/zcbor/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("C:/Users/antoi/OneDrive/Bureau/Projet/projet_indus/projet_peripheral/projet_peripheral/software/tx/build/tx/modules/nrfxlib/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("C:/Users/antoi/OneDrive/Bureau/Projet/projet_indus/projet_peripheral/projet_peripheral/software/tx/build/tx/modules/nrf_hw_models/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("C:/Users/antoi/OneDrive/Bureau/Projet/projet_indus/projet_peripheral/projet_peripheral/software/tx/build/tx/modules/connectedhomeip/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("C:/Users/antoi/OneDrive/Bureau/Projet/projet_indus/projet_peripheral/projet_peripheral/software/tx/build/tx/zephyr/kernel/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("C:/Users/antoi/OneDrive/Bureau/Projet/projet_indus/projet_peripheral/projet_peripheral/software/tx/build/tx/zephyr/cmake/flash/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("C:/Users/antoi/OneDrive/Bureau/Projet/projet_indus/projet_peripheral/projet_peripheral/software/tx/build/tx/zephyr/cmake/usage/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("C:/Users/antoi/OneDrive/Bureau/Projet/projet_indus/projet_peripheral/projet_peripheral/software/tx/build/tx/zephyr/cmake/reports/cmake_install.cmake")
endif()
