# Options
setopt AUTO_CD
setopt AUTO_PUSHD
setopt PUSHD_IGNORE_DUPS
setopt PUSHD_MINUS

autoload -U compinit
compinit

# VCS
autoload -Uz vcs_info

zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:*' formats '%F{yellow}(%F{green}%B%b%%b%c%u%F{yellow})'
zstyle ':vcs_info:*' actionformats '%F{yellow}(%F{green}%B%b%%b%F{yellow}|%F{red}%a %m%c%u%F{yellow})'
zstyle ':vcs_info:*' patch-format '%10>...>%F{yellow}%p%<< %F{cyan}%n/%a'
zstyle ':vcs_info:*' stagedstr '%F{green}%1{●%}'
zstyle ':vcs_info:*' unstagedstr '%F{red}%1{●%}'
zstyle ':vcs_info:*+set-message:*' hooks stage_status
function +vi-stage_status {
    if [[ -n ${hook_com[staged]} || -n ${hook_com[unstaged]} ]]; then
        hook_com[staged]='%F{yellow}|'${hook_com[staged]}
    fi
}

# Prompt
function precmd {
    vcs_info
}

setopt PROMPT_SUBST
PROMPT='%F{blue}%~ %(?.%F{green}.%F{red})%#%f '
RPROMPT='${vcs_info_msg_0_}'

# Aliases
alias c='cat'
alias d='dirs -v'
alias e='echo'
alias g='git'
alias j='jobs'
alias l='less'
alias la='ls -aGhl'
alias m='man'
alias p='popd'
alias pu='pushd'
alias s='ssh'
alias sbg='ssh -fN'
alias t='tree'
alias v='vim -p'

# Plugins
if [[ -v SSH_CLIENT ]]; then
    ZSH_TMUX_AUTOSTART=true
fi
ZSH_TMUX_UNICODE=true

Z_DIR=~/.lib/zsh
OMZ_DIR=$Z_DIR/ohmyzsh

for e (
    clipboard
    completion
    grep
    history
    key-bindings
) source $OMZ_DIR/lib/$e.zsh

for e (
    tmux
    z
) source $OMZ_DIR/plugins/$e/$e.plugin.zsh

for e (
    zsh-autosuggestions
    zsh-syntax-highlighting
) source $Z_DIR/$e/$e.zsh

eval "$(/opt/homebrew/bin/brew shellenv)"
