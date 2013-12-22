#
# Copyright (C) 2007-2012 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk
include $(INCLUDE_DIR)/kernel.mk

PKG_NAME:=rtl819xc

#PKG_VERSION:=v3.4.4_4749.20120806
PKG_VERSION:=v4.0.2_9000.20130911
PKG_RELEASE:=1
#PKG_SOURCE_URL:=ftp://WebUser:r3iZ6vJI@202.134.71.21/cn/wlan
PKG_SOURCE_URL:=http://iipr.com/sources/
PKG_MD5SUM:=5f15575ba6ae58cae485e8060bc771ed

#PKG_SOURCE:=RTL819xC_USB_linux_$(PKG_VERSION).zip
PKG_SOURCE:=RTL8188C_8192C_USB_linux_$(PKG_VERSION).zip
PKG_BUILD_DIR:=$(KERNEL_BUILD_DIR)/RTL8188C_8192C_USB_linux_$(PKG_VERSION)
PKG_BUILD_PARALLEL:=1

PKG_DRIVERS = 8192cu

include $(INCLUDE_DIR)/package.mk

WMENU:=Wireless Drivers

define KernelPackage/rtl819xc
	SUBMENU:=$(WMENU)
	TITLE=Realtek 8192C USB WiFi
	URL:=http://http://www.realtek.com.tw/
	DEPENDS:= +wireless-tools @USB_SUPPORT
	FILES:= $(PKG_BUILD_DIR)/8192cu.ko
	AUTOLOAD:=$(call AutoLoad,21,8192cu)
endef

define KernelPackage/rtl819xc/description
Realtek's linux drivers for the Realtek 8192C USB WiFi
endef

MAKE_OPTS:= \
	CROSS_COMPILE="$(KERNEL_CROSS)" \
	ARCH="$(LINUX_KARCH)" \
	$(foreach opt,$(CONFOPTS),CONFIG_$(opt)=m) \
	CONFIG_RTL8192CU=$(if $(CONFIG_PACKAGE_kmod-rtl819xc),m) \
	KLIB_BUILD="$(LINUX_DIR)" \
	KSRC="$(LINUX_DIR)" \
	MODPROBE=true \
	KLIB=$(TARGET_MODULES_DIR) \
	KERNEL_SUBLEVEL=$(lastword $(subst ., ,$(KERNEL_PATCHVER))) \
	KBUILD_LDFLAGS_MODULE_PREREQ=

define Build/Prepare
	rm -rf $(PKG_BUILD_DIR)
	mkdir -p $(PKG_BUILD_DIR)
	unzip -d $(PKG_BUILD_DIR)/.. $(DL_DIR)/$(PKG_SOURCE) RTL8188C_8192C_USB_linux_$(PKG_VERSION)/driver/*
	$(TAR) -C $(PKG_BUILD_DIR) -xzf $(PKG_BUILD_DIR)/driver/*.tar.gz --strip-components 1
	rm -rf $(PKG_BUILD_DIR)/driver
endef

define Build/Compile/kmod
	rm -rf $(PKG_BUILD_DIR)/modules
	$(MAKE) $(PKG_JOBS) -C "$(PKG_BUILD_DIR)" $(MAKE_OPTS) modules
endef

define Build/Compile
	$(call Build/Compile/kmod)
endef

$(eval $(call KernelPackage,rtl819xc))

