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
setopt inc_append_history
setopt share_history
setopt hist_ignore_dups
setopt hist_ignore_all_dups
setopt hist_find_no_dups
setopt hist_save_no_dups
setopt hist_reduce_blanks
setopt hist_ignore_space
setopt hist_no_store

setopt auto_pushd
setopt pushd_silent
setopt pushd_ignore_dups

setopt no_case_glob
setopt extended_glob
setopt nonomatch

# I'd like check candidates first
# setopt menu_complete
# similar zstyle menu select
# setopt auto_menu
# setopt auto_list

setopt list_packed
setopt list_rows_first

unsetopt case_glob
setopt complete_in_word
setopt magic_equal_subst
# setopt glob_dots
