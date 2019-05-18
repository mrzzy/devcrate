#
# dcrate/Dockerfile
# Devcrate
# Devcrate container Dockerfile
#

FROM alpine:3.9
## Packages
# System
RUN apk add --no-cache shadow
RUN apk add --no-cache openssh
RUN apk add --no-cache ncurses
RUN apk add --no-cache sudo
RUN apk add --no-cache bash

# Development environment
RUN apk add --no-cache make
RUN apk add --no-cache zsh
RUN apk add --no-cache zsh-vcs
RUN apk add --no-cache neovim
RUN apk add --no-cache tmux

# Utilities
RUN apk add --no-cache w3m
RUN apk add --no-cache wget
RUN apk add --no-cache aria2
RUN apk add --no-cache curl
RUN apk add --no-cache git
RUN apk add --no-cache git-lfs

# Databases
RUN apk add --no-cache sqlite

# Python Development
RUN apk add --no-cache python3
RUN apk add --no-cache python3-dev
RUN pip3 install jedi

# Perl Development
RUN apk add --no-cache perl

# Ruby Development
RUN apk add --no-cache ruby

# C/C++ Development
RUN apk add --no-cache musl-dev
RUN apk add --no-cache linux-headers
RUN apk add --no-cache gcc
RUN apk add --no-cache g++
RUN apk add --no-cache clang
RUN apk add --no-cache doxygen
RUN apk add --no-cache gdb
RUN apk add --no-cache cmake

# JVM Development
RUN apk add --no-cache openjdk8-jre
#RUN apk add --no-cache sbt

# Node.js Development
RUN apk add --no-cache nodejs
RUN apk add --no-cache npm

## System
RUN echo 'devcrate' >/etc/hostname

## Configuration
COPY dotfiles /dotfiles
RUN make -C /dotfiles
RUN rm -rf /dotfiles

## Development Enviromment Setup
# Neovim Plugins
RUN pip3 install --user neovim
RUN curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
RUN nvim +PlugInstall +qa

# z jump tool
RUN wget https://raw.githubusercontent.com/rupa/z/master/z.sh -O ~/.local/share/z.sh
RUN zsh ~/.local/share/z.sh

# ZSH Plugins
ENV TERM xterm-256color
RUN chsh -s /bin/zsh
RUN git clone https://github.com/zplug/zplug ~/.zplug
RUN zsh -ic "zplug install"

# Tmux Plugins 
RUN git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm 
RUN bash ~/.tmux/plugins/tpm/bin/install_plugins 

WORKDIR /root
CMD zsh
