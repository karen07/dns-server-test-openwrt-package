include $(TOPDIR)/rules.mk

PKG_NAME:=dns-server-test
PKG_VERSION:=1.0.0
PKG_RELEASE:=1
PKG_LICENSE:=GPL-3.0-or-later

ifeq ("$(wildcard ../dns-server-test)", "")
PKG_SOURCE_PROTO:=git
PKG_SOURCE_URL:=https://github.com/karen07/dns-server-test.git
PKG_SOURCE_VERSION:=v$(PKG_VERSION)
endif

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

ifneq ("$(wildcard ../dns-server-test)", "")
define Build/Prepare
	mkdir -p $(PKG_BUILD_DIR)
	$(CP) ../dns-server-test/* $(PKG_BUILD_DIR)/
endef
endif

define Package/dns-server-test/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/dns-server-test $(1)/usr/bin/
endef

$(eval $(call BuildPackage,dns-server-test))
