#!/usr/bin/env python
# -*- coding: utf-8 -*-
from scapy.all import *
import sys

interface = sys.argv[1]    

def proc(p):
    if ( p.haslayer(Dot11ProbeReq) ):
        mac=re.sub(':','',p.addr2)
        ssid=p[Dot11Elt].info
        ssid=ssid.decode('utf-8','ignore')
        if ssid == "":
            ssid="<BROADCAST>"
            print "%s:%s" %(mac,ssid)
                                                                                                   
sniff(iface=interface,prn=proc, store=0)


