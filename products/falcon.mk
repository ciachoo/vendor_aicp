# Inherit some common AICP stuff.
$(call inherit-product, vendor/aicp/configs/common.mk)

# Inherit telephony stuff
$(call inherit-product, vendor/aicp/configs/telephony.mk)

$(call inherit-product, device/motorola/falcon/full_falcon.mk)

PRODUCT_RELEASE_NAME := MOTO G
PRODUCT_NAME := aicp_falcon

## Device identifier. This must come after all inclusions
PRODUCT_DEVICE := falcon
PRODUCT_NAME := aicp_falcon
PRODUCT_BRAND := Motorola
PRODUCT_MODEL := Moto G
PRODUCT_MANUFACTURER := Motorola

PRODUCT_GMS_CLIENTID_BASE := android-motorola

# AICP Device Maintainers
PRODUCT_BUILD_PROP_OVERRIDES += \
    DEVICE_MAINTAINERS="Shivam D (Flashhhh)"

# Boot animation
TARGET_SCREEN_HEIGHT := 1280
TARGET_SCREEN_WIDTH := 720
-include vendor/aicp/configs/bootanimation.mk
