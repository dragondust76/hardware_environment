#!/bin/bash

echo "--- System Hardware Information ---"
echo ""

# Number of Hard Drives
echo "Hard Drives:"
lsblk -o NAME,SIZE,TYPE | grep "disk" | awk '{print "- " $1 " (" $2 ")"}'
echo ""

# CPU Information
echo "CPU Information:"
lscpu | grep "Model name" | sed 's/Model name: *//'
lscpu | grep "CPU(s):" | sed 's/CPU(s): *//' | awk '{print "- Number of Cores/Threads: " $1}'
echo ""

# RAM Information
echo "RAM Information:"
free -h | grep "Mem:" | awk '{print "- Total RAM: " $2}'
echo ""

# Video Card Information
echo "Video Card Information:"
lspci -k | grep -EA3 'VGA|3D|Display' | grep "Kernel driver in use:" | sed 's/Kernel driver in use: *//' | awk '{print "- Driver: " $1}'
lspci -k | grep -EA3 'VGA|3D|Display' | grep "Subsystem:" | sed 's/Subsystem: *//' | awk '{print "- Model: " $1 " " $2 " " $3}'
echo ""
inxi -G 
echo "--- End of Report ---"
