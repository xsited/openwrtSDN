
#
# Copyright (C) 2006-2010 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

NF_MENU:=Netfilter Extensions
NF_KMOD:=1
include $(INCLUDE_DIR)/netfilter.mk

define KernelPackage/ipt-core
  SUBMENU:=$(NF_MENU)
  TITLE:=Netfilter core
  KCONFIG:= \
  	CONFIG_NETFILTER=y \
	CONFIG_NETFILTER_ADVANCED=y \
	$(KCONFIG_IPT_CORE)
  FILES:=$(foreach mod,$(IPT_CORE-m),$(LINUX_DIR)/net/$(mod).ko)
  AUTOLOAD:=$(call AutoLoad,40,$(notdir $(IPT_CORE-m)))
endef

define KernelPackage/ipt-core/description
 Netfilter core kernel modules
 Includes:
 - comment
 - limit
 - LOG
 - mac
 - multiport
 - REJECT
 - TCPMSS
-core
endef

$(eval $(call KernelPackage,ipt-core))


define AddDepends/ipt
  SUBMENU:=$(NF_MENU)
  DEPENDS+= kmod-ipt-core $(1)
endef


define KernelPackage/ipt-conntrack
  TITLE:=Basic connection tracking modules
  KCONFIG:=$(KCONFIG_IPT_CONNTRACK)
  FILES:=$(foreach mod,$(IPT_CONNTRACK-m),$(LINUX_DIR)/net/$(mod).ko)
  AUTOLOAD:=$(call AutoLoad,41,$(notdir $(IPT_CONNTRACK-m)))
  $(call AddDepends/ipt)
endef

define KernelPackage/ipt-conntrack/description
 Netfilter (IPv4) kernel modules for connection tracking
 Includes:
 - conntrack
 - defrag
 - iptables_raw
 - NOTRACK
 - state
endef

$(eval $(call KernelPackage,ipt-conntrack))


define KernelPackage/ipt-conntrack-extra
  TITLE:=Extra connection tracking modules
  KCONFIG:=$(KCONFIG_IPT_CONNTRACK_EXTRA)
  FILES:=$(foreach mod,$(IPT_CONNTRACK_EXTRA-m),$(LINUX_DIR)/net/$(mod).ko)
  AUTOLOAD:=$(call AutoLoad,42,$(notdir $(IPT_CONNTRACK_EXTRA-m)))
  $(call AddDepends/ipt,+kmod-ipt-conntrack)
endef

define KernelPackage/ipt-conntrack-extra/description
 Netfilter (IPv4) extra kernel modules for connection tracking
 Includes:
 - connbytes
 - connmark/CONNMARK
 - conntrack
 - helper
 - recent
endef

$(eval $(call KernelPackage,ipt-conntrack-extra))


define KernelPackage/ipt-filter
  TITLE:=Modules for packet content inspection
  KCONFIG:=$(KCONFIG_IPT_FILTER)
  FILES:=$(foreach mod,$(IPT_FILTER-m),$(LINUX_DIR)/net/$(mod).ko)
  AUTOLOAD:=$(call AutoLoad,45,$(notdir $(IPT_FILTER-m)))
  $(call AddDepends/ipt,+kmod-lib-textsearch)
endef

define KernelPackage/ipt-filter/description
 Netfilter (IPv4) kernel modules for packet content inspection
 Includes:
 - layer7
 - string
endef

$(eval $(call KernelPackage,ipt-filter))


define KernelPackage/ipt-ipopt
  TITLE:=Modules for matching/changing IP packet options
  KCONFIG:=$(KCONFIG_IPT_IPOPT)
  FILES:=$(foreach mod,$(IPT_IPOPT-m),$(LINUX_DIR)/net/$(mod).ko)
  AUTOLOAD:=$(call AutoLoad,45,$(notdir $(IPT_IPOPT-m)))
  $(call AddDepends/ipt)
endef

define KernelPackage/ipt-ipopt/description
 Netfilter (IPv4) modules for matching/changing IP packet options
 Includes:
 - CLASSIFY
 - dscp/DSCP
 - ecn/ECN
 - hl/HL
 - length
 - mark/MARK
 - statistic
 - tcpmss
 - time
 - ttl/TTL
 - unclean
