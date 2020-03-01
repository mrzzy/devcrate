#
# devcrate
# Base image dockerfile
#

FROM ubuntu:18.04 AS repo

# env vars to signal docker build
ENV IS_DEVCRATE=1

## setup repos
# install minimum packages required to bootstrap actual
# package installation
RUN apt-get update && apt-get install -y --no-install-recommends \
    apt-transport-https ca-certificates software-properties-common \
    curl gnupg-agent sudo locales \
    && add-apt-repository ppa:apt-fast/stable \
    && apt-get install -y --no-install-recommends apt-fast

# generate locales - english sg 
RUN sed -i -e 's/# en_SG.UTF-8 UTF-8/en_SG.UTF-8 UTF-8/' /etc/locale.gen && \
    locale-gen
 
## add package repos
RUN curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add - \
    && add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu bionic stable" \
    && add-apt-repository ppa:neovim-ppa/stable \
    && curl -sL https://deb.nodesource.com/setup_10.x | bash - \
    && add-apt-repository ppa:hnakamur/universal-ctags

## install tools
RUN apt-fast install -y --no-install-recommends \
    ranger zsh tmux git make silversearcher-ag entr neovim \
    shadowsocks-libev openssh-client iputils-ping netcat wget htop \
    universal-ctags docker-ce-cli nodejs \
    && rm -rf /var/lib/apt/lists/* /var/cache/apt/archives/* \
    && npm install -g yarn && npm cache clean --force 

## setup user & groups
ARG USERNAME=user
ENV HOME=/home
RUN useradd --home-dir $HOME \
    --uid 1000 \
    --shell /usr/bin/zsh \
    --groups sudo,adm,root $USERNAME
RUN echo '%sudo ALL=(ALL) NOPASSWD: ALL' | EDITOR='tee -a' visudo

## setup home dir 
WORKDIR $HOME
ARG BIN_DIR=$HOME/.local/bin
ARG SHARE_DIR=$HOME/.local/share
ARG CONFIG_DIR=$HOME/.config
ENV PATH="$BIN_DIR:$PATH"
RUN mkdir -p $BIN_DIR $SHARE_DIR $CONFIG_DIR

# install plugin managers
# antibody for zsh plugins/vimplug for neovim plugins and tpm for tmux plugins
RUN curl -sfL git.io/antibody | sh -s - -b $BIN_DIR \
    && curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim \    
    && git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# install local devtools - fzf
ENV PATH="$HOME/.local/share/fzf/bin:$PATH"
RUN git clone https://github.com/junegunn/fzf.git ~/.local/share/fzf \
    && ~/.local/share/fzf/install --bin \
    && cp $HOME/.local/share/fzf/bin/fzf $BIN_DIR/
    

## configure tools
# copy dotfiles
COPY dotfiles $SHARE_DIR/dotfiles

# copy scripts
COPY containers/devcrate/bin/* $BIN_DIR/
RUN chmod -R u+x $BIN_DIR/


# configure permissions
RUN chown -R $USERNAME $HOME && chmod -R 755 $HOME && chmod -R u+x $BIN_DIR
USER $USERNAME

# install config files
RUN make -C $SHARE_DIR/dotfiles/base

# install plugins
# zsh
RUN mkdir -p $HOME/.cache/antibody && zsh -c "source ~/.zshrc && antibody update"
# tmux
ENV TMUX_PLUGIN_MANAGER_PATH=$HOME/.tmux/plugins
RUN ~/.tmux/plugins/tpm/bin/install_plugins
# vim plugins
RUN nvim +PlugInstall +qall && yarn cache clean
# configure git
ENV GIT_EMAIL=$GIT_EMAIL
ENV GIT_FULLNAME=$GIT_FULLNAME

## container entrypoint
ENV TERM xterm-256color
CMD [ "zsh", "-l" ]
#ENTRYPOINT [ "sh", "entrypoint.sh" ]
