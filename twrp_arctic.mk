# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Inherit some common Omni stuff.
$(call inherit-product, vendor/twrp/config/common.mk)

# Inherit from arctic device
$(call inherit-product, device/xiaomi/arctic/device.mk)

PRODUCT_DEVICE := arctic
PRODUCT_NAME := twrp_arctic
PRODUCT_BRAND := Redmi
PRODUCT_MODEL := Redmi A7 Pro
PRODUCT_MANUFACTURER := xiaomi

PRODUCT_GMS_CLIENTID_BASE := android-xiaomi

PRODUCT_BUILD_PROP_OVERRIDES += \
    PRIVATE_BUILD_DESC="miodm_arctic_global-user 13 TP1A.220624.014 OS3.0.12.0.WBVMIXM test-keys"

BUILD_FINGERPRINT := Xiaomi/missi/missi:16/BP2A.250605.031.A3/OS3.0.12.0.WBVMIXM:user/release-keys
