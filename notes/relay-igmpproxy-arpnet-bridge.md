TODO

When configuring the relayd eethernet to wireless wan use case it was thought that the arpnet with igmpproxy needed these patches.  And perhaps it does, but not for my use case at the time.

Openwrt with ARPNAT reference:
http://projectgus.com/2010/03/wireless-client-bridging-with-openwrt/

This is a patch from the Gargoyle fork for ARPNAT:
http://www.gargoyle-router.com/gargoyle

It is to be applied to  attitude adjustment branch and build also including ebtables when using configuration options client_bridge=1.

