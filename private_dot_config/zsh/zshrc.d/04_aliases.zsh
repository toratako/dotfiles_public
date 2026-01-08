# Aliases

## For XDG, config
alias mitmproxy="mitmproxy --set confdir=$XDG_CONFIG_HOME/mitmproxy"
alias mitmweb="mitmweb --set confdir=$XDG_CONFIG_HOME/mitmproxy"
alias wget="wget --hsts-file=$XDG_DATA_HOME/wget-hsts"
alias pwninit='pwninit --template-path ~/.config/pwninit-template.py'

## Overrides
alias cat="bat --style=plain --paging=never"
alias checksec="/bin/checksec file --no-banner"
alias code="vscodium"
alias cp="cp -i"
alias curl="curlie"
alias df="df -h"
alias du="du -h"
alias emacs="emacs --no-window-system"
alias gdb="gdb -q -ex init-pwndbg $@"
alias hexdump="hexyl --border=ascii -v"
alias ls="eza --group-directories-first -1 -l -F -a -b --icons=always"
alias mv="mv -i"
alias ps="ps auxf"
alias rm="trash-put"
alias tree="tree --dirsfirst -C -a -I '.git|node_modules|.cache'"

## With color
# alias find="fd --color=always --hidden --follow $FD_EXCLUDE"
# alias grep="rg --color=always"
alias diff="diff --color=always"
alias egrep="egrep --color=auto"
alias fgrep="fgrep --color=auto"
alias ip="ip -color=always"

## Abbreviations
alias d="docker"
alias dol="dolphin . >/dev/null 2>&1 &"
alias ff="fastfetch"
alias g="git"
alias gpp="g++"
alias h="helix"
alias l="eza --group-directories-first -1 -l -F -a -b --icons=always"
alias la="command eza -A --color=auto"
alias ldocker="lazydocker"
alias lg="lazygit"
alias lgit="lazygit"
alias ll="command eza -alF --color=auto"
alias py="python"
alias t="tmux"
alias wlcpy="wl-copy"
alias wlpst="wl-paste"
alias yz="yazi"

## Custom aliases
alias beep="notify-send \"Finished\""
alias chezmoi-cd="cd $(chezmoi source-path)"
alias chezmoicd="cd $(chezmoi source-path)"
alias ghq-cd="cd \$(ghq root)/\$(ghq list | fzf)"
alias ghqcd="cd \$(ghq root)/\$(ghq list | fzf)"
alias gip="curl ifconfig.me"
alias groot='cd "$(git rev-parse --show-toplevel 2>/dev/null)"'
alias langc="export LANG='C'"
alias n="notify-send \"Finished\""
alias tailreboot="sudo tailscale down && sudo tailscale up"
alias venv="source venv/bin/activate"

## tar
alias targz="tar -cvzf"
alias tarbz2="tar -cvjf"
alias tarxz="tar -cvJf"
alias tartar="tar -cvf"

alias untargz="tar -xvzf"
alias untarbz2="tar -xvjf"
alias untarxz="tar -xvJf"
alias untar="tar -xvf"

## cd shortcuts
alias "..."="cd ./../../"
alias "...."="cd ./../../../"
alias "cd.."="cd ./.."
alias "cd..."="cd ./../../"
alias "cd...."="cd ./../../../"
