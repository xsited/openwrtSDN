sleep 5

mkdir /tmp/ibvpn

echo "-----BEGIN CERTIFICATE-----
MIIDeDCCAuGgAwIBAgIJAMVKgpjMPUfxMA0GCSqGSIb3DQEBBQUAMIGFMQswCQYD
VQQGEwJVUzELMAkGA1UECBMCQ0ExFTATBgNVBAcTDFNhbkZyYW5jaXNjbzEVMBMG
A1UEChMMRm9ydC1GdW5zdG9uMRgwFgYDVQQDEw9Gb3J0LUZ1bnN0b24gQ0ExITAf
BgkqhkiG9w0BCQEWEm1lQG15aG9zdC5teWRvbWFpbjAeFw0xMDA3MjExOTU5MzVa
Fw0yMDA3MTgxOTU5MzVaMIGFMQswCQYDVQQGEwJVUzELMAkGA1UECBMCQ0ExFTAT
BgNVBAcTDFNhbkZyYW5jaXNjbzEVMBMGA1UEChMMRm9ydC1GdW5zdG9uMRgwFgYD
VQQDEw9Gb3J0LUZ1bnN0b24gQ0ExITAfBgkqhkiG9w0BCQEWEm1lQG15aG9zdC5t
eWRvbWFpbjCBnzANBgkqhkiG9w0BAQEFAAOBjQAwgYkCgYEAz23m3BXY5Asiw8Dx
T4F6feqsp+pIx6ivftTniyUCbSAxI1J1s1x75DzxmUpIwPu5xavzgPXgZr8FT81X
JGqF9km4AE95iddJawKx0wNgdTo7GximQq9rw0dsQIB5hZZQ9TJwHC3VOnmEic5A
OawKOCybMcRs8saLakZOgh7Xc+UCAwEAAaOB7TCB6jAdBgNVHQ4EFgQUeRhE2N4l
XwL4H1dbjkZ4ou6fj3AwgboGA1UdIwSBsjCBr4AUeRhE2N4lXwL4H1dbjkZ4ou6f
j3ChgYukgYgwgYUxCzAJBgNVBAYTAlVTMQswCQYDVQQIEwJDQTEVMBMGA1UEBxMM
U2FuRnJhbmNpc2NvMRUwEwYDVQQKEwxGb3J0LUZ1bnN0b24xGDAWBgNVBAMTD0Zv
cnQtRnVuc3RvbiBDQTEhMB8GCSqGSIb3DQEJARYSbWVAbXlob3N0Lm15ZG9tYWlu
ggkAxUqCmMw9R/EwDAYDVR0TBAUwAwEB/zANBgkqhkiG9w0BAQUFAAOBgQASt0pl
WzVseQLTNM8Mlgw4ZnGAv/x2xnijmMqrkE+F7pnaOicGpxgCfMKzjZuJu0TNJqF2
fibE7GhMdomD4dLFgIu8Wb5E7iQ1CSBEOGumRhK8qCsDzjr7WXUdhqA6Xvo+ylU6
DMzy0Wn3NNvfGC+qxOgybYCJwDnVPi0CEDSbzQ==
-----END CERTIFICATE-----" > /tmp/ibvpn/ibvpn.com.crt

echo "#!/bin/sh
case \"\$1\" in
   up) export action=\"up\" ;;
   down) export action=\"down\" ;;
   *) echo \"No action specified.\" && exit 1 ;;
esac
    
if [ \"\$action\" = \"up\" ]; then
   mv /tmp/resolv.conf /tmp/resolv.conf.bak
   echo \$foreign_option_1 | sed -e 's/dhcp-option DOMAIN/domain/g' -e 's/dhcp-option DNS/nameserver/g' > /tmp/resolv.conf
   echo \$foreign_option_2 | sed -e 's/dhcp-option DOMAIN/domain/g' -e 's/dhcp-option DNS/nameserver/g' >> /tmp/resolv.conf
   echo \$foreign_option_3 | sed -e 's/dhcp-option DOMAIN/domain/g' -e 's/dhcp-option DNS/nameserver/g' >> /tmp/resolv.conf
   iptables --table nat --append POSTROUTING --out-interface \$2 --jump MASQUERADE
fi

if [ \"\$action\" = \"down\" ]; then
   mv /tmp/resolv.conf.bak /tmp/resolv.conf
   iptables --table nat --delete POSTROUTING --out-interface \$2 --jump MASQUERADE
fi" > /tmp/ibvpn/change_resolv_conf.sh

chmod 755 /tmp/ibvpn/change_resolv_conf.sh

echo "remote us4.ibvpn.com 1194 udp
client
dev tap
resolv-retry infinite
nobind
persist-key
mute-replay-warnings
ca /tmp/ibvpn/ibvpn.com.crt
log-append /tmp/ibvpn/vpn.log
comp-lzo
verb 3
mute 20
ns-cert-type server
fragment 1300
route-method exe
route-delay 2
auth-user-pass /tmp/ibvpn/user.conf
auth-retry nointeract
reneg-sec 0
script-security 3 system
up \"/tmp/ibvpn/change_resolv_conf.sh up\"
down \"/tmp/ibvpn/change_resolv_conf.sh down\"" > /tmp/ibvpn/server.ovpn

echo "#!/bin/sh
if [ \$(ps | grep openvpn | grep -v grep | wc -l | tr -s \"\n\") -eq 0 ];
then openvpn --daemon --config /tmp/ibvpn/server.ovpn;
fi" > /tmp/ibvpn/check_vpn

chmod 755 /tmp/ibvpn/check_vpn

echo "#!/bin/sh
case \$1 in
 \"start\" )
  ntpclient pool.ntp.org
  killall openvpn
  echo \"Launching OpenVPN process\"
  sed -i 's/remote.*/remote '\$2' 1194 udp/g' /tmp/ibvpn/server.ovpn
  openvpn --daemon --config /tmp/ibvpn/server.ovpn
  sleep 10
  if [ \$(route -n | grep '0.0.0.0.*tap' | wc -l) = 2 ]; then
    echo "VPN ON"
  else
    echo "VPN Error"
  fi
  echo \"* * * * * root /tmp/ibvpn/check_vpn\" > /tmp/crontab
  stopservice cron && startservice cron
;;
 \"stop\" )
  echo \"Stoping OpenVPN Process\"
  sed -i 's/.*check_vpn.*//' /tmp/crontab
  stopservice cron && startservice cron
  killall openvpn
;;
esac
return 0" > /tmp/ibvpn/vpn

chmod 755 /tmp/ibvpn/vpn

echo "your@email.address
VpnPassword" > /tmp/ibvpn/user.conf
