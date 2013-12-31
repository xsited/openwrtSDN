#! /usr/bin/env python

import sys
from scapy.all import *

# Run this script to fetch IPs and ARPs
interface = sys.argv[1]    
unique = []

def sniffarpip(p):
     if p.haslayer(IP):
        ip = p.sprintf("IP - [%IP.src%)|(%IP.dst%)]")
        if unique.count(ip) == 0:
           unique.append(ip)
           print ip
        elif p.haslayer(ARP):
           arp = p.sprintf("ARP - [%ARP.hwsrc%)|(%ARP.psrc%)]-[%ARP.hwdst%)|(%ARP.pdst%)]")
           if unique.count(arp) == 0:
              unique.append(arp)
              print arp
                                                                                                                        
sniff(iface=interface,prn=sniffarpip, store=0)
                                                                                                                        
