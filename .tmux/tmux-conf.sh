#!/bin/bash
if [ -z ${DISPLAY+notset} ]; then
  tmux source-file ~/.tmux/.tmux-tty.conf
else
  tmux source-file ~/.tmux/.tmux-gui.conf
fi

