
# ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#ff00ff,bg=cyan,bold,underline"
ZSH_AUTOSUGGEST_STRATEGY=(history completion)

# Lines configured by zsh-newuser-install
HISTFILE=~/.zhistory
HISTTIMEFORMAT="%F %T "
HISTSIZE=100000
SAVEHIST=10000000
setopt EXTENDED_HISTORY
setopt SHARE_HISTORY
setopt autocd extendedglob notify
unsetopt beep nomatch
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/tlss/.zshrc'

fpath=(~/.zsh/zsh-completions/src $fpath)
autoload -Uz compinit
compinit
# End of lines added by compinstall

# 启用历史命令搜索
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down
bindkey -M vicmd 'k' history-substring-search-up
bindkey -M vicmd 'j' history-substring-search-down

PS1='%F{red}[%m@s30] %f%F{green}%~%f
%F{blue}✵%f '

alias ls="eza"
alias ll="eza -lg --git"
alias la="eza -lga --git"
alias lt="eza -lag --git --tree --level"
alias t2="eza -lag --git --tree --level=2"
alias df="df -h"
alias du="du --max-depth=1 -h"
alias vim="nvim"
alias v="nvim"
alias ra="yazi"
alias lg="lazygit"

export TERM="xterm-256color"

source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.zsh/zsh-history-substring-search/zsh-history-substring-search.zsh
source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
