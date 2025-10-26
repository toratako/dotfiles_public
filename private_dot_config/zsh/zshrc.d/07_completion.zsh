# Complement

# Thanks: https://thevaluable.dev/zsh-completion-guide-examples/
zstyle ':completion:*' completer _extensions _complete _approximate
# add colors
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
# selectable menu
zstyle ':completion:*:default' menu 'select'
# match both lower and upper
zstyle ':completion:*' matcher-list '' 'm:{[:lower:]}={[:upper:]}' '+m:{[:upper:]}={[:lower:]}'
# sort by modification time
zstyle ':completion:*' file-sort 'modification'

# for fzf-tab

# Thanks: https://github.com/Aloxaf/fzf-tab/issues/58
zstyle ':completion:complete:*:argument-rest' sort false
zstyle ':completion:*' menu no
zstyle ':fzf-tab:*' use-fzf-default-opts yes
zstyle ':fzf-tab:*' fzf-bindings 'space:accept'
zstyle ':fzf-tab:*' accept-line enter

autoload -Uz compinit
compinit -d "$XDG_CACHE_HOME"/zsh/zcompdump-"$ZSH_VERSION"
