#
# Devcrate
# ZSH Configuration file
#

## Lazy Loading Implmentation
# Usage: lazy_load(load_cmd, activator, activators... __EOA__ args_activator
# Runs the lazy load command, dealiases all activators and executes the
# activator with the given command line arguments
lazy_load()
{
    load_cmd="$1";shift
    activator="$2";shift

    # Unalias activator aliases since the lazy is about to be run
    local PARSED_ACTIVATORS=false # Whether activators have been parsed
    local ACTIVATOR_ARGS="" 
    for arg in $*
    do
        if [ $arg = "__EOA__" ]
        then 
            local PARSED_ACTIVATORS=true
        else
            if $PARSED_ACTIVATORS
            then 
                # Collect command line arguments for activator command
                ACTIVATOR_ARGS="$ACTIVATOR_ARGS $arg"
            else
                # Remove activator aliases since load command has already run
                unalias "$arg"
            fi
        fi
    done

    # Run Lazy load command
    eval " $load_cmd"

    # Run activator with collected command line args
    eval " $activator $ACTIVATOR_ARGS"
}

# Usage: lazy(load_cmd, activators...)
# Mitigates the unnecessary overhead of the the 'load_cmd' on startup, only
# runs the load command if the user touches any of the 'activators' aliases,
# then which the lazy loader actually loads the load command.
# activators is a space seperated string of activation alias that will cause
# the load command to run, thereafter activator command will run.
# 
lazy()
{
    load_cmd="$1"
    shift
    for activator in $*
    do
        # printf required because load command can contain spaces
        # __EOA__ is used to enote end of activators and start of command line arguments for the activators
        load_alias="`printf 'lazy_load "%s" %s %s "__EOA__" \n' "$load_cmd" "$activator" "$*"`"
        alias "$activator"="$load_alias"
    done 
}

## lazy loads
# lazy load conda
load_conda()
{
    export PATH="~/.conda/bin:$PATH"
    source $HOME/.conda/etc/profile.d/conda.sh
}
lazy load_conda conda
# lazy load k8s completion
lazy "source <(kubectl completion zsh)" kubectl
lazy "source <(helm completion zsh)" helm
lazy "source <(microk8s.kubectl completion zsh)" microk8s.kubectl
# lazy load sdkman 
load_sdkman() 
{
    export SDKMAN_DIR="/Users/user/.sdkman"
    [[ -s "/Users/user/.sdkman/bin/sdkman-init.sh" ]] && source "/Users/user/.sdkman/bin/sdkman-init.sh"
}
lazy load_sdkman sdk
# lazy load gcloud
load_gcloud()
{
    # macos specific config
    if [ $(uname -s) = "Darwin" ]
    then

        # The next line updates PATH for the Google Cloud SDK.
        if [ -f '/Users/user/.local/share/gcloud/path.zsh.inc' ]; then . '/Users/user/.local/share/gcloud/path.zsh.inc'; fi

        # The next line enables shell command completion for gcloud.
        if [ -f '/Users/user/.local/share/gcloud/completion.zsh.inc' ]; then . '/Users/user/.local/share/gcloud/completion.zsh.inc'; fi
    fi

}
lazy load_gcloud gcloud
