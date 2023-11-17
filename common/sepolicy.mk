#
# This policy configuration will be used by all products that
# inherit from PixelBlaster
#

ifeq ($(TARGET_COPY_OUT_VENDOR), vendor)
ifeq ($(BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE),)
TARGET_USES_PREBUILT_VENDOR_SEPOLICY ?= true
endif
endif

SYSTEM_EXT_PUBLIC_SEPOLICY_DIRS += \
    device/blaster/sepolicy/common/public

SYSTEM_EXT_PRIVATE_SEPOLICY_DIRS += \
    device/blaster/sepolicy/common/private

ifeq ($(TARGET_USES_PREBUILT_VENDOR_SEPOLICY), true)
SYSTEM_EXT_PRIVATE_SEPOLICY_DIRS += \
    device/blaster/sepolicy/common/dynamic \
    device/blaster/sepolicy/common/system \
    hardware/google/pixel-sepolicy/flipendo \
    hardware/google/pixel-sepolicy/turbo_adapter
else
BOARD_VENDOR_SEPOLICY_DIRS += \
    device/blaster/sepolicy/common/dynamic \
    device/blaster/sepolicy/common/vendor \
    hardware/google/pixel-sepolicy/flipendo \
    hardware/google/pixel-sepolicy/turbo_adapter
endif

# Selectively include legacy rules defined by the products
-include device/blaster/sepolicy/legacy-common/sepolicy.mk

# Include atv rules on atv product
ifeq ($(PRODUCT_IS_ATV), true)
include device/blaster/sepolicy/atv/sepolicy.mk
endif
