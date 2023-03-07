#!/bin/bash

ip a
ip route s

read -p "please put the name of the device: " devname

read -p "how much addresses to delete?: " del_num
if [[ "$del_num" > 0 ]]; then
        for ((i = 1; i <= $del_num; i++))
        do
 		read -p "address: " in_addr
		sudo ip addr delete $in_addr dev $devname
	done
fi

read -p "how much addresses to add?: " add_num
if [[ "$add_num" > 0 ]]; then
        for ((i = 1; i <= $add_num; i++))
        do
                read -p "address: " in_addr
                sudo ip addr add $in_addr dev $devname
        done
fi

read -p "how much routes to add?: " add_num
if [[ "$add_num" > 0 ]]; then
        for ((i = 1; i <= $add_num; i++))
        do
                read -p "address: " in_addr
                sudo ip route add $in_addr dev $devname
        done
fi
sudo systemctl restart networking.service
