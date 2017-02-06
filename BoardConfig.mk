#
# Copyright (C) 2015 The Android Open-Source Project
# Copyright (C) 2016 Jonathan Jason Dennis (theonejohnnyd@gmail.com)
# Copyright (C) 2017 Carsten Schlote (schlote@vahanus.net)
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

TARGET_BOARD_PLATFORM := hi6250
TARGET_BOOTLOADER_BOARD_NAME := hisi

TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-a
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_ABI2 :=
TARGET_CPU_VARIANT := cortex-a53
TARGET_BOARD_GPU := mali-t830mp2

TARGET_2ND_ARCH := arm
TARGET_2ND_ARCH_VARIANT := armv7-a-neon
TARGET_2ND_CPU_ABI := armeabi-v7a
TARGET_2ND_CPU_ABI2 := armeabi
TARGET_2ND_CPU_VARIANT := cortex-a15

ENABLE_CPUSETS := true

# Inline kernel building
BOARD_KERNEL_IMAGE_NAME := Image.gz-dtb
TARGET_KERNEL_SOURCE := kernel/huawei/hi6250
TARGET_KERNEL_CONFIG := merge_hi6250_defconfig

TARGET_KERNEL_ARCH := arm64
TARGET_KERNEL_HEADER_ARCH := arm64
TARGET_KERNEL_CROSS_COMPILE_PREFIX := aarch64-linux-android-
TARGET_USES_UNCOMPRESSED_KERNEL := true

BOARD_KERNEL_BASE        := 0x00478000
BOARD_KERNEL_PAGESIZE    := 2048
BOARD_KERNEL_TAGS_OFFSET := 0x07588000
BOARD_RAMDISK_OFFSET     := 0x07b88000

BOARD_KERNEL_CMDLINE := loglevel=4 coherent_pool=512K mmcparts=mmcblk0:p1(vrl),p2(vrl_backup),p6(modemnvm_factory),p10(modemnvm_backup),p11(modemnvm_img),p12(modemnvm_system),p18(modem_om),p21(modemnvm_update),p31(modem_fw) no_console_suspend androidboot.selinux=permissive
BOARD_MKBOOTIMG_ARGS := --kernel_offset $(BOARD_KERNEL_BASE) --ramdisk_offset $(BOARD_RAMDISK_OFFSET) --tags_offset $(BOARD_KERNEL_TAGS_OFFSET)

BOARD_USES_ALSA_AUDIO := true

# Needed for VoLTE
AUDIO_FEATURE_ENABLED_MULTI_VOICE_SESSIONS := true
AUDIO_FEATURE_ENABLED_DSM_FEEDBACK := true

BOARD_SUPPORTS_SOUND_TRIGGER := true

BOARD_HAVE_BLUETOOTH := true
BOARD_HAVE_BLUETOOTH_BCM := true
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := device/huawei/angler/bluetooth

BOARD_USES_SECURE_SERVICES := true

BOARD_NEEDS_VENDORIMAGE_SYMLINK := true

TARGET_KEYMASTER_WAIT_FOR_QSEE := true

TARGET_NO_BOOTLOADER := true
TARGET_NO_RADIOIMAGE := true
TARGET_BOARD_INFO_FILE := device/huawei/hi6250/board-info.txt
TARGET_NO_RPC := true

BOARD_EGL_CFG := device/huawei/hi6250/egl.cfg

# Shader cache config options
# Maximum size of the  GLES Shaders that can be cached for reuse.
# Increase the size if shaders of size greater than 12KB are used.
MAX_EGL_CACHE_KEY_SIZE := 12*1024

# Maximum GLES shader cache size for each app to store the compiled shader
# binaries. Decrease the size if RAM or Flash Storage size is a limitation
# of the device.
MAX_EGL_CACHE_SIZE := 2048*1024

USE_OPENGL_RENDERER := true
TARGET_USES_ION := true
TARGET_USES_C2D_COMPOSITION := true
TARGET_FORCE_HWC_FOR_VIRTUAL_DISPLAYS := true
MAX_VIRTUAL_DISPLAY_DIMENSION := 2048

HAVE_ADRENO_SOURCE:= false

OVERRIDE_RS_DRIVER:= libRSDriver_adreno.so
BOARD_CHARGER_DISABLE_INIT_BLANK := true
# Enable auto suspend in poweroff charging to save power
BOARD_CHARGER_ENABLE_SUSPEND := true

# Enable dex-preoptimization to speed up first boot sequence
#ifeq ($(HOST_OS),linux)
#  ifneq ($(TARGET_BUILD_VARIANT),eng)
#    ifeq ($(WITH_DEXPREOPT),)
#      WITH_DEXPREOPT := true
#    endif
#  endif
#endif

TARGET_USERIMAGES_USE_EXT4 := true
BOARD_BOOTIMAGE_PARTITION_SIZE := 33554432
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 67108864
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 2684354560
BOARD_USERDATAIMAGE_PARTITION_SIZE := 11231236096
BOARD_CACHEIMAGE_PARTITION_SIZE := fixme
BOARD_CACHEIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_FLASH_BLOCK_SIZE := 4096

