#!/bin/bash
# restore-packs.sh
#

sudo apt-key add repo.keys
sudo cp -R sources.list* /etc/apt/
sudo apt-get update
sudo apt-get install dselect
sudo dpkg --set-selections < package.list
sudo dselect

