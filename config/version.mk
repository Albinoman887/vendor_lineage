PRODUCT_VERSION_MAJOR = 13
PRODUCT_VERSION_MINOR = 0

SIGMA_VERSION := 0.1
SIGMA_VARIANT := Droid


SIGMA_BUILD_TYPE ?= UNOFFICIAL

# Only include Updater for official builds
ifeq ($(filter-out OFFICIAL Official official,$(SIGMA_BUILD_TYPE)),)
#PRODUCT_PACKAGES += \
#    AlphaUpdater

PRODUCT_COPY_FILES += \
    vendor/lineage/prebuilt/common/etc/init/init.lineage-updater.rc:$(TARGET_COPY_OUT_SYSTEM_EXT)/etc/init/init.lineage-updater.rc
endif

# GAPPS_BUILD_TYPE
# 0 - NO GAPPS (DEFAULT)
# 1 - CORE GAPPS
# 2 - FULL GAPPS

WITH_GAPPS ?= 0
ifeq ($(filter $(strip $(GAPPS_BUILD_TYPE)),0 1 2),)
GAPPS_BUILD_TYPE := $(strip $(WITH_GAPPS))
endif

# default to vanilla
SIGMA_BUILD_PACKAGE := vanilla

ifeq ($(strip $(GAPPS_BUILD_TYPE)),0)
# Build GmsCompat and GrapheneApps on vanilla builds
PRODUCT_PACKAGES += \
    GmsCompat \
    GmsCompatConfig \
    GrapheneApps
else
ifeq ($(strip $(GAPPS_BUILD_TYPE)),1)
SIGMA_BUILD_PACKAGE := core_gapps
else
ifeq ($(strip $(GAPPS_BUILD_TYPE)),2)
SIGMA_BUILD_PACKAGE := full_gapps
# conditionally include pixel-framework
ifneq ($(strip $(TARGET_INCLUDE_PIXEL_FRAMEWORK)),false)
$(call inherit-product-if-exists, vendor/pixel-framework/config.mk)
# Dexpreopt
PRODUCT_DEXPREOPT_SPEED_APPS += \
    SettingsGoogle \
    SystemUIGoogle
endif
endif
endif
endif
# include GMS setup
$(call inherit-product, vendor/gms/setup.mk)

# Internal version
LINEAGE_VERSION := Sigma$(SIGMA_VARIANT)-v$(SIGMA_VERSION)-$(shell date +%Y%m%d)-$(LINEAGE_BUILD)-$(SIGMA_BUILD_PACKAGE)

# Display version
LINEAGE_DISPLAY_VERSION := Sigma$(SIGMA_VARIANT)-v$(SIGMA_VERSION)-$(LINEAGE_BUILD)-$(SIGMA_BUILD_PACKAGE)
