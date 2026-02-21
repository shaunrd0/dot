alias ,git='git config --global user.name "Shaun Reed" && git config --global user.email "shaunrd0@gmail.com"'
# Some aliases don't make sense in the docker image, like shortcuts to fix plasmashell.
if [ -f /.dockerenv ]; then
  alias ,update='apt update -y && apt upgrade -y && apt upgrade --fix-broken --fix-missing --auto-remove'
  alias ,init='apt update -y && apt install -y $DOT_PACKAGES'
  alias ,swap='swapoff -a && swapon -a'
else
  alias ,update='sudo apt update -y && sudo apt upgrade -y && sudo apt upgrade --fix-broken --fix-missing --auto-remove'
  alias ,init='sudo apt update -y && sudo apt install -y $DOT_PACKAGES'
  # Clear kscreen cached settings
  alias ,kscreen='rm -rf ~/.local/share/kscreen/*'
  # Restart plasmashell
  alias ,plasmashell='plasmashell --replace &> /dev/null &'
  alias ,swap='sudo swapoff -a && sudo swapon -a'
  alias ,vbox="ps aux www |grep 'VBoxClient --draganddrop' | awk '{print $2}' | xargs kill"
fi

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Don't use tmux in vscode to avoid 'failure to resolve shell' errors.
if command -v tmux &> /dev/null && [ -n "$PS1" ] && [[ ! "$TERM" =~ screen ]] && [[ ! "$TERM" =~ tmux ]] && [ -z "$TMUX" ]; then
  if ! pstree -s $$ | grep -wq code; then
    exec tmux >/dev/null 2>&1
  fi
fi

