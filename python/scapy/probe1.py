#!/usr/bin/env python
# -*- coding: utf-8 -*-
from scapy.all import *
import sys

unique = []

def sniffNonBeacon(p):	
     if not p.haslayer(Dot11Beacon):	
        if unique.count(p.addr2) == 0: 
            unique.append(p.addr2)
            print p.sprintf("[%Dot11.addr1%][%Dot11.addr2%][%Dot11Elt.info%]")
'''        
	print "add", p.addr2
	print p.summary()
        if unique.count(p.addr2) == 0: 
        unique.append(p.addr2)
'''

sniff(iface="ra0",prn=sniffNonBeacon,store=0)
