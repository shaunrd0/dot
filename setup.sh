#!/usr/bin/env bash
set -Eeuo pipefail

# $1: Error message
# $2: Error code
function fatal() {
  local msg=${1:-"Unspecified error"}
  echo "[Error:$LINENO] Could not install dotfiles: $msg"
  exit ${2:-1}
}
trap 'fatal "Trapped an unknown error" $?' ERR

if ! git rev-parse --is-inside-work-tree >/dev/null 2>&1; then
  fatal "Run setup.sh from the root directory of the dotfiles repository." 2
fi
git submodule update --init --recursive

# Use alias for installing packages so we don't maintain several dependency lists.
if ! [[ -f .bash_aliases ]]; then
  fatal "Failed to locate .bash_aliases in path: $(pwd)" 3
fi
. .bash_aliases

if [[ -z ${DOT_PACKAGES:-} ]]; then
	fatal "DOT_PACKAGES variable not found after sourcing $(pwd)/.bash_aliases" 4
fi
sudo apt update -y && sudo apt install -y $DOT_PACKAGES
go install github.com/arl/gitmux@latest

# Install bash line editor for auto completion.
git clone --recursive --depth 1 --shallow-submodules https://github.com/akinomyoga/ble.sh.git
make -C ble.sh install PREFIX=$(pwd)/.local
rm -rf ble.sh