endef

$(eval $(call KernelPackage,ipt-ipopt))


define KernelPackage/ipt-ipsec
  TITLE:=Modules for matching IPSec packets
  KCONFIG:=$(KCONFIG_IPT_IPSEC)
  FILES:=$(foreach mod,$(IPT_IPSEC-m),$(LINUX_DIR)/net/$(mod).ko)
  AUTOLOAD:=$(call AutoLoad,45,$(notdir $(IPT_IPSEC-m)))
  $(call AddDepends/ipt)
endef

define KernelPackage/ipt-ipsec/description
 Netfilter (IPv4) modules for matching IPSec packets
 Includes:
 - ah
 - esp
 - policy
endef

$(eval $(call KernelPackage,ipt-ipsec))


define KernelPackage/ipt-nat
  TITLE:=Basic NAT targets
  KCONFIG:=$(KCONFIG_IPT_NAT)
  FILES:=$(foreach mod,$(IPT_NAT-m),$(LINUX_DIR)/net/$(mod).ko)
  AUTOLOAD:=$(call AutoLoad,42,$(notdir $(IPT_NAT-m)))
  $(call AddDepends/ipt,+kmod-ipt-conntrack)
endef

define KernelPackage/ipt-nat/description
 Netfilter (IPv4) kernel modules for basic NAT targets
 Includes:
 - MASQUERADE
endef

$(eval $(call KernelPackage,ipt-nat))


define KernelPackage/ipt-nat-extra
  TITLE:=Extra NAT targets
  KCONFIG:=$(KCONFIG_IPT_NAT_EXTRA)
  FILES:=$(foreach mod,$(IPT_NAT_EXTRA-m),$(LINUX_DIR)/net/$(mod).ko)
  AUTOLOAD:=$(call AutoLoad,43,$(notdir $(IPT_NAT_EXTRA-m)))
  $(call AddDepends/ipt,+kmod-ipt-nat)
endef

define KernelPackage/ipt-nat-extra/description
 Netfilter (IPv4) kernel modules for extra NAT targets
 Includes:
 - NETMAP
 - REDIRECT
endef

$(eval $(call KernelPackage,ipt-nat-extra))


define KernelPackage/ipt-nathelper
  TITLE:=Basic Conntrack and NAT helpers
  KCONFIG:=$(KCONFIG_IPT_NATHELPER)
  FILES:=$(foreach mod,$(IPT_NATHELPER-m),$(LINUX_DIR)/net/$(mod).ko)
  AUTOLOAD:=$(call AutoLoad,45,$(notdir $(IPT_NATHELPER-m)))
  $(call AddDepends/ipt,+kmod-ipt-nat)
endef

define KernelPackage/ipt-nathelper/description
 Default Netfilter (IPv4) Conntrack and NAT helpers
 Includes:
 - ftp
 - irc
 - tftp
endef

$(eval $(call KernelPackage,ipt-nathelper))


define KernelPackage/ipt-nathelper-extra
  TITLE:=Extra Conntrack and NAT helpers
  KCONFIG:=$(KCONFIG_IPT_NATHELPER_EXTRA)
  FILES:=$(foreach mod,$(IPT_NATHELPER_EXTRA-m),$(LINUX_DIR)/net/$(mod).ko)
  AUTOLOAD:=$(call AutoLoad,45,$(notdir $(IPT_NATHELPER_EXTRA-m)))
  $(call AddDepends/ipt,+kmod-ipt-nat +kmod-lib-textsearch)
endef

define KernelPackage/ipt-nathelper-extra/description
 Extra Netfilter (IPv4) Conntrack and NAT helpers
 Includes:
 - amanda
 - h323
 - mms
 - pptp
 - proto_gre
 - sip
 - snmp_basic
 - broadcast
endef

$(eval $(call KernelPackage,ipt-nathelper-extra))


