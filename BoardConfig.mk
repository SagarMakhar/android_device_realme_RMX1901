#
# Copyright (C) 2019 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from Xiaomi sdm710-common
include device/realme/sdm710-common/BoardConfigCommon.mk

DEVICE_PATH := device/realme/RMX1901

# Assert
TARGET_OTA_ASSERT_DEVICE := RMX1901

# Inherit from the proprietary version
-include vendor/realme/RMX1901/BoardConfigVendor.mk
