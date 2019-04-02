# Copyright (C) 2017 AquariOS
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

# Boot animation
TARGET_SCREEN_HEIGHT := 1920
TARGET_SCREEN_WIDTH := 1080

# Inherit some common Havoc stuff.
include vendor/bootleggers/config/common_full_phone.mk

# Inherit from the common Open Source product configuration
$(call inherit-product, $(SRC_TARGET_DIR)/product/aosp_base_telephony.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)

# Call some device specific files for walleye
$(call inherit-product, device/google/walleye/device-walleye.mk)
$(call inherit-product, vendor/google/walleye/walleye-vendor.mk)

# Add gapps
$(call inherit-product-if-exists, vendor/pixelgapps/pixel-gapps.mk)

# Audio effects
PRODUCT_COPY_FILES += \
    device/google/walleye/audio_effects.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_effects.xml
# Include AmbientSense if it's available
-include vendor/ambientmusic/AmbientMusic.mk

# Override AOSP build properties
PRODUCT_NAME := bootleg_walleye
PRODUCT_DEVICE := walleye
PRODUCT_BRAND := Google
PRODUCT_MODEL := Pixel 2
PRODUCT_MANUFACTURER := Google

# Device Fingerprint
PRODUCT_BUILD_PROP_OVERRIDES += \
    PRODUCT_NAME=walleye \
    BUILD_FINGERPRINT=google/walleye/walleye:9/PQ2A.190405.003/5310204:user/release-keys \
    PRIVATE_BUILD_DESC="walleye-user 9 PQ2A.190405.003 5310204 release-keys"

# Maintainer Prop
PRODUCT_PROPERTY_OVERRIDES += \
    ro.bootleggers.maintainer=slothdabski

TARGET_DEVICE := walleye

BOOTLEGGERS_BUILD_TYPE := Shishufied
