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
  include("C:/Users/antoi/OneDrive/Bureau/Projet/projet_indus/projet_peripheral/projet_peripheral/software/rx/build/rx/zephyr/arch/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("C:/Users/antoi/OneDrive/Bureau/Projet/projet_indus/projet_peripheral/projet_peripheral/software/rx/build/rx/zephyr/lib/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("C:/Users/antoi/OneDrive/Bureau/Projet/projet_indus/projet_peripheral/projet_peripheral/software/rx/build/rx/zephyr/soc/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("C:/Users/antoi/OneDrive/Bureau/Projet/projet_indus/projet_peripheral/projet_peripheral/software/rx/build/rx/zephyr/boards/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("C:/Users/antoi/OneDrive/Bureau/Projet/projet_indus/projet_peripheral/projet_peripheral/software/rx/build/rx/zephyr/subsys/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("C:/Users/antoi/OneDrive/Bureau/Projet/projet_indus/projet_peripheral/projet_peripheral/software/rx/build/rx/zephyr/drivers/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("C:/Users/antoi/OneDrive/Bureau/Projet/projet_indus/projet_peripheral/projet_peripheral/software/rx/build/rx/modules/nrf/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("C:/Users/antoi/OneDrive/Bureau/Projet/projet_indus/projet_peripheral/projet_peripheral/software/rx/build/rx/modules/mcuboot/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("C:/Users/antoi/OneDrive/Bureau/Projet/projet_indus/projet_peripheral/projet_peripheral/software/rx/build/rx/modules/mbedtls/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("C:/Users/antoi/OneDrive/Bureau/Projet/projet_indus/projet_peripheral/projet_peripheral/software/rx/build/rx/modules/trusted-firmware-m/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("C:/Users/antoi/OneDrive/Bureau/Projet/projet_indus/projet_peripheral/projet_peripheral/software/rx/build/rx/modules/cjson/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("C:/Users/antoi/OneDrive/Bureau/Projet/projet_indus/projet_peripheral/projet_peripheral/software/rx/build/rx/modules/azure-sdk-for-c/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("C:/Users/antoi/OneDrive/Bureau/Projet/projet_indus/projet_peripheral/projet_peripheral/software/rx/build/rx/modules/cirrus-logic/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("C:/Users/antoi/OneDrive/Bureau/Projet/projet_indus/projet_peripheral/projet_peripheral/software/rx/build/rx/modules/openthread/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("C:/Users/antoi/OneDrive/Bureau/Projet/projet_indus/projet_peripheral/projet_peripheral/software/rx/build/rx/modules/suit-processor/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("C:/Users/antoi/OneDrive/Bureau/Projet/projet_indus/projet_peripheral/projet_peripheral/software/rx/build/rx/modules/memfault-firmware-sdk/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("C:/Users/antoi/OneDrive/Bureau/Projet/projet_indus/projet_peripheral/projet_peripheral/software/rx/build/rx/modules/canopennode/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("C:/Users/antoi/OneDrive/Bureau/Projet/projet_indus/projet_peripheral/projet_peripheral/software/rx/build/rx/modules/chre/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("C:/Users/antoi/OneDrive/Bureau/Projet/projet_indus/projet_peripheral/projet_peripheral/software/rx/build/rx/modules/lz4/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("C:/Users/antoi/OneDrive/Bureau/Projet/projet_indus/projet_peripheral/projet_peripheral/software/rx/build/rx/modules/nanopb/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("C:/Users/antoi/OneDrive/Bureau/Projet/projet_indus/projet_peripheral/projet_peripheral/software/rx/build/rx/modules/zscilib/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("C:/Users/antoi/OneDrive/Bureau/Projet/projet_indus/projet_peripheral/projet_peripheral/software/rx/build/rx/modules/cmsis/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("C:/Users/antoi/OneDrive/Bureau/Projet/projet_indus/projet_peripheral/projet_peripheral/software/rx/build/rx/modules/cmsis-dsp/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("C:/Users/antoi/OneDrive/Bureau/Projet/projet_indus/projet_peripheral/projet_peripheral/software/rx/build/rx/modules/cmsis-nn/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("C:/Users/antoi/OneDrive/Bureau/Projet/projet_indus/projet_peripheral/projet_peripheral/software/rx/build/rx/modules/fatfs/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("C:/Users/antoi/OneDrive/Bureau/Projet/projet_indus/projet_peripheral/projet_peripheral/software/rx/build/rx/modules/hal_nordic/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("C:/Users/antoi/OneDrive/Bureau/Projet/projet_indus/projet_peripheral/projet_peripheral/software/rx/build/rx/modules/hal_st/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("C:/Users/antoi/OneDrive/Bureau/Projet/projet_indus/projet_peripheral/projet_peripheral/software/rx/build/rx/modules/hal_wurthelektronik/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("C:/Users/antoi/OneDrive/Bureau/Projet/projet_indus/projet_peripheral/projet_peripheral/software/rx/build/rx/modules/hostap/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("C:/Users/antoi/OneDrive/Bureau/Projet/projet_indus/projet_peripheral/projet_peripheral/software/rx/build/rx/modules/libmetal/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("C:/Users/antoi/OneDrive/Bureau/Projet/projet_indus/projet_peripheral/projet_peripheral/software/rx/build/rx/modules/liblc3/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("C:/Users/antoi/OneDrive/Bureau/Projet/projet_indus/projet_peripheral/projet_peripheral/software/rx/build/rx/modules/littlefs/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("C:/Users/antoi/OneDrive/Bureau/Projet/projet_indus/projet_peripheral/projet_peripheral/software/rx/build/rx/modules/loramac-node/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("C:/Users/antoi/OneDrive/Bureau/Projet/projet_indus/projet_peripheral/projet_peripheral/software/rx/build/rx/modules/lvgl/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("C:/Users/antoi/OneDrive/Bureau/Projet/projet_indus/projet_peripheral/projet_peripheral/software/rx/build/rx/modules/mipi-sys-t/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("C:/Users/antoi/OneDrive/Bureau/Projet/projet_indus/projet_peripheral/projet_peripheral/software/rx/build/rx/modules/nrf_wifi/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("C:/Users/antoi/OneDrive/Bureau/Projet/projet_indus/projet_peripheral/projet_peripheral/software/rx/build/rx/modules/open-amp/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("C:/Users/antoi/OneDrive/Bureau/Projet/projet_indus/projet_peripheral/projet_peripheral/software/rx/build/rx/modules/picolibc/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("C:/Users/antoi/OneDrive/Bureau/Projet/projet_indus/projet_peripheral/projet_peripheral/software/rx/build/rx/modules/segger/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("C:/Users/antoi/OneDrive/Bureau/Projet/projet_indus/projet_peripheral/projet_peripheral/software/rx/build/rx/modules/tinycrypt/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("C:/Users/antoi/OneDrive/Bureau/Projet/projet_indus/projet_peripheral/projet_peripheral/software/rx/build/rx/modules/uoscore-uedhoc/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("C:/Users/antoi/OneDrive/Bureau/Projet/projet_indus/projet_peripheral/projet_peripheral/software/rx/build/rx/modules/zcbor/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("C:/Users/antoi/OneDrive/Bureau/Projet/projet_indus/projet_peripheral/projet_peripheral/software/rx/build/rx/modules/nrfxlib/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("C:/Users/antoi/OneDrive/Bureau/Projet/projet_indus/projet_peripheral/projet_peripheral/software/rx/build/rx/modules/nrf_hw_models/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("C:/Users/antoi/OneDrive/Bureau/Projet/projet_indus/projet_peripheral/projet_peripheral/software/rx/build/rx/modules/connectedhomeip/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("C:/Users/antoi/OneDrive/Bureau/Projet/projet_indus/projet_peripheral/projet_peripheral/software/rx/build/rx/zephyr/kernel/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("C:/Users/antoi/OneDrive/Bureau/Projet/projet_indus/projet_peripheral/projet_peripheral/software/rx/build/rx/zephyr/cmake/flash/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("C:/Users/antoi/OneDrive/Bureau/Projet/projet_indus/projet_peripheral/projet_peripheral/software/rx/build/rx/zephyr/cmake/usage/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("C:/Users/antoi/OneDrive/Bureau/Projet/projet_indus/projet_peripheral/projet_peripheral/software/rx/build/rx/zephyr/cmake/reports/cmake_install.cmake")
endif()

