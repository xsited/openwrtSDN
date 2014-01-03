#!/usr/bin/env python

from scapy.all import *
import re
import sys

interface = sys.argv[1]   
baseMAC = sys.argv[2]  
IPregex = sys.argv[3]
reg=re.compile(IPregex)

def monitorIPMAC(p):       
     if p.haslayer(IP):
        iplayer = p.getlayer(IP)
        if reg.match(iplayer.src) or reg.match(iplayer.dst):
           if not (p.addr1==baseMAC or p.addr2==baseMAC or   p.addr3==baseMAC): 
              print "---"
              print "MAC->"+p.addr1+"|"+p.addr2+"|"+p.addr3
              print "IP->"+iplayer.src+"|"+iplayer.dst
              print "---"       
                                                                                                         
                                                                                                         
sniff(iface=interface,prn=monitorIPMAC,store=0)
                                                                                                         
                                                                                                         
