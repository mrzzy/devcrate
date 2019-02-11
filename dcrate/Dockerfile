#
# dcrate/Dockerfile
# Devcrate
# Devcrate container Dockerfile
#

FROM alpine:3.9

## Packages
# Development enviroment
RUN apk add --no-cache zsh
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
RUN pip3 install jedi

# Perl Development
RUN apk add --no-cache perl

# Ruby Development
RUN apk add --no-cache ruby

# C/C++ Development
RUN apk add --no-cache gcc
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
