#!/usr/bin/env bash
set -Eeuo pipefail

# $1: Error message
# $2: Error code
# $3: Error line
function fatal() {
  local msg=${1:-"Unspecified error"}
  local line=${3:-9}
  echo "[Error:$line] Could not install dotfiles: $msg"
  exit ${2:-1}
}
trap 'fatal "Trapped an unknown error" $? $LINENO' ERR

if ! git rev-parse --is-inside-work-tree >/dev/null 2>&1; then
  fatal "Run setup.sh from the root directory of the dotfiles repository." 2 $LINENO
fi
git submodule update --init --recursive

# Use alias for installing packages so we don't maintain several dependency lists.
if ! [[ -f .bash.d/.bash_exports ]]; then
  fatal "Failed to locate .bash.d/.bash_exports in path: $(pwd)" 3 $LINENO
fi
. .bash.d/.bash_exports

if [[ -z ${DOT_PACKAGES:-} ]]; then
	fatal "DOT_PACKAGES variable not found after sourcing $(pwd)/.bash.d/.bash_aliases" 4 $LINENO
fi
sudo apt update -y && sudo apt install -y $DOT_PACKAGES
go install github.com/arl/gitmux@latest

# Install bash line editor for auto completion.
git clone --recursive --depth 1 --shallow-submodules https://github.com/akinomyoga/ble.sh.git
make -C ble.sh install PREFIX=$(pwd)/.local
rm -rf ble.sh
