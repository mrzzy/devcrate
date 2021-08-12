#
# Devcrate
# ZSH Aliases
#

# Aliases
alias ls='ls -F'
alias md="mkdir -p"
alias vim="nvim"
alias v="nvim"
alias py="python3"
alias rb="ruby"
alias gl="git log --pretty=oneline --graph"
alias t="tmux new-session -A -s $HOST"
alias less="less -R"
alias r="ranger"
alias k="kubectl"
alias mk="microk8s.kubectl"
alias o="rifle"
alias open="rifle"
alias tf="terraform"
alias g="git"
alias gvm="/home/zzy/.local/go/bin/g"
alias nvm="/home/zzy/.local/share/n/bin/n"
alias rc="rclone"

## virtual machine management
## vmv_shutdown(): shutdown vm of the given domain
vmv_shutdown()
{
    echo "Stopping VM: $VM_DOMAIN ..."
    if ! virsh shutdown "$VM_DOMAIN"
    then
        echo "Error: failed to stop VM $VM_DOMAIN"
    fi

    # unhook trap on ctrl-c
    trap - SIGINT
}

# Alias Function
# vmv(<domain>): starts vm of the given domain and attaches a viewer to it
vmv()
{
    VM_DOMAIN="$1"
    echo "Starting VM $VM_DOMAIN..."
    if virsh start "$VM_DOMAIN"
    then
        # capture ctrl-c to shutdown vm
        trap vmv_shutdown SIGINT
        echo "OK: Started VM: $VM_DOMAIN"
        virt-viewer "$VM_DOMAIN"
    else
        echo "FATAL: Could not start VM with domain $VM_DOMAIN"
    fi
}
