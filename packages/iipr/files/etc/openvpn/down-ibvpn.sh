#!/bin/sh

iptables --table nat --delete POSTROUTING --out-interface $2 --jump MASQUERADE
