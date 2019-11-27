#!/bin/sh
add_to_set(){
     local ip=$1
     local cfg=$2
     local subnet=$ip/24
     ping -W1 -c1 $ip &> /dev/null && return
     if ! ipset -q test iptv-helper_$cfg $subnet; then
         ipset add iptv-helper_$cfg $subnet
         echo added $subnet to set iptv-helper_$cfg
     fi
}

echo $1
  
logread -e "iptv-helper\.$1" -f | \
     while read line; do
         ip=$(echo "$line" | sed -r 's|.*DST=([0-9.]+).*|\1|')
         echo requested $ip
         add_to_set $ip $1&
     done
