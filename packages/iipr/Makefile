# 
# Copyright (C) 2006-2011 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=iipr
PKG_VERSION:=1.0.0
PKG_RELEASE:=1

PKG_BUILD_DIR := $(BUILD_DIR)/$(PKG_NAME)

include $(INCLUDE_DIR)/package.mk

define Package/iipr
  SECTION:=utils
  CATEGORY:=Base system
  TITLE:=iipr scripts
  PKGARCH:=all
endef

define Package/iipr/description
 A set of scripts that for the sdn app
endef

define Package/iipr/conffiles
/etc/uci-defaults/luci-start
endef

define Build/Prepare
endef

define Build/Configure
endef

define Build/Compile
endef

define Package/iipr/install
	$(INSTALL_DIR) $(1)
	mkdir -p  $(1)/etc/uci-defaults
	$(CP) ./files/etc/uci-defaults/* $(1)/etc/uci-defaults/
	mkdir -p  $(1)/etc/config/
	$(CP) ./files/etc/config/* $(1)/etc/config/
	mkdir -p  $(1)/etc/openvpn
	$(CP) ./files/etc/openvpn/* $(1)/etc/openvpn/
endef

$(eval $(call BuildPackage,iipr))
