#!/bin/bash

dpkg --get-selections > package.list
sudo cp -R /etc/apt/sources.list* .
sudo apt-key exportall > repo.keys

