#
# Copyright (C) 2012 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=scapy
PKG_VERSION:=2.2.0
#PKG_RELEASE:=dev

PKG_SOURCE:=scapy-$(PKG_VERSION)-dev.tar.gz
PKG_SOURCE_URL:=https://pypi.python.org/packages/source/s/scapy/
PKG_MD5SUM:=1a5115d1f33548501d01d735bd689f13

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)-dev
PKG_BUILD_DEPENDS:=python

include $(INCLUDE_DIR)/package.mk
$(call include_mk, python-package.mk)

define Package/python-scapy
  SUBMENU:=Python
  SECTION:=lang
  CATEGORY:=Languages
  TITLE:=python-scapy
  URL:=http://www.secdev.org/projects/scapy/
  DEPENDS:=+python +libpcap +libdnet +pypcap
  MAINTAINER:=xsited@yahoo.com
endef

define Package/python-scapy/description
  Scapy is a powerful interactive packet manipulation program.
endef

define Build/Compile
	$(INSTALL_DIR) $(PKG_INSTALL_DIR)$(PYTHON_PKG_DIR)
	$(CP) \
		$(PKG_BUILD_DIR)/scapy \
       		$(PKG_INSTALL_DIR)$(PYTHON_PKG_DIR)
endef

define Package/python-scapy/install
	$(INSTALL_DIR) $(1)$(PYTHON_PKG_DIR)
	$(INSTALL_DIR) $(1)/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/bin/scapy $(1)/bin/
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/bin/UTscapy $(1)/bin/
	$(CP) \
		$(PKG_INSTALL_DIR)$(PYTHON_PKG_DIR)/scapy \
		$(1)$(PYTHON_PKG_DIR)
endef

$(eval $(call BuildPackage,python-scapy))

