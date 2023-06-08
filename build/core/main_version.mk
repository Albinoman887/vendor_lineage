# Build fingerprint
ifneq ($(BUILD_FINGERPRINT),)
ADDITIONAL_SYSTEM_PROPERTIES += \
    ro.build.fingerprint=$(BUILD_FINGERPRINT)
endif

# crDroid legal
ADDITIONAL_SYSTEM_PROPERTIES += \
    ro.crdroidlegal.url=https://crdroid.net/legal.php

# LineageOS Platform SDK Version
ADDITIONAL_SYSTEM_PROPERTIES += \
    ro.lineage.build.version.plat.sdk=$(LINEAGE_PLATFORM_SDK_VERSION)

# LineageOS Platform Internal Version
ADDITIONAL_SYSTEM_PROPERTIES += \
    ro.lineage.build.version.plat.rev=$(LINEAGE_PLATFORM_REV)

# Alpha properties
ADDITIONAL_SYSTEM_PROPERTIES += \
    ro.beta.build.version=$(LINEAGE_VERSION) \
    ro.beta.display.version=$(LINEAGE_DISPLAY_VERSION) \
    ro.beta.version=$(PRODUCT_VERSION_MAJOR).$(PRODUCT_VERSION_MINOR) \
    ro.beta.modversion=$(BETA_VERSION) \
    ro.beta.build.package=$(BETA_BUILD_PACKAGE) \
    ro.beta.maintainer=$(BETA_MAINTAINER) \
    ro.beta.release.type=$(BETA_BUILD_TYPE) \
    ro.modversion=$(BETA_VERSION)
