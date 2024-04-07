#!/bin/sh
echo $(setxkbmap -print | grep xkb_symbols | awk '{print $2}' FS='+')
