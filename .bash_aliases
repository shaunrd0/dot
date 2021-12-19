# Overrides for default .bashrc aliases and exports
# Alias / export customizations
# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Custom aliases / exports
alias python3='python3.9'
alias pip3='python3.9 -m pip'

alias kapp-git='git config --global user.name "Shaun Reed" && git config --global user.email "shaunrd0@gmail.com"'
alias kapp-update='sudo apt update -y && sudo apt upgrade -y && sudo apt upgrade --fix-broken --fix-missing --auto-remove'

#export FONT='xft:InconsolataNerdFont'
#export TERMINAL='urxvt -fn '$FONT' -e tmux -u'
export TERMINAL='urxvt -e tmux -u'

export EDITOR='/usr/bin/vim'
export VISUAL='/usr/bin/vim'
export PATH=$PATH":$HOME/.local/bin/i3scripts:/opt/"
export PATH=$PATH:/opt/:/home/kapper/.local/bin/

if command -v tmux &> /dev/null && [ -n "$PS1" ] && [[ ! "$TERM" =~ screen ]] && [[ ! "$TERM" =~ tmux ]] && [ -z "$TMUX" ]; then
  exec tmux
fi
eval "$(dircolors ~/.dir_colors)"
export LS_COLORS="di=1;34:ln=31;47:so=32:pi=33:ex=1;32:bd=34;46:cd=34;43:su=30;41:sg=30;46:tw=30;42:ow=30;43"

# Source a top-secret alias file
if [ -f ~/.bash_secrets ]; then
  . ~/.bash_secrets
fi

