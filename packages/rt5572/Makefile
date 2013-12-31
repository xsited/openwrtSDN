#
# Copyright (C) 2012 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk
include $(INCLUDE_DIR)/kernel.mk

PKG_NAME:=rt5572
PKG_VERSION:=2.6.1
PKG_RELEASE:=3

PKG_BUILD_PARALLEL:=1

include $(INCLUDE_DIR)/package.mk

define KernelPackage/rt5572
  SUBMENU:=Wireless Drivers
  TITLE:=Ralink rt5572 WiFi
  FILES:= \
	$(PKG_BUILD_DIR)/RT2870STA.dat \
	$(PKG_BUILD_DIR)/os/linux/rt5572sta.ko
  MAINTAINER:=xsited@yahoo.com
  AUTOLOAD:=$(call AutoLoad,50, rt5572)
endef

define KernelPackage/rt5572/description
  Driver for Ralink rt5572 wireless devices.
endef

WFLAGS=-DRTMP_MAC_USB -DRT30xx -DRT33xx -DRT3070 -DRT3370 -DRT5370 -DRTMP_USB_SUPPORT -DRTMP_TIMER_TASK_SUPPORT -DRTMP_RF_RW_SUPPORT -DRTMP_EFUSE_SUPPORT -DRTMP_INTERNAL_TX_ALC -DRTMP_FREQ_CALIBRATION_SUPPORT -DVCORECAL_SUPPORT -DIQ_CAL_SUPPORT -DRTMP_TEMPERATURE_COMPENSATION -DDOT11_N_SUPPORT -DCONFIG_RA_NAT_NONE -DDBG -DA_BAND_SUPPORT -DCONFIG_STA_SUPPORT

#-DEXT_BUILD_CHANNEL_LIST

MAKE_OPTS:= \
	ARCH="$(LINUX_KARCH)" \
	CROSS_COMPILE="$(TARGET_CROSS)" \
	EXTRA_CFLAGS="-DCONFIG_LITTLE_ENDIAN -I$(PKG_BUILD_DIR)/include -DLINUX -DCONFIG_STA_SUPPORT $(WFLAGS)" \
	LINUX_SRC=$(LINUX_DIR) \
	KSRC=$(LINUX_DIR)

define Build/Prepare
	mkdir -p $(PKG_BUILD_DIR)
	$(CP) ./src/* $(PKG_BUILD_DIR)/
	$(Build/Patch)
endef

define Build/Compile
	$(MAKE) $(PKG_JOBS) -C $(PKG_BUILD_DIR) $(MAKE_OPTS)

endef

define KernelPackage/rt5572/install
	mkdir -p $(1)/etc/Wireless/RT2870STA/
	$(INSTALL_DATA) $(PKG_BUILD_DIR)/RT2870STA.dat $(1)/etc/Wireless/RT2870STA/
endef

$(eval $(call KernelPackage,rt5572))

