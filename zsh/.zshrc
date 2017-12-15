# Pure prompt and zsh-syntax-highlighting

bindkey "${terminfo[khome]}" beginning-of-line
bindkey "${terminfo[kend]}" end-of-line
bindkey '^[[3~' delete-char

autoload -U promptinit; promptinit
prompt pure

source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
