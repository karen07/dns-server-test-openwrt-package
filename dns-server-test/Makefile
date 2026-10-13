include $(TOPDIR)/rules.mk

PKG_NAME:=dns-server-test
PKG_VERSION:=1.0.0
PKG_RELEASE:=1

# Local sources are located next to the *-openwrt-package repository.
PKG_LOCAL_SOURCE_DIR:=$(abspath $(realpath $(CURDIR))/../../$(PKG_NAME))

ifeq ($(wildcard $(PKG_LOCAL_SOURCE_DIR)/CMakeLists.txt),)
PKG_SOURCE_PROTO:=git
PKG_SOURCE_URL:=https://github.com/karen07/dns-server-test
PKG_SOURCE_VERSION:=v$(PKG_VERSION)
PKG_MIRROR_HASH:=skip
endif

PKG_LICENSE:=AGPL-3.0-or-later
PKG_LICENSE_FILES:=LICENSE
PKG_MAINTAINER:=Karen Khachatryan <karen0734@gmail.com>

include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/cmake.mk

define Package/dns-server-test
  SECTION:=net
  CATEGORY:=Network
  DEPENDS:=
  TITLE:=DNS server from cache
  URL:=https://github.com/karen07/dns-server-test
endef

define Package/dns-server-test/description
  DNS server from cache
endef

ifneq ($(wildcard $(PKG_LOCAL_SOURCE_DIR)/CMakeLists.txt),)
define Build/Prepare
	mkdir -p $(PKG_BUILD_DIR)
	$(CP) $(PKG_LOCAL_SOURCE_DIR)/. $(PKG_BUILD_DIR)/
endef
endif

define Package/dns-server-test/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/dns-server-test $(1)/usr/bin/dns-server-test
endef

$(eval $(call BuildPackage,dns-server-test))
