#! /usr/bin/env python

from threading import Thread
from Queue import Queue, Empty
from scapy.all import *

m_iface = "eth0"
m_finished = False
m_dst = "192.168.252.1"

def print_summary(pkt):
  print pkt.summary()

def plain_sniff():
  sniff(iface = m_iface, count = 10, filter = "icmp and src {0}".format(m_dst), prn = print_summary)

def threaded_sniff_target(q):
  global m_finished
  sniff(iface = m_iface, count = 10, filter = "icmp and src {0}".format(m_dst), prn = lambda x : q.put(x))
  m_finished = True

def threaded_sniff():
  q = Queue.Queue()
  sniffer = Thread(target = threaded_sniff_target, args = (q,))
  sniffer.daemon = True
  sniffer.start()
  while (not m_finished):
    try:
      pkt = q.get(timeout = 1)
      print_summary(pkt)
    except Empty:
      pass

def threaded_sniff_with_send():
  q = Queue.Queue()
  sniffer = Thread(target = threaded_sniff_target, args = (q,))
  sniffer.daemon = True
  sniffer.start()
  while (not m_finished):
    send(IP(dst = m_dst) / ICMP())
    try:
      pkt = q.get(timeout = 1)
      print_summary(pkt)
    except Empty:
      pass

#plain_sniff()

#threaded_sniff()

threaded_sniff_with_send()
