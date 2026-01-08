# Completion

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
# zstyle ':fzf-tab:*' disabled-on any
# zstyle ':fzf-tab:*' query-string ''
# zstyle ':fzf-tab:*' fzf-flags --color=fg:1,fg+:2 --bind=tab:accept
# zstyle ':fzf-tab:complete:(cd|ls|z):*' fzf-preview 'eza --group-directories-first -1 -l -F -a -b --icons=always --color=always $realpath'

autoload -Uz compinit
local dump_file="$XDG_CACHE_HOME/zsh/zcompdump-$ZSH_VERSION"

if [[ -n "$dump_file"(#qN.m-1) ]]; then
  compinit -C -d "$dump_file"
else
  compinit -d "$dump_file"
fi
