#
# devcrate
# Base image dockerfile
#

FROM ubuntu:18.04 AS repo

## setup repos
# install minimum packages required to bootstrap actual
# package installation
RUN apt-get update && apt-get install -y \
    apt-transport-https ca-certificates software-properties-common \
    curl aria2 gnupg-agent sudo \ 
    && rm -rf /var/lib/apt/lists/* /var/cache/apt/archives/*
# add docker repo to install docker pages
RUN curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add - \
    && add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu bionic stable"
# pull script to install node
RUN curl -sL https://deb.nodesource.com/setup_10.x | bash -

## install devcrate: dev tools packages
RUN apt-get update && apt-get install -y \
    docker-ce-cli nodejs zsh neovim tmux git make silversearcher-ag  \
    && rm -rf /var/lib/apt/lists/* /var/cache/apt/archives/*
RUN npm install -g yarn

## setup user & groups
ARG USERNAME=user
RUN useradd --home-dir /home/ \
    --uid 1000 \
    --shell /usr/bin/zsh \
    --groups sudo,adm,root $USERNAME
RUN echo "$USERNAME:$USERNAME.devcrate;dck" | chpasswd

## setup home dir 
ENV HOME=/home
WORKDIR $HOME

# install scripts
COPY containers/devcrate/bin/ $HOME/.local/bin/
RUN chmod -R u+x $HOME/.local/bin/*
ENV PATH="$HOME/.local/bin/:$PATH"

# configure permissions
RUN chown -R $USERNAME $HOME \
    && mkdir -p $HOME/.local/bin/
USER $USERNAME

# copy config files
COPY dotfiles /tmp/dotfiles
RUN make -C /tmp/dotfiles/base

## configure tools with plugins
# zsh
ENV ZPLUG_HOME=/home/$USERNAME/.zplug
RUN git clone https://github.com/zplug/zplug $ZPLUG_HOME

# tmux
