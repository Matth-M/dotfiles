#!/usr/bin/bash
# Relaunch redshift

killall -q redshift
nohup redshift -c ~/.config/redshift/redshift.conf > /dev/null 2>&1 &
