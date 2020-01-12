#
# Devcrate
# ZSH Environment Configuration
#

#Paths
export GOPATH="$HOME/doc/code/go"
export GO111MODULE="on" # enable go modules
export PATH="/usr/local/bin:$PATH"
export MANPATH="/usr/local/man:$MANPATH"
export PATH="$GOPATH/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"

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