define KernelPackage/ipt-queue
  TITLE:=Module for user-space packet queueing
  KCONFIG:=$(KCONFIG_IPT_QUEUE)
  FILES:=$(foreach mod,$(IPT_QUEUE-m),$(LINUX_DIR)/net/$(mod).ko)
  AUTOLOAD:=$(call AutoLoad,45,$(notdir $(IPT_QUEUE-m)))
  $(call AddDepends/ipt)
endef

define KernelPackage/ipt-queue/description
 Netfilter (IPv4) module for user-space packet queueing
 Includes:
 - QUEUE
endef

$(eval $(call KernelPackage,ipt-queue))


define KernelPackage/ipt-ulog
  TITLE:=Module for user-space packet logging
  KCONFIG:=$(KCONFIG_IPT_ULOG)
  FILES:=$(foreach mod,$(IPT_ULOG-m),$(LINUX_DIR)/net/$(mod).ko)
  AUTOLOAD:=$(call AutoLoad,45,$(notdir $(IPT_ULOG-m)))
  $(call AddDepends/ipt)
endef

define KernelPackage/ipt-ulog/description
 Netfilter (IPv4) module for user-space packet logging
 Includes:
 - ULOG
endef

$(eval $(call KernelPackage,ipt-ulog))


define KernelPackage/ipt-debug
  TITLE:=Module for debugging/development
  KCONFIG:=$(KCONFIG_IPT_DEBUG)
  DEFAULT:=n
  FILES:=$(foreach mod,$(IPT_DEBUG-m),$(LINUX_DIR)/net/$(mod).ko)
  AUTOLOAD:=$(call AutoLoad,45,$(notdir $(IPT_DEBUG-m)))
  $(call AddDepends/ipt)
endef

define KernelPackage/ipt-debug/description
 Netfilter modules for debugging/development of the firewall
 Includes:
 - TRACE
endef

$(eval $(call KernelPackage,ipt-debug))


define KernelPackage/ipt-led
  TITLE:=Module to trigger a LED with a Netfilter rule
  KCONFIG:=$(KCONFIG_IPT_LED)
  FILES:=$(foreach mod,$(IPT_LED-m),$(LINUX_DIR)/net/$(mod).ko)
  AUTOLOAD:=$(call AutoLoad,61,$(notdir $(IPT_LED-m)))
  $(call AddDepends/ipt)
endef

define KernelPackage/ipt-led/description
 Netfilter target to trigger a LED when a network packet is matched.
endef

$(eval $(call KernelPackage,ipt-led))

define KernelPackage/ipt-tproxy
  TITLE:=Transparent proxying support
  DEPENDS+=+IPV6:kmod-ipv6
  KCONFIG:= \
  	CONFIG_NETFILTER_TPROXY \
  	CONFIG_NETFILTER_XT_MATCH_SOCKET \
  	CONFIG_NETFILTER_XT_TARGET_TPROXY
  FILES:= \
  	$(LINUX_DIR)/net/netfilter/nf_tproxy_core.ko \
  	$(foreach mod,$(IPT_TPROXY-m),$(LINUX_DIR)/net/$(mod).ko)
  AUTOLOAD:=$(call AutoLoad,50,$(notdir nf_tproxy_core $(IPT_TPROXY-m)))
  $(call AddDepends/ipt)
endef

define KernelPackage/ipt-tproxy/description
  Kernel modules for Transparent Proxying
endef

$(eval $(call KernelPackage,ipt-tproxy))

define KernelPackage/ipt-tee
  TITLE:=TEE support
  KCONFIG:= \
  	CONFIG_NETFILTER_XT_TARGET_TEE
  FILES:= \
  	$(LINUX_DIR)/net/netfilter/xt_TEE.ko \
  	$(foreach mod,$(IPT_TEE-m),$(LINUX_DIR)/net/$(mod).ko)
  AUTOLOAD:=$(call AutoLoad,45,$(notdir nf_tee $(IPT_TEE-m)))
  $(call AddDepends/ipt)
endef

define KernelPackage/ipt-tee/description
  Kernel modules for TEE
endef

$(eval $(call KernelPackage,ipt-tee))


