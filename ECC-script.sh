#!/bin/bash

echo -e "\nIPv6:"
test -f /proc/net/if_inet6 && echo "IPv6 Enabled !!" || 
	echo "--------------------------------------------------- IPv6 Disabled OK"

echo -e "\n/etc/gai.conf:"
grep -E "^\s*precedence\s*::ffff:0:0/96\s*100$" /etc/gai.conf
if [[ $? == 0  ]]; then
	echo "------------------------------------------------ /etc/gai.conf is OK"
else
	echo -e "/etc/gai.conf is NOT CORRECT !!"
fi

echo -e "\nLocale language set:"
locale | ( 
while read -r LINE; do
	VALUE=$(echo $LINE | cut -f2 -d=)
	KEY=$(echo $LINE | cut -f1 -d=)
	echo -e "$KEY: $VALUE"
	if !([[ $VALUE == "en_US.UTF-8"  ]] || [[ $VALUE == \"en_US.UTF-8\" ]]) ; then
		LOCALE_FLAG=1
	fi
done
if [[ $LOCALE_FLAG -eq 0 ]]; then
	echo "------------------------------------------------------- locale is OK"
else
	echo "locale is NOT CORRECT"
fi
)


