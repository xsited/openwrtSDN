#!/usr/bin/env python
# -*- coding: utf-8 -*-

from threading import Thread
from Queue import Queue, Empty
from scapy.all import *
import sys

m_iface = "ra0"
m_finished = False
unique_client_macs = []
unique_ap_macs = []
m_queue = Queue.Queue()

def sniffDot11(p):	
   global m_queue
   if not p.haslayer(Dot11Beacon):	
      if unique_ap_macs.count(p.addr2) == 0: 
         unique_ap_macs.append(p.addr2)
         print p.sprintf("Found new client -> [%Dot11.addr1%][%Dot11.addr2%][%Dot11Elt.info%]")
   if p.haslayer(Dot11Beacon):
      if unique_client_macs.count(p.addr2) == 0:
         unique_client_macs.append(p.addr2)
         print p.sprintf("Found new AP --> %Dot11.addr2%[%Dot11Elt.info%|%Dot11Beacon.cap%]")
         m_queue.put(p)
                                     

def plain_sniff():
   sniff(iface="ra0",prn=sniffDot11,store=0)

def print_summary(pkt):
  print pkt.summary()

def threaded_sniff_target(q):
  global m_finished
  sniff(iface="ra0",prn=sniffDot11,store=0)
#  sniff(iface = m_iface, count = 10, filter = "icmp and src {0}".format(m_dst), prn = lambda x : q.put(x))
  m_finished = True

def threaded_sniff():
  global m_queue
  m_queue = Queue.Queue()
  sniffer = Thread(target = threaded_sniff_target, args = (m_queue,))
  sniffer.daemon = True
  sniffer.start()
  while (not m_finished):
    try:
      pkt = m_queue.get(timeout = 1)
      print_summary(pkt)
      print "Send new client to DIPNUM server"
    except Empty:
      pass

# 
def threaded_sniff_with_send():
  global m_queue
  m_queue = Queue.Queue()
  sniffer = Thread(target = threaded_sniff_target, args = (m_queue,))
  sniffer.daemon = True
  sniffer.start()
  while (not m_finished):
    send(IP(dst = m_dst) / ICMP())
    try:
      pkt = m_queue.get(timeout = 1)
      print_summary(pkt)
    except Empty:
      pass


#plain_sniff()

threaded_sniff()


