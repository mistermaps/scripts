#!/bin/bash
#get local ip from ifconfig
localIP=($(sudo ifconfig | grep "inet " | awk '{print $2}' | awk 'END{print}' ))
#affix two wildcards to end of local ip
startIP=`echo $localIP | cut -d "." -f1-3`
searchIP=`echo "$startIP.*"`
echo "search IP is: $searchIP"
#scan for IPs on local network
echo "Scanning for local IP, may take a while..."

networkIPs=($(nmap -sP $searchIP | grep -E '\d{2,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}' | awk '{print $5}'))
#find details of stuff on network
for index in ${!networkIPs[*]}; do
    echo "Device found on: ${networkIPs[$index]}"
    sudo nmap -v -O ${networkIPs[$index]} | grep -E "PORT|^\d{1,}/tcp|Running|MAC"
    printf "\n"
done
