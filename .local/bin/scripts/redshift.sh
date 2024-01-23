#!/usr/bin/bash
# Relaunch redshift

killall -q redshift
nohup redshift -c ~/.config/redshift/redshift.conf > /tmp/redshift.log 2>&1 &
