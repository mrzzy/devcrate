#
# Devcrate
# ZSH Plugin configuration
#

## zsh plugins
## NOTE: </dev/null is a hack to get zplug to work in docker build
source ~/.zplug/init.zsh
zplug "plugins/vi-mode", from:oh-my-zsh </dev/null
zplug "plugins/git-fast", from:oh-my-zsh </dev/null
zplug "mafredri/zsh-async" </dev/null
zplug "miekg/lean", as:theme, use:"lean.plugin.zsh" </dev/null
zplug zsh-users/zsh-autosuggestions </dev/null
zplug zsh-users/zsh-completions </dev/null

ZSH_TMUX_AUTOSTART=true

# Lean Prompt
PROMPT_LEAN_TMUX=">"
PROMPT_LEAN_VIMODE="1"
PROMPT_LEAN_NOTITLE="1"
PROMPT_LEAN_NOTITLE="1"
PROMPT_LEAN_COLOR1="244"
PROMPT_LEAN_COLOR2="208"
PROMPT_LEAN_COLOR3="244"
PROMPT_LEAN_ABBR_METHOD="shrink"

# autosuggestions
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=3"
ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE="40"
ZSH_AUTOSUGGEST_USE_ASYNC=true
bindkey "^[\t" autosuggest-accept

# fzf completions
export FZF_COMPLETION_TRIGGER="%%"
export FZF_DEFAULT_COMMAND='ag -g ""'
source "$HOME/.local/share/fzf/shell/completion.zsh"

# fzf history recall
recall_history() {
    zle kill-whole-line
    local EXEC_CMD="$( ([ -n "$ZSH_NAME" ] && fc -l 1 || history) | fzf +s --tac | sed -r 's/ *[0-9]*\*? *//' | sed -r 's/\\/\\/g')"
    zle -U "$(printf $EXEC_CMD)"
}
zle -N recall_history recall_history
bindkey "^R" recall_history

# Z directory jumping tool
source "$HOME/.local/share/z.sh"
zplug load #Load Plugins