define KernelPackage/ipt-u32
  TITLE:=U32 support
  KCONFIG:= \
  	CONFIG_NETFILTER_XT_MATCH_U32
  FILES:= \
  	$(LINUX_DIR)/net/netfilter/xt_u32.ko \
  	$(foreach mod,$(IPT_U32-m),$(LINUX_DIR)/net/$(mod).ko)
  AUTOLOAD:=$(call AutoLoad,45,$(notdir nf_tee $(IPT_U32-m)))
  $(call AddDepends/ipt)
endef

define KernelPackage/ipt-u32/description
  Kernel modules for U32
endef

$(eval $(call KernelPackage,ipt-u32))


define KernelPackage/ipt-iprange
  TITLE:=Module for matching ip ranges
  KCONFIG:=$(KCONFIG_IPT_IPRANGE)
  FILES:=$(foreach mod,$(IPT_IPRANGE-m),$(LINUX_DIR)/net/$(mod).ko)
  AUTOLOAD:=$(call AutoLoad,45,$(notdir $(IPT_IPRANGE-m)))
  $(call AddDepends/ipt)
endef

define KernelPackage/ipt-iprange/description
 Netfilter (IPv4) module for matching ip ranges
 Includes:
 - iprange
endef

$(eval $(call KernelPackage,ipt-iprange))


define KernelPackage/ipt-extra
  TITLE:=Extra modules
  KCONFIG:=$(KCONFIG_IPT_EXTRA)
  FILES:=$(foreach mod,$(IPT_EXTRA-m),$(LINUX_DIR)/net/$(mod).ko)
  AUTOLOAD:=$(call AutoLoad,45,$(notdir $(IPT_EXTRA-m)))
  $(call AddDepends/ipt)
endef

define KernelPackage/ipt-extra/description
 Other Netfilter (IPv4) kernel modules
 Includes:
 - owner
 - physdev (if bridge support was enabled in kernel)
 - pkttype
 - quota
endef

$(eval $(call KernelPackage,ipt-extra))


define KernelPackage/ip6tables
  SUBMENU:=$(NF_MENU)
  TITLE:=IPv6 modules
  DEPENDS:=+kmod-ipv6
  KCONFIG:=$(KCONFIG_IPT_IPV6)
  FILES:=$(foreach mod,$(IPT_IPV6-m),$(LINUX_DIR)/net/$(mod).ko)
  AUTOLOAD:=$(call AutoLoad,49,$(notdir $(IPT_IPV6-m)))
endef

define KernelPackage/ip6tables/description
 Netfilter IPv6 firewalling support
endef

$(eval $(call KernelPackage,ip6tables))


define KernelPackage/arptables
  SUBMENU:=$(NF_MENU)
  TITLE:=ARP firewalling modules
  FILES:=$(LINUX_DIR)/net/ipv4/netfilter/arp*.ko
  KCONFIG:=CONFIG_IP_NF_ARPTABLES \
    CONFIG_IP_NF_ARPFILTER \
    CONFIG_IP_NF_ARP_MANGLE
  AUTOLOAD:=$(call AutoLoad,49,$(notdir $(patsubst %.ko,%,$(wildcard $(LINUX_DIR)/net/ipv4/netfilter/arp*.ko))))
endef

define KernelPackage/arptables/description
 Kernel modules for ARP firewalling
endef

$(eval $(call KernelPackage,arptables))


define KernelPackage/ebtables
  SUBMENU:=$(NF_MENU)
  TITLE:=Bridge firewalling modules
  FILES:=$(foreach mod,$(EBTABLES-m),$(LINUX_DIR)/net/$(mod).ko)
  KCONFIG:=CONFIG_BRIDGE_NETFILTER=y \
	$(KCONFIG_EBTABLES)
  AUTOLOAD:=$(call AutoLoad,49,$(notdir $(EBTABLES-m)))
endef

define KernelPackage/ebtables/description
  ebtables is a general, extensible frame/packet identification
  framework. It provides you to do Ethernet
  filtering/NAT/brouting on the Ethernet bridge.
