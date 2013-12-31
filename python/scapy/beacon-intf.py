#!/usr/bin/env python

from scapy.all import *
import sys

interface = sys.argv[1]    
unique = []

def sniffBeacon(p):	
   if p.haslayer(Dot11Beacon):
      if unique.count(p.addr2) == 0:
         unique.append(p.addr2)
         print p.sprintf("%Dot11.addr2%[%Dot11Elt.info%|%Dot11Beacon.cap%]")
                                     
sniff(iface=interface,prn=sniffBeacon,store=0)

