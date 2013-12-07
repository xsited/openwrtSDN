#!/bin/sh

ACTION=ifup DEVICE=$2 INTERFACE=vpn /sbin/hotplug-call iface
    
/sbin/ifconfig $2 $5 netmask $6 mtu $3 # broadcast 23.19.88.255
iptables --table nat --append POSTROUTING --out-interface $2 --jump MASQUERADE
    
#   mv /tmp/resolv.conf /tmp/resolv.conf.bak
#   echo $foreign_option_1 | sed -e 's/dhcp-option DOMAIN/domain/g' -e 's/dhcp-option DNS/nameserver/g' > /tmp/resolv.conf
#   echo $foreign_option_2 | sed -e 's/dhcp-option DOMAIN/domain/g' -e 's/dhcp-option DNS/nameserver/g' >> /tmp/resolv.conf
#   echo $foreign_option_3 | sed -e 's/dhcp-option DOMAIN/domain/g' -e 's/dhcp-option DNS/nameserver/g' >> /tmp/resolv.conf
   
exit 0


