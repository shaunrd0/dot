#!/bin/bash

# Store installed packages, excluding foreign
pacman -Qqen > pacman/pkglist.txt
# Use -Qqem to create the list of AUR and other foreign packages that have been explicitly installed.
sudo pacman -Qqem > pacman/foreignpkglist.txt

snap list > snap/snapacks.txt

