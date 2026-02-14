#!/usr/bin/env bash
git submodule update --init
# Use alias for installing packages so we don't maintain several dependency lists.
. .bash_aliases
,init
go install github.com/arl/gitmux@latest
