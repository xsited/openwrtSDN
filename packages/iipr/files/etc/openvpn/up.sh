#!/bin/sh

ACTION=ifup DEVICE=tun0 INTERFACE=vpn /sbin/hotplug-call iface
#/sbin/ifconfig tun0 10.8.0.238 pointopoint 10.8.0.237 mtu 1500
#/etc/openvpn/up.sh tun0 1500 1560 10.8.0.238 10.8.0.237 init
/sbin/ifconfig tun0 $4 pointopoint $5 mtu $2

exit 0

