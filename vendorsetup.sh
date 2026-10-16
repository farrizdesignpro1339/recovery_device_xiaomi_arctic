# Lunch combos (legacy 12.1/14.1; di 16.0 lunch via release config, tetap harmless)
add_lunch_combo twrp_arctic-user
add_lunch_combo twrp_arctic-userdebug
add_lunch_combo twrp_arctic-eng

#
# This file is part of the OrangeFox Recovery Project
# Copyright (C) 2021-2026 The OrangeFox Recovery Project
#
# OrangeFox is free software, licensed under GPLv3.
#

FDEVICE="arctic"

fox_get_target_device() {
  if echo "$BASH_SOURCE" | grep -q "/$FDEVICE/"; then
      FOX_BUILD_DEVICE="$FDEVICE"
  elif set | grep BASH_ARGV | grep -w "$FDEVICE"; then
      FOX_BUILD_DEVICE="$FDEVICE"
  elif echo "${BASH_SOURCE[0]}" | grep -q "/$FDEVICE/"; then
      FOX_BUILD_DEVICE="$FDEVICE"
  elif echo "$0" | grep -q "$FDEVICE"; then
      FOX_BUILD_DEVICE="$FDEVICE"
  fi
}

if [ -z "$1" -a -z "$FOX_BUILD_DEVICE" ]; then
   fox_get_target_device
fi

if [ "$1" = "$FDEVICE" -o "$FOX_BUILD_DEVICE" = "$FDEVICE" ]; then
	export FOX_BUILD_DEVICE="arctic"
	export TW_DEFAULT_LANGUAGE="en"
	export LC_ALL="C"
	export ALLOW_MISSING_DEPENDENCIES=true
	export OF_FORCE_PREBUILT_KERNEL=1

	# --- Device type: Virtual A/B + vendor_boot as recovery (header v4) ---
	# arctic: TARGET_NO_RECOVERY=true, BOARD_INCLUDE_RECOVERY_RAMDISK_IN_VENDOR_BOOT=true
	export FOX_AB_DEVICE=1
	export FOX_VIRTUAL_AB_DEVICE=1
	export FOX_VENDOR_BOOT_RECOVERY=1
	export FOX_RECOVERY_VENDOR_BOOT_PARTITION="/dev/block/by-name/vendor_boot"

	# Dynamic partitions (super)
	export FOX_RECOVERY_SYSTEM_PARTITION="/dev/block/mapper/system"
	export FOX_RECOVERY_VENDOR_PARTITION="/dev/block/mapper/vendor"

	# --- Screen: 720x1600 (~20:9), punch-hole ---
	export OF_SCREEN_H=2400
	export OF_STATUS_H=72
	export OF_HIDE_NOTCH=1
	export OF_CLOCK_POS=1
	export OF_ALLOW_DISABLE_NAVBAR=0

	# --- Binaries / shell ---
	export FOX_USE_BASH_SHELL=1
	export FOX_ASH_IS_BASH=1
	export FOX_USE_TAR_BINARY=1
	export FOX_USE_XZ_UTILS=1
	export FOX_USE_LZ4_BINARY=1
	export FOX_USE_ZSTD_BINARY=1
	export FOX_USE_BUSYBOX_BINARY=1
	export FOX_USE_DATE_BINARY=1
	export FOX_DELETE_AROMAFM=1
	export FOX_ENABLE_APP_MANAGER=1

	# --- Maintainer ---
	export OF_MAINTAINER="Mohamed Shakal"
	# export FOX_MAINTAINER_PATCH_VERSION="1"

	# Decryption masih bermasalah di tree ini (/data FBE belum work).
	# Kalau stuck di logo Fox, coba aktifkan salah satu:
	# export OF_SKIP_FBE_DECRYPTION=1
	# export OF_SKIP_FBE_DECRYPTION_SDKVERSION=35
	# export OF_DEFAULT_KEYMASTER_VERSION=4.1

	# Kalau recovery terlalu besar:
	# export OF_USE_LZMA_COMPRESSION=1
else
	if [ -z "$FOX_BUILD_DEVICE" -a -z "$BASH_SOURCE" ]; then
		echo "I: This script requires bash. Not processing the $FDEVICE $(basename $0)"
	fi
fi