endef

$(eval $(call KernelPackage,ebtables))


define AddDepends/ebtables
  SUBMENU:=$(NF_MENU)
  DEPENDS+=kmod-ebtables $(1)
endef


define KernelPackage/ebtables-ipv4
  TITLE:=ebtables: IPv4 support
  FILES:=$(foreach mod,$(EBTABLES_IP4-m),$(LINUX_DIR)/net/$(mod).ko)
  KCONFIG:=$(KCONFIG_EBTABLES_IP4)
  AUTOLOAD:=$(call AutoLoad,49,$(notdir $(EBTABLES_IP4-m)))
  $(call AddDepends/ebtables)
endef

define KernelPackage/ebtables-ipv4/description
 This option adds the IPv4 support to ebtables, which allows basic
 IPv4 header field filtering, ARP filtering as well as SNAT, DNAT targets.
endef

$(eval $(call KernelPackage,ebtables-ipv4))


define KernelPackage/ebtables-ipv6
  TITLE:=ebtables: IPv6 support
  FILES:=$(foreach mod,$(EBTABLES_IP6-m),$(LINUX_DIR)/net/$(mod).ko)
  KCONFIG:=$(KCONFIG_EBTABLES_IP6)
  AUTOLOAD:=$(call AutoLoad,49,$(notdir $(EBTABLES_IP6-m)))
  $(call AddDepends/ebtables)
endef

define KernelPackage/ebtables-ipv6/description
 This option adds the IPv6 support to ebtables, which allows basic
 IPv6 header field filtering and target support.
endef

$(eval $(call KernelPackage,ebtables-ipv6))


define KernelPackage/ebtables-watchers
  TITLE:=ebtables: watchers support
  FILES:=$(foreach mod,$(EBTABLES_WATCHERS-m),$(LINUX_DIR)/net/$(mod).ko)
  KCONFIG:=$(KCONFIG_EBTABLES_WATCHERS)
  AUTOLOAD:=$(call AutoLoad,49,$(notdir $(EBTABLES_WATCHERS-m)))
  $(call AddDepends/ebtables)
endef

define KernelPackage/ebtables-watchers/description
 This option adds the log watchers, that you can use in any rule
 in any ebtables table.
endef

$(eval $(call KernelPackage,ebtables-watchers))


define KernelPackage/nfnetlink
  SUBMENU:=$(NF_MENU)
  TITLE:=Netlink-based userspace interface
  DEPENDS:=+kmod-ipt-core
  FILES:=$(LINUX_DIR)/net/netfilter/nfnetlink.ko
  KCONFIG:=CONFIG_NETFILTER_NETLINK
  AUTOLOAD:=$(call AutoLoad,48,nfnetlink)
endef

define KernelPackage/nfnetlink/description
 Kernel modules support for a netlink-based userspace interface
endef

$(eval $(call KernelPackage,nfnetlink))


define AddDepends/nfnetlink
  SUBMENU:=$(NF_MENU)
  DEPENDS+=+kmod-nfnetlink $(1)
endef


define KernelPackage/nfnetlink-log
  TITLE:=Netfilter LOG over NFNETLINK interface
  FILES:=$(LINUX_DIR)/net/netfilter/nfnetlink_log.ko
  KCONFIG:=CONFIG_NETFILTER_NETLINK_LOG
  AUTOLOAD:=$(call AutoLoad,48,nfnetlink_log)
  $(call AddDepends/nfnetlink)
endef

define KernelPackage/nfnetlink-log/description
 Kernel modules support for logging packets via NFNETLINK
endef

$(eval $(call KernelPackage,nfnetlink-log))


define KernelPackage/nfnetlink-queue
  TITLE:=Netfilter QUEUE over NFNETLINK interface
  FILES:=$(LINUX_DIR)/net/netfilter/nfnetlink_queue.ko
  KCONFIG:=CONFIG_NETFILTER_NETLINK_QUEUE
  AUTOLOAD:=$(call AutoLoad,48,nfnetlink_queue)
  $(call AddDepends/nfnetlink)
endef