BOARD_HAL_STATIC_LIBRARIES := libdumpstate.hi6250

TARGET_RECOVERY_FSTAB := device/huawei/hi6250/rootdir/fstab.hi6250
# write vendor modules to system
TARGET_COPY_OUT_VENDOR := system
TARGET_RELEASETOOLS_EXTENSIONS := device/huawei/hi6250

BOARD_SEPOLICY_DIRS += \
	device/huawei/hi6250/sepolicy

TARGET_USES_64_BIT_BINDER := true

TARGET_USES_AOSP := true

TARGET_USES_INTERACTION_BOOST := true

TARGET_RECOVERY_UI_LIB := librecovery_ui_nanohub

TARGET_USES_HISI_DTIMAGE := true
TARGET_SUPPORTS_32_BIT_APPS := true
TARGET_SUPPORTS_64_BIT_APPS := true
ANDROID_64=true

TARGET_SPECIFIC_HEADER_PATH := device/huawei/hi6250/include
TARGET_OTA_ASSERT_DEVICE := hi6250,VNS,nemo

HISI_TARGET_PRODUCT := hi6250
TARGET_ARM_TYPE := arm64

# Init
TARGET_INIT_VENDOR_LIB := libhuawei_init

# Linker
LD_SHIM_LIBS := '/system/lib64/libcutils.so|libshim.so:/system/lib/libcutils.so|libshim.so:/system/lib64/liblog.so|libshim.so:/system/lib/liblog.so|libshim.so:/system/lib64/libexif.so|libshim.so:/system/lib/libexif.so|libshim.so:/system/lib64/libaudio_route.so|libshim.so:/system/lib/libaudio_route.so|libshim.so'

# RIL
BOARD_PROVIDES_LIBRIL := true
BOARD_PROVIDES_RILD := true
BOARD_PROVIDES_LIBREFERENCE_RIL := true
BOARD_RIL_CLASS := ../../../device/huawei/hi6250/ril/
SIM_COUNT := 2


# Surfaceflinger
NUM_FRAMEBUFFER_SURFACE_BUFFERS := 6


# OTA
BLOCK_BASED_OTA := false

# Wifi related defines
WPA_SUPPLICANT_VERSION := VER_0_8_X
BOARD_HOSTAPD_DRIVER := NL80211

# Screen
TARGET_SCREEN_HEIGHT := 1920
TARGET_SCREEN_WIDTH := 1080

# Audio
BOARD_USES_ALSA_AUDIO := true

# Define kind of DPI
PRODUCT_AAPT_CONFIG := normal xxhdpi
PRODUCT_AAPT_PREF_CONFIG := xxhdpi

# Charger 
BOARD_CHARGER_DISABLE_INIT_BLANK := true
BACKLIGHT_PATH := "/sys/class/leds/lcd_backlight0/brightness"
HEALTHD_BACKLIGHT_LEVEL := 102

# TWRP Recovery defines
# RECOVERY_VARIANT := twrp
DEVICE_RESOLUTION := 1080x1920
TW_THEME := portrait_mdpi
TW_CUSTOM_BATTERY_PATH := "/sys/devices/battery.5/power_supply/Battery" 

RECOVERY_SDCARD_ON_DATA := true
TW_INTERNAL_STORAGE_PATH := "/data/media"
TW_INTERNAL_STORAGE_MOUNT_POINT := "/emmc"
TW_EXTERNAL_STORAGE_PATH := "/sdcard"
TW_EXTERNAL_STORAGE_MOUNT_POINT := "/sdcard"
TW_BRIGHTNESS_PATH := "/sys/class/leds/lcd_backlight0/brightness"
TW_MAX_BRIGHTNESS := 255
TW_INCLUDE_CRYPTO := true
TW_CRYPTO_FS_TYPE := "ext4"
TW_CRYPTO_REAL_BLKDEV := "/dev/block/platform/hi_mci.0/by-name/userdata"
TW_CRYPTO_MNT_POINT := "/data"
TW_CRYPTO_FS_OPTIONS := "noatime,nosuid,nodev,discard,noauto_da_alloc,journal_async_commit,errors=panic    wait,check"
TW_CRYPTO_FS_FLAGS := "0x00000406"
TW_CRYPTO_KEY_LOC := "footer"
TW_USE_TOOLBOX := true
TW_EXCLUDE_SUPERSU := false
TW_EXTRA_LANGUAGES := true

#NFC
BOARD_NFC_CHIPSET := pn548
TARGET_USES_NQ_NFC := true

# Testing related defines
BOARD_PERFSETUP_SCRIPT := platform_testing/scripts/perf-setup/hi6250-setup.sh

USE_CLANG_PLATFORM_BUILD := true

# CMHW
BOARD_USES_CYANOGEN_HARDWARE := true
BOARD_HARDWARE_CLASS := \
    hardware/cyanogen/cmhw \
    device/huawei/angler/cmhw

-include vendor/huawei/hi6250/BoardConfigVendor.mk
