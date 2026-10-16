#
# Copyright (C) 2026 Mohamed Shakal
#
#
# SPDX-License-Identifier: Apache-2.0
#

LOCAL_PATH := $(call my-dir)

ifeq ($(TARGET_DEVICE),arctic)
include $(call all-subdir-makefiles,$(LOCAL_PATH))
endif
