#
# Copyright (C) 2019 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

#
# This file sets variables that control the way modules are built
# thorughout the system. It should not be used to conditionally
# disable makefiles (the proper mechanism to control what gets
# included in a build is to use PRODUCT_PACKAGES in a product
# definition file).
#

$(call inherit-product, $(SRC_TARGET_DIR)/product/product_launched_with_p.mk)

# Boot animation
TARGET_SCREEN_HEIGHT := 2340
TARGET_SCREEN_WIDTH := 1080

# Overlays
DEVICE_PACKAGE_OVERLAYS += \
    $(LOCAL_PATH)/overlay

# Screen density
PRODUCT_AAPT_CONFIG := normal
PRODUCT_AAPT_PREF_CONFIG := xxhdpi

# Inherit from Realme sdm710-common
$(call inherit-product, device/realme/sdm710-common/sdm710.mk)

# camera Motor
PRODUCT_PACKAGES += \
    lineage.camera.motor@1.0-service.realme_sdm710

# Device init scripts
PRODUCT_PACKAGES += \
    init.target.rc

# Fingerprint
PRODUCT_PACKAGES += \
    lineage.biometrics.fingerprint.inscreen@1.0-service.realme_sdm710 \
    vendor.appo.hardware.biometrics.fingerprint@2.1

PRODUCT_COPY_FILES += \
    vendor/lineage/config/permissions/vendor.lineage.biometrics.fingerprint.inscreen.xml:system/etc/permissions/vendor.lineage.biometrics.fingerprint.inscreen.xml


# HIDL
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/manifest.xml:system/etc/manifest.xml

# Media
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/media_profiles_vendor.xml:system/etc/media_profiles_vendor.xml

# Properties
-include $(LOCAL_PATH)/device-props.mk

# Sensors
PRODUCT_PACKAGES += \
android.hardware.sensors@1.0-impl.realme_sdm710

# Inherit from proprietary version
$(call inherit-product-if-exists, vendor/realme/RMX1901/RMX1901-vendor.mk)
