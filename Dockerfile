ARG REPO='https://git.shaunreed.com/shaunrd0/dot'
FROM ubuntu:latest
COPY . /dot
ENV TERM=xterm-256color
# Install additional packages we need
RUN apt update -y && apt upgrade -y
RUN apt install -y git stow vim tmux ranger clang wget curl golang-go
RUN go install github.com/arl/gitmux@latest
# Update submodules for plugins
RUN cd /dot && git submodule update --init && cp .gitmux.conf.docker .gitmux.conf
RUN rm ~/.bashrc && rm -rf /dot/.tmux/plugins/tmux-yank
RUN cd /dot && stow -t /root .

