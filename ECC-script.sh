#!/bin/bash

echo -e "IPv6:"
test -f /proc/net/if_inet6 && echo "IPv6 Enabled !!" || 
	echo "----------------------------------------------------IPv6 Disabled OK"

echo -e "\n/etc/gai.conf:"
grep -E "^\s*precedence\s*::ffff:0:0/96\s*100$" /etc/gai.conf
if [[ $? == 0  ]]; then
	echo "-------------------------------------------------/etc/gai.conf is OK"
else
	echo "/etc/gai.conf is NOT CORRECT !!"
fi

echo -e "\nLocale language set:"
L="en_US.UTF-8"

