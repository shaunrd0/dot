#!/bin/bash
# restore-packs.sh
#

sudo apt-key add repo.keys
sudo cp -R sources.list* /etc/apt/
sudo apt-get update
sudo apt-get install dselect
sudo dpkg --set-selections < package.list
sudo apt-get dselect-upgrade
# Create symlink for libclang
# Required for C++ clang_completion vim plugin
sudo ln -s /usr/lib/llvm-8/lib/libclang.so.1 /usr/lib/llvm-8/lib/libclang.so
sudo pip3 install powerline-shell
go get -u github.com/arl/gitmux


