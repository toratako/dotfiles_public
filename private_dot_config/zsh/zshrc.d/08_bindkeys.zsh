# Keybindings

bindkey -e
# Home key
bindkey "^[[H" beginning-of-line
bindkey "^[OH" beginning-of-line
# End key
bindkey "^[[F" end-of-line
bindkey "^[OF" end-of-line
# Delete key
bindkey "^[[3~" delete-char
# UP and DOWN arrows for history substring search
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down
# Shift+Tab for reverse menu selection
bindkey '^[[Z' reverse-menu-complete
