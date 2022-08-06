# For Rust stuff, uncomment this line
#. "$HOME/.cargo/env"

# Clear kscreen cached settings
alias kapp-kscreen='rm -rf ~/.local/share/kscreen/*'
# Restart plasmashell
alias kapp-plasmashell='sudo pkill plasmashell && plasmashell --replace &> /dev/null &'
# Clear swap
alias kapp-swap='sudo swapoff -a && sudo swapon -a'
alias kapp-git='git config --global user.name "Shaun Reed" && git config --global user.email "shaunrd0@gmail.com"'
alias kapp-update='sudo apt update -y && sudo apt upgrade -y && sudo apt upgrade --fix-broken --fix-missing --auto-remove'

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
export EDITOR="vim"
export VISUAL="vim"
export LS_COLORS="di=1;34:ln=31;47:so=32:pi=33:ex=1;32:bd=34;46:cd=34;43:su=30;41:sg=30;46:tw=30;42:ow=30;43"
export PATH=$PATH:/opt/:$HOME/.local/bin/:$HOME/.dotnet:$HOME/go/bin/
export DOTNET_ROOT=$HOME/.dotnet

# Example path for autocompletion using libclang-9-dev package, obtained by the following command
command -v clang &>/dev/null && export LIBCLANG="$(find /usr/ -name libclang.so.1 2>/dev/null)"

# Source a top-secret alias file
if [ -f ~/.bash_secrets ]; then
  . ~/.bash_secrets
fi

if command -v tmux &> /dev/null && [ -n "$PS1" ] && [[ ! "$TERM" =~ screen ]] && [[ ! "$TERM" =~ tmux ]] && [ -z "$TMUX" ]; then
  exec tmux
fi

# Set the default terminal to use konsole, with Kapper profile
# + Execute tmux on start
#export TERMINAL='konsole --profile Kapper -e tmux'

# Less colors for man pages
export PAGER=less
default=$(tput sgr0)
red=$(tput setaf 1)
green=$(tput setaf 2)
purple=$(tput setaf 5)
orange=$(tput setaf 9)
# Begin blinking
export LESS_TERMCAP_mb=$red
# Begin bold
export LESS_TERMCAP_md=$orange
# End mode
export LESS_TERMCAP_me=$default
# End standout-mode
export LESS_TERMCAP_se=$default
# Begin standout-mode - info box
export LESS_TERMCAP_so=$purple
# End underline
export LESS_TERMCAP_ue=$default
# Begin underline
export LESS_TERMCAP_us=$green
# Allow mouse wheel movement for less output (manpages, diffs)
export LESS='--mouse --wheel-lines 2'
# Set additional flags for less
# + -R for raw control characters
# + -w to highlight first unread line when jumping N>1 lines down
# + -#2 to shift 2 columns horizontally when right / left arrow is pressed
export LESS="$LESS -R -w -#2"

