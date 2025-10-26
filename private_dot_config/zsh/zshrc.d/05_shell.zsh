# Shell Options

## Misc
setopt auto_cd
setopt no_beep
setopt nolistbeep
setopt RM_STAR_SILENT

## History
export HISTFILE="$XDG_STATE_HOME"/zsh/history
export HISTSIZE=50000
export SAVEHIST=50000
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
setopt extendedglob
setopt nonomatch

setopt list_packed
setopt list_rows_first

unsetopt caseglob
setopt complete_in_word
setopt magic_equal_subst
