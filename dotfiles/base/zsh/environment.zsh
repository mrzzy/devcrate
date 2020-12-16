#
# Devcrate
# ZSH Environment Configuration
#

#Paths
export GOPATH="$HOME/.local/go"
export GOROOT="$HOME/.go"
export GO111MODULE="on" # enable go modules
export PATH="/usr/local/bin:$PATH"
export MANPATH="/usr/local/man:$MANPATH"
export N_PREFIX="$HOME/.local/share/n"
export PATH="$GOPATH/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export PATH="$N_PREFIX/bin:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"
export PATH="$PATH:/snap/bin"
export PATH="$PATH:$HOME/.linkerd2/bin"

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
