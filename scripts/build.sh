  # rather than a functioning script this serves as a form of documentation of what might have transpired
  # but it would be pretty cool if it could be reliably reproduced

  sudo apt-get install subversion build-essential libncurses5-dev zlib1g-dev gawk flex quilt git-core
  cd projects/openwrt/12.09
  git clone git://git.openwrt.org/12.09/openwrt.git
  cd projects/openwrt/12.09/openwrt/
  git pull
  cp feeds.conf.default feeds.conf
  echo 'src-git openvswitch git://github.com/schuza/openvswitch.git' >> feeds.conf
  ./scripts/feeds update 
  ./scripts/feeds install sflowovsd
  ./scripts/feeds install tspc
  ./scripts/feeds install gw6c
  ./scripts/feeds install odhcp6c
  ./scripts/feeds install openvpn
  ./scripts/feeds install luci
  ./scripts/feeds install iperf
  ./scripts/feeds install netperf
  ./scripts/feeds install simplejson
  ./scripts/feeds install python
  ./scripts/feeds install pyusb python-pcap python-curl python-event
  ./scripts/feeds install quagga
  ./scripts/feeds install haproxy
  ./scripts/feeds install wifidog
  ./scripts/feeds install lldpd
  ./scripts/feeds install igmpproxy
  ./scripts/feeds install gevent
  ./scripts/feeds install confuse
  ./scripts/feeds install tinc
  ./scripts/feeds install ipvsadm
  ./scripts/feeds install keepalived
  ./scripts/feeds install pypcap python-ifconfig python-json pysqlite twisted
  ./scripts/feeds install -a -p openvswitch
  ./scripts/feeds update luci
  echo '# CONFIG_KERNEL_BRIDGE is not set' >> .config
  cp /tmp/Makefile feeds/openvswitch/openvswitch/
  make menuconfig
  #make defconfig 
  make