define KernelPackage/nfnetlink-queue/description
 Kernel modules support for queueing packets via NFNETLINK
endef

$(eval $(call KernelPackage,nfnetlink-queue))


define KernelPackage/nf-conntrack-netlink
  TITLE:=Connection tracking netlink interface
  FILES:=$(LINUX_DIR)/net/netfilter/nf_conntrack_netlink.ko
  KCONFIG:=CONFIG_NF_CT_NETLINK
  AUTOLOAD:=$(call AutoLoad,49,nf_conntrack_netlink)
  $(call AddDepends/nfnetlink,+kmod-ipt-conntrack)
endef

define KernelPackage/nf-conntrack-netlink/description
 Kernel modules support for a netlink-based connection tracking 
 userspace interface
endef

$(eval $(call KernelPackage,nf-conntrack-netlink))

define KernelPackage/ipt-hashlimit
  SUBMENU:=$(NF_MENU)
  TITLE:=Netfilter hashlimit match
  KCONFIG:=$(KCONFIG_IPT_HASHLIMIT)
  FILES:=$(LINUX_DIR)/net/netfilter/xt_hashlimit.ko
  AUTOLOAD:=$(call AutoLoad,50,xt_hashlimit)
  $(call KernelPackage/ipt)
endef

define KernelPackage/ipt-hashlimit/description
 Kernel modules support for the hashlimit bucket match module
endef

$(eval $(call KernelPackage,ipt-hashlimit))


define KernelPackage/ipvs-core
  SUBMENU:=$(NF_MENU)
  TITLE:=IP Virtual Server Support
  KCONFIG:= \
    CONFIG_IP_VS \
    CONFIG_IP_VS_IPV6=y \
    CONFIG_IP_VS_PROTO_TCP=y \
    CONFIG_IP_VS_PROTO_UDP=y \
    CONFIG_IP_VS_PROTO_ESP=y \
    CONFIG_IP_VS_PROTO_AH=y \
    CONFIG_IP_VS_PROTO_SCTP=y \
    CONFIG_IP_VS_NFCT=y \
    CONFIG_IP_VS_DEBUG=n \
    CONFIG_IP_VS_TAB_BITS=12 \
    CONFIG_IP_VS_SH_TAB_BITS=8 \
    CONFIG_NETFILTER_XT_MATCH_IPVS=n
  DEPENDS:=+kmod-ipt-core +kmod-lib-crc32c +ip6tables
  FILES:=$(LINUX_DIR)/net/netfilter/ipvs/ip_vs.ko
  AUTOLOAD:=$(call AutoLoad,40,ipvs-core)
endef

define KernelPackage/ipvs-core/description
 Kernel modules core support for Linux Virtual Server
endef

$(eval $(call KernelPackage,ipvs-core))

define KernelPackage/ipvs-rr
  SUBMENU:=$(NF_MENU)
  TITLE:=IP Virtual Server Round Robin Scheduler
  KCONFIG:= \
     CONFIG_IP_VS_RR
  DEPENDS:=+kmod-ipvs-core
  FILES:=$(LINUX_DIR)/net/netfilter/ipvs/ip_vs_rr.ko
  AUTOLOAD:=$(call AutoLoad,45,ip_vs_rr)
endef

define KernelPackage/ipvs-rr/description
 The robin-robin scheduling algorithm simply directs network
endef

$(eval $(call KernelPackage,ipvs-rr))

define KernelPackage/ipvs-wrr
  SUBMENU:=$(NF_MENU)
  TITLE:=IP Virtual Server weighted round robin scheduler
  KCONFIG:= \
      CONFIG_IP_VS_WRR
  DEPENDS:=+kmod-ipvs-core
  FILES:=$(LINUX_DIR)/net/netfilter/ipvs/ip_vs_wrr.ko
  AUTOLOAD:=$(call AutoLoad,45,ip_vs_wrr)
endef

define KernelPackage/ipvs-wrr/description
 The robin-robin scheduling algorithm with weights
endef

$(eval $(call KernelPackage,ipvs-wrr))

