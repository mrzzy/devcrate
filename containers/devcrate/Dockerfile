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
    curl gnupg-agent sudo locales xz-utils \
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
    universal-ctags docker-ce-cli nodejs python3-pip python3-setuptools jq \
    && rm -rf /var/lib/apt/lists/* /var/cache/apt/archives/* \
    && npm install -g yarn && npm cache clean --force  \
    # workaround for cryptography depending on setuptools-rust
    # https://github.com/pyca/cryptography/issues/5771
    && pip3 install --upgrade pip \
    && pip3 install --no-cache-dir neovim docker-compose codespell detect-secrets pre-commit

# install rust
RUN curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

RUN SS_RELEASE_JSON=$(curl --silent "https://api.github.com/repos/shadowsocks/shadowsocks-rust/releases/latest" | jq -r '.assets[] | select(.name | test("x86_64-unknown-linux-gnu\\.tar\\.xz$"))') \
    && SS_ARCHIVE=$(echo $SS_RELEASE_JSON | jq -r '.name') \
    && wget $(echo $SS_RELEASE_JSON | jq -r ".browser_download_url") -O $SS_ARCHIVE \
    && tar -xf $SS_ARCHIVE -C /usr/local/bin/

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

# configure permissions
RUN chown -R $USERNAME $HOME && chmod -R 755 $HOME && chmod -R u+x $BIN_DIR
USER $USERNAME

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
RUN git clone https://github.com/pyenv/pyenv.git ~/.pyenv

## install plugins
RUN mkdir -p $CONFIG_DIR/zsh \
    && mkdir -p $CONFIG_DIR/tmux \
    && mkdir -p $CONFIG_DIR/nvim/
COPY dotfiles/base/zsh/plugin.zsh $CONFIG_DIR/zsh/
COPY dotfiles/base/zsh/plugin_list.txt $CONFIG_DIR/zsh/
COPY dotfiles/base/tmux/plugin.tmux $CONFIG_DIR/tmux/
COPY dotfiles/base/nvim_plugin $CONFIG_DIR/nvim_plugin/
COPY dotfiles/base/nvim/plugin.vim $CONFIG_DIR/nvim/
USER root
RUN chmod -R u+x $CONFIG_DIR/ && chown -R $USERNAME $CONFIG_DIR/
USER $USERNAME

# zsh
RUN mkdir -p $HOME/.cache/antibody \
        && zsh -c "source $HOME/.config/zsh/plugin.zsh && antibody update"
# tmux
RUN echo "source-file ~/.config/tmux/plugin.tmux" > ~/.tmux.conf \
    && ~/.tmux/plugins/tpm/bin/install_plugins
# vim plugins
RUN nvim --headless -u $HOME/.config/nvim/plugin.vim +PlugInstall +qall \
    && yarn cache clean

# copy scripts
COPY containers/devcrate/bin/* $BIN_DIR/
ENV PATH="$BIN_DIR:$PATH"
USER root
RUN chmod -R u+x $BIN_DIR/ && chown -R $USERNAME $BIN_DIR/
USER $USERNAME

## configure tools
# copy dotfiles
COPY dotfiles $SHARE_DIR/dotfiles
# install config files
RUN make -C $SHARE_DIR/dotfiles/base

# configure git
ARG GIT_EMAIL="program.nom@gmail.com"
ARG GIT_FULLNAME="Zhu Zhanyan"
ENV GIT_EMAIL=$GIT_EMAIL
ENV GIT_FULLNAME=$GIT_FULLNAME

## container entrypoint
ENV TERM xterm-256color
CMD [ "zsh", "-l" ]
ENTRYPOINT [ "sh", "/home/.local/bin/entrypoint.sh" ]
