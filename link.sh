#!/usr/bin/env bash

# A very naive script to link confs

CURDIR=$(pwd)
ITEMS=$(ls $CURDIR/.config)
for i in ${ITEMS[@]}; do 
	rm -rf ~/.config/$i
	ln -s $CURDIR/.config/$i ~/.config
done

# Let's link wallpapers also
ln -s $CURDIR/wallpaper ~/Pictures
