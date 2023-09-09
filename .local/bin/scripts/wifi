#!/bin/bash

# Get the wifi network detected
# Remove the first line, header of each field
# Filter the lines starting, meaning that the device is already connected to this network
# get the SSID from networks
# filter the unfound SSID, i.e. '--'
# sort the network by name
# select a network among them
SSID=$(nmcli dev wifi list | tail -n +2 | grep -P '^(?!\*).*' | awk '{print $2}' | grep -P '^(?!-).*'| sort -u |fzf)

# connect to the network selected
sudo nmcli --ask dev wifi connect $SSID