define KernelPackage/ipvs-lc
  SUBMENU:=$(NF_MENU)
  TITLE:=IP Virtual Server least connections scheduler
  KCONFIG:= \
    CONFIG_IP_VS_LC
  DEPENDS:=+kmod-ipvs-core
  FILES:=$(LINUX_DIR)/net/netfilter/ipvs/ip_vs_lc.ko
  AUTOLOAD:=$(call AutoLoad,45,ip_vs_lc)
endef

define KernelPackage/ipvs-lc/description
 The least-connection scheduling algorithm directs network
 connections to the server with the least number of active
 connections
endef

$(eval $(call KernelPackage,ipvs-lc))

define KernelPackage/ipvs-wlc
  SUBMENU:=$(NF_MENU)
  TITLE:=IP Virtual Server weighted least connections scheduler
  KCONFIG:= \
    CONFIG_IP_VS_WLC
  DEPENDS:=+kmod-ipvs-core
  FILES:=$(LINUX_DIR)/net/netfilter/ipvs/ip_vs_wlc.ko
  AUTOLOAD:=$(call AutoLoad,45,ip_vs_wlc)
endef

define KernelPackage/ipvs-wlc/description
 The least-connection scheduling algorithm directs network
 connections to the server with the least connections with
 normalized by the server weight
endef

$(eval $(call KernelPackage,ipvs-wlc))

define KernelPackage/ipvs-lblc
  SUBMENU:=$(NF_MENU)
  TITLE:=IP Virtual Server locality based connections scheduler
  KCONFIG:= \
    CONFIG_IP_VS_LBLC
  DEPENDS:=+kmod-ipvs-core
  FILES:=$(LINUX_DIR)/net/netfilter/ipvs/ip_vs_lblc.ko
  AUTOLOAD:=$(call AutoLoad,45,ip_vs_lblc)
endef

define KernelPackage/ipvs-lblc/description
 The locality-based least-connection scheduling algorithm is for
 destination IP load balancing. It is usually used in cache cluster
 This algorithm usually directs packet destined for an IP address to
 its server if the server is alive and under load. If the server is
 overloaded (its active connection numbers is larger than its weight)
 and there is a server in its half load, then allocate the weighted
 least-connection server to this IP address.
endef

$(eval $(call KernelPackage,ipvs-lblc))

define KernelPackage/ipvs-lblcr
  SUBMENU:=$(NF_MENU)
  TITLE:=IP Virtual Server locality based with replication
  KCONFIG:= \
    CONFIG_IP_VS_LBLCR
  DEPENDS:=+kmod-ipvs-core
  FILES:=$(LINUX_DIR)/net/netfilter/ipvs/ip_vs_lblcr.ko
  AUTOLOAD:=$(call AutoLoad,45,ip_vs_lblcr)
endef

define KernelPackage/ipvs-lblcr/description
 The locality-based least-connection with replication scheduling
 algorithm is also for destination IP load balancing. It is
 usually used in cache cluster. It differs from the LBLC
 scheduling as follows: the load balancer maintains mappings from a target
 to a set of server nodes that can serve the target. Requests 
 for a target are assigned to the least-connection node in the target's
 server set. If all the node in the server set are over
 loaded, it picks up a least-connection node in the cluster and adds it
 in the sever set for the target. If the server set has not been
 modified for the specified time, the most loaded node is
 removed from the server set, in order to avoid high degree of replication
endef

$(eval $(call KernelPackage,ipvs-lblcr))

define KernelPackage/ipvs-dh
  SUBMENU:=$(NF_MENU)
  TITLE:=IP Virtual Server destination hashing scheduler
  KCONFIG:= \
    CONFIG_IP_VS_DH
  DEPENDS:=+kmod-ipvs-core
  FILES:=$(LINUX_DIR)/net/netfilter/ipvs/ip_vs_dh.ko
  AUTOLOAD:=$(call AutoLoad,45,ip_vs_dh)
endef

define KernelPackage/ipvs-dh/description
 The destination hashing scheduling algorithm assigns network
 connections to the servers through looking up a statically assigned
 hash table by their destination IP addresses
