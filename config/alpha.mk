PRODUCT_BRAND ?= Alpha

# Packages
PRODUCT_PACKAGES += \
    Launcher3QuickStep \
    RepainterServicePriv

# Updater
PRODUCT_PACKAGES += \
    AlphaUpdater

PRODUCT_COPY_FILES += \
    vendor/lineage/prebuilt/common/etc/init/init.lineage-updater.rc:$(TARGET_COPY_OUT_SYSTEM_EXT)/etc/init/init.lineage-updater.rc

ifeq ($(TARGET_INCLUDE_MATLOG),true)
PRODUCT_PACKAGES += \
    MatLog
endif

# Dalvik
PRODUCT_PROPERTY_OVERRIDES += \
    pm.dexopt.boot=verify \
    pm.dexopt.first-boot=quicken \
    pm.dexopt.install=speed-profile \
    pm.dexopt.bg-dexopt=everything

# Privapp-permissions whitelist mode
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    ro.control_privapp_permissions=log

# Disable blur on app launch
PRODUCT_PRODUCT_PROPERTIES += \
    ro.launcher.blur.appLaunch=0
