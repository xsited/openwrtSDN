#!/bin/sh

/etc/init.d/netserver stop
/etc/init.d/snmpd stop
/etc/init.d/collectd stop
/etc/init.d/lldpd stop
/etc/init.d/openvpn stop
                            
insmod /lib/modules/3.3.8/rt5572sta.ko
ifconfig ra0 up
iwconfig ra0 mode monitor
free
