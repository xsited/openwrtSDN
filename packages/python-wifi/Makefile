#
# Copyright (C) 2008-2011 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=python-wifi
PKG_VERSION:=0.5.0
PKG_RELEASE:=1

#http://downloads.sourceforge.net/project/pythonwifi.berlios/python-wifi-0.5.0.tar.bz2?r=&ts=1388036164&use_mirror=softlayer-dal

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=@SF/python-wifi
PKG_MD5SUM:=eec19df59fd75ba5a136992897f8e468

PKG_BUILD_DEPENDS:=python

include $(INCLUDE_DIR)/package.mk
$(call include_mk, python-package.mk)

define Package/python-wifi
  SUBMENU:=Python
  SECTION:=lang
  CATEGORY:=Languages
  TITLE:=python-wifi
  URL:=http://python-wifi.sourceforge.net
  DEPENDS:=+python-mini
endef

define Package/pyserial/description
  wifi extensions in pure python
endef

define Build/Compile
	$(call Build/Compile/PyMod,., \
		install --prefix="/usr" --root="$(PKG_INSTALL_DIR)", \
	)
endef

define Package/pyserial/install
	$(INSTALL_DIR) $(1)$(PYTHON_PKG_DIR)
	$(CP) \
	    $(PKG_INSTALL_DIR)$(PYTHON_PKG_DIR)/* \
	    $(1)$(PYTHON_PKG_DIR)/
endef

$(eval $(call BuildPackage,python-wifi))
