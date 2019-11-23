#!/bin/sh
add_to_set(){
     local ip=$1
     local subnet=$ip/24
     ping -W1 -c1 $ip &> /dev/null && return
     if ! ipset -q test iptv $subnet; then
         ipset add iptv $subnet
         echo added $subnet to set iptv
     fi
}
  
logread -e "iptv-helper" -f | \
     while read line; do
         ip=$(echo "$line" | sed -r 's|.*DST=([0-9.]+).*|\1|')
         echo requested $ip
         add_to_set $ip &
     done
