# Keybindings

bindkey -e

# Home key
bindkey "^[[H"      beginning-of-line
bindkey "^[OH"      beginning-of-line
bindkey "^[[1~"     beginning-of-line
bindkey "^[[7~"     beginning-of-line

# End key
bindkey "^[[F"      end-of-line
bindkey "^[OF"      end-of-line
bindkey "^[[4~"     end-of-line
bindkey "^[[8~"     end-of-line

# Delete key
bindkey "^[[3~"     delete-char

# Shift+Tab for reverse menu selection
bindkey "[[Z"       reverse-menu-complete
bindkey "^[[Z"      reverse-menu-complete

# Ctrl + Arrow keys for word-wise movement
bindkey '^[[1;5C'   forward-word
bindkey '^[[5C'     forward-word
bindkey '^[OC'      forward-word
bindkey '^[[1;5D'   backward-word
bindkey '^[[5D'     backward-word
bindkey '^[OD'      backward-word

# Arrow keys
bindkey "^[[C"      forward-char
bindkey "^[OC"      forward-char
bindkey "^[[D"      backward-char
bindkey "^[OD"      backward-char

# Ctrl+Delete/Ctrl+Backspace
bindkey '^[[3;5~'   kill-word
bindkey '^[^?'      backward-kill-word
bindkey '^H'        backward-kill-word

# UP and DOWN arrows for history substring search
bindkey "^[[A"      history-substring-search-up
bindkey "^[[B"      history-substring-search-down