endef

$(eval $(call KernelPackage,ipvs-dh))

define KernelPackage/ipvs-sh
  SUBMENU:=$(NF_MENU)
  TITLE:=IP Virtual Server source hashing scheduler
  KCONFIG:= \
    CONFIG_IP_VS_SH
  DEPENDS:=+kmod-ipvs-core
  FILES:=$(LINUX_DIR)/net/netfilter/ipvs/ip_vs_sh.ko
  AUTOLOAD:=$(call AutoLoad,45,ip_vs_sh)
endef

define KernelPackage/ipvs-sh/description
 The source hashing scheduling algorithm assigns network
 connections to the servers through looking up a statically assigned
 hash table by their source IP addresses
endef

$(eval $(call KernelPackage,ipvs-sh))

define KernelPackage/ipvs-sed
  SUBMENU:=$(NF_MENU)
  TITLE:=IP Virtual Server shortest expected delay scheduling
  KCONFIG:= \
    CONFIG_IP_VS_SED
  DEPENDS:=+kmod-ipvs-core
  FILES:=$(LINUX_DIR)/net/netfilter/ipvs/ip_vs_sed.ko
  AUTOLOAD:=$(call AutoLoad,45,ip_vs_sed)
endef

define KernelPackage/ipvs-sed/description
 The shortest expected delay scheduling algorithm assigns network
 connections to the server with the shortest expected delay. The
 expected delay that the job will experience is (Ci + 1) / Ui if
 sent to the ith server, in which Ci is the number of connections
 on the ith server and Ui is the fixed service rate (weight)
 of the ith server.
endef

$(eval $(call KernelPackage,ipvs-sed))

define KernelPackage/ipvs-nq
  SUBMENU:=$(NF_MENU)
  TITLE:=IP Virtual Server never queuing scheduling
  KCONFIG:= \
    CONFIG_IP_VS_NQ
  DEPENDS:=+kmod-ipvs-core
  FILES:=$(LINUX_DIR)/net/netfilter/ipvs/ip_vs_nq.ko
  AUTOLOAD:=$(call AutoLoad,45,ip_vs_nq)
endef

define KernelPackage/ipvs-nq/description
 The never queue scheduling algorithm adopts a two-speed model.
 When there is an idle server available, the job will be sent to
 the idle server, instead of waiting for a fast one. When there
 is no idle server available, the job will be sent to the server
 that minimize its expected delay (The Shortest Expected Delay
 scheduling algorithm)
endef

$(eval $(call KernelPackage,ipvs-nq))

define KernelPackage/ipvs-ftp
  SUBMENU:=$(NF_MENU)
  TITLE:=IP Virtual Server FTP protocol helper
  KCONFIG:= \
    CONFIG_IP_VS_FTP
  DEPENDS:=+kmod-ipvs-core
  FILES:=$(LINUX_DIR)/net/netfilter/ipvs/ip_vs_ftp.ko
  AUTOLOAD:=$(call AutoLoad,45,ip_vs_ftp)
endef

define KernelPackage/ipvs-ftp/description
 FTP is a protocol that transfers IP address and/or port number in
 the payload. In the virtual server via Network Address Translation,
 the IP address and port number of real servers cannot be sent to
 clients in ftp connections directly, so FTP protocol helper is
 required for tracking the connection and mangling it back to that of
 virtual service.
endef

$(eval $(call KernelPackage,ipvs-ftp))

define KernelPackage/ipvs-pe-sip
  SUBMENU:=$(NF_MENU)
  TITLE:=IP Virtual Server SIP persistence engine
  KCONFIG:= \
    CONFIG_IP_VS_PE_SIP
  DEPENDS:=+kmod-ipvs-core
  FILES:=$(LINUX_DIR)/net/netfilter/ipvs/ip_vs_pe_sip.ko
  AUTOLOAD:=$(call AutoLoad,45,ip_vs_pe_sip)
endef

define KernelPackage/ipvs-pe-sip/description
 Allow persistence based on the SIP Call-I
endef

$(eval $(call KernelPackage,ipvs-pe-sip))

