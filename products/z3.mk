# Inherit AICP common Phone stuff.
$(call inherit-product, vendor/aicp/configs/common.mk)

# Inherit telephony stuff
$(call inherit-product, vendor/aicp/configs/telephony.mk)

$(call inherit-product, device/sony/z3/full_z3.mk)

PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=D6603
PRODUCT_BUILD_PROP_OVERRIDES += BUILD_FINGERPRINT=Sony/leo/leo:N/NPD56N/1000106:user/release-keys
PRODUCT_BUILD_PROP_OVERRIDES += PRIVATE_BUILD_DESC="leo-user N NPD56N 1000106 release-keys"

PRODUCT_NAME := aicp_z3
PRODUCT_DEVICE := z3

# AICP Device Info
PRODUCT_BUILD_PROP_OVERRIDES += \
    DEVICE_MAINTAINERS="Marcin Flaumenhaft (†13™Ciachooツ)"

# Boot animation
TARGET_SCREEN_HEIGHT := 1280
TARGET_SCREEN_WIDTH := 720
-include vendor/aicp/configs/bootanimation.mk
