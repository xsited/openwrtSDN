#
# Copyright (C) 2012 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=tweepy
PKG_VERSION:=2.1
#PKG_RELEASE:=2

PKG_SOURCE:=tweepy-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://pypi.python.org/packages/source/t/tweepy/
PKG_MD5SUM:=529819cc8a0b283b7b47470ceb06cd16

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)
PKG_BUILD_DEPENDS:=python

include $(INCLUDE_DIR)/package.mk
$(call include_mk, python-package.mk)

define Package/python-tweepy
  SUBMENU:=Python
  SECTION:=lang
  CATEGORY:=Languages
  TITLE:=python-tweepy
  URL:=https://github.com/tweepy/tweepy
  DEPENDS:=+python
  MAINTAINER:=xsited@yahoo.com
endef

define Package/python-tweepy/description
  A Python library for accessing the Twitter API
endef

define Build/Compile
	$(INSTALL_DIR) $(PKG_INSTALL_DIR)$(PYTHON_PKG_DIR)
	$(CP) \
		$(PKG_BUILD_DIR)/tweepy \
       		$(PKG_INSTALL_DIR)$(PYTHON_PKG_DIR)
endef

define Package/python-tweepy/install
	$(INSTALL_DIR) $(1)$(PYTHON_PKG_DIR)
	$(CP) \
		$(PKG_INSTALL_DIR)$(PYTHON_PKG_DIR)/tweepy \
		$(1)$(PYTHON_PKG_DIR)
endef

$(eval $(call BuildPackage,python-tweepy))
