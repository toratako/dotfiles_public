# Shell Options

## Misc
setopt auto_cd
setopt no_beep
setopt no_list_beep
setopt rm_star_silent

## History
export HISTFILE="$XDG_STATE_HOME"/zsh/history
export HISTSIZE=50000
export SAVEHIST=50000
# export HISTTIMEFORMAT=""
# unset HISTTIMEFORMAT
# setopt extended_history
setopt hist_find_no_dups
setopt hist_ignore_all_dups
setopt hist_ignore_dups
setopt hist_ignore_space
setopt hist_no_store
setopt hist_reduce_blanks
setopt hist_save_no_dups
setopt inc_append_history
setopt share_history

setopt auto_pushd
setopt pushd_ignore_dups
setopt pushd_silent

setopt extended_glob
setopt no_case_glob
setopt nonomatch

# I'd like check candidates first
# setopt menu_complete
# similar zstyle menu select
# setopt auto_menu
# setopt auto_list

setopt list_packed
setopt list_rows_first

# setopt glob_dots
setopt complete_in_word
setopt magic_equal_subst
unsetopt case_glob
