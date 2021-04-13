#
# Devcrate
# ZSH Environment Configuration
#

#Paths
# local bins and shortcuts
export PATH="$HOME/.local/bin:$PATH"
export PATH="/usr/local/bin:$PATH"
export PATH="$HOME/.local/bin/shortcuts:$PATH"
# local man pages
export MANPATH="/usr/local/man:$MANPATH"
# go
export GOPATH="$HOME/.local/go"
export PATH="$GOPATH/bin:$PATH"
export GOROOT="$HOME/.go"
export GO111MODULE="on" # enable go modules
# nodejs
export N_PREFIX="$HOME/.local/share/n"
export PATH="$N_PREFIX/bin:$PATH"
# rust - cargo
export PATH="$HOME/.cargo/bin:$PATH"
# snap
export PATH="$PATH:/snap/bin"
# linkerd2
export PATH="$PATH:$HOME/.linkerd2/bin"
# python pyenv
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"

#Locale
export LANG="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"

# Program settings
export SHELL=zsh
if [[ -n $SSH_CONNECTION ]]; then
    export EDITOR='vim'
    export VISUAL="vim"
else
    export EDITOR='nvim'
    export VISUAL="nvim"
fi

# Compilation flags
export ARCHFLAGS="-arch x86_64"
