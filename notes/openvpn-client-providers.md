The use case called for L2 VPN with credential authentication which provider ibvpn.net offers.  Openwrt by default is not configured to work with this type of configuraion.  This is an outline on how the solution was assembled to provide this feature for use with ibvpn.net 

Configure openvpn build

--auth-user-pass [up] 
Authenticate with server using username/password. up is a file containing username/password on 2 lines OpenVPN will only read passwords from a file if it has been built with the --enable-password-save configure option

If up is omitted, username/password will be prompted from the console.

Add directive to .ovpn file
Create new file named user.conf and then add your clients username and password

1. Create a txt file on a folder alongside your .ovpn files 
2. Put your user/pass inside the file in two(2) lines, like:

username
password

3. Then save it.
4. Open up your .ovpn file and add:

auth-user-pass user.conf

TODO:
luci interface to enter the credentials so CLI access is not required.
