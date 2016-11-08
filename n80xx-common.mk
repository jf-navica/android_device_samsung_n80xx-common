#
# Copyright (C) 2012 The CyanogenMod Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

DEVICE_PACKAGE_OVERLAYS += device/samsung/n80xx-common/overlay-common

PRODUCT_AAPT_CONFIG := xlarge
PRODUCT_AAPT_PREF_CONFIG := mdpi

TARGET_SCREEN_HEIGHT := 800
TARGET_SCREEN_WIDTH := 1280

# Init files
PRODUCT_COPY_FILES += \
    device/samsung/n80xx-common/ueventd.smdk4x12.rc:root/ueventd.smdk4x12.rc \
    device/samsung/n80xx-common/ueventd.smdk4x12.rc:recovery/root/ueventd.smdk4x12.rc \
    device/samsung/n80xx-common/fstab.smdk4x12:root/fstab.smdk4x12 \
    device/samsung/n80xx-common/twrp.fstab:recovery/root/etc/twrp.fstab

# Recovery
# TWRP specific build flags
DEVICE_RESOLUTION := 1280x800
TW_INTERNAL_STORAGE_PATH := "/data/media"
TW_INTERNAL_STORAGE_MOUNT_POINT := "data"
TW_EXTERNAL_STORAGE_PATH := "/external_sdcard"
TW_EXTERNAL_STORAGE_MOUNT_POINT := "external_sdcard"
RECOVERY_SDCARD_ON_DATA := true
BOARD_HAS_NO_REAL_SDCARD := true
PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0
TW_NO_USB_STORAGE := true
TWRP_EVENT_LOGGING := false
TW_IGNORE_MAJOR_AXIS_0 := true
TW_MAX_BRIGHTNESS := 255
TW_BRIGHTNESS_PATH := /sys/class/backlight/panel/brightness
TARGET_RECOVERY_FSTAB := device/samsung/n80xx-common/fstab.smdk4x12
RECOVERY_FSTAB_VERSION := 2

# Audio
PRODUCT_COPY_FILES += \
    device/samsung/n80xx-common/configs/audio_policy.conf:system/etc/audio_policy.conf \
    device/samsung/n80xx-common/configs/tiny_hw.xml:system/etc/sound/n80xx
        
# Camera
PRODUCT_COPY_FILES += \
    device/samsung/n80xx-common/configs/media_profiles.xml:system/etc/media_profiles.xml

PRODUCT_PROPERTY_OVERRIDES += \
    camera2.portability.force_api=1
    
# ART
PRODUCT_PROPERTY_OVERRIDES += \
    dalvik.vm.dex2oat-flags=--no-watch-dog \
    dalvik.vm.dex2oat-swap=false

# I/O Scheduler
PRODUCT_PROPERTY_OVERRIDES += \
    sys.io.scheduler=cfq

# Stlport
PRODUCT_PACKAGES += \
    libstlport

# Packages
PRODUCT_PACKAGES += \
    camera.smdk4x12 \
    Snap \
    libhwjpeg \
    libsecril-client

# RIL
PRODUCT_PACKAGES += \
    libsamsung_symbols \
    ril-wrapper

# shim libs for gpsd
PRODUCT_PACKAGES += \
    libn80xx

# IR packages
PRODUCT_PACKAGES += \
    consumerir.exynos4

# f2fs
PRODUCT_PACKAGES += \
    fibmap.f2fs \
    fsck.f2fs \
    mkfs.f2fs

# Power
# PRODUCT_PACKAGES += \
#    power.smdk4x12

PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.consumerir.xml:system/etc/permissions/android.hardware.consumerir.xml    

# These are the hardware-specific features
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/tablet_core_hardware.xml:system/etc/permissions/tablet_core_hardware.xml

# Set product characteristic to tablet, needed for some ui elements
PRODUCT_CHARACTERISTICS := tablet

$(call inherit-product, frameworks/native/build/tablet-10in-xhdpi-2048-dalvik-heap.mk)

$(call inherit-product, device/samsung/smdk4412-common/common.mk)

$(call inherit-product-if-exists, vendor/samsung/n80xx/n80xx-vendor.mk)
