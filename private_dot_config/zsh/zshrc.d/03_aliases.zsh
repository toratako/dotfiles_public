# Aliases

## For XDG
alias mitmproxy="mitmproxy --set confdir=$XDG_CONFIG_HOME/mitmproxy"
alias mitmweb="mitmweb --set confdir=$XDG_CONFIG_HOME/mitmproxy"
alias wget="wget --hsts-file=$XDG_DATA_HOME/wget-hsts"

## Default overrides
alias cat="bat --style=plain --paging=never"
alias gdb="gdb -q -ex init-pwndbg $@"
alias hexdump="hexyl --border=ascii -v"
alias ls="eza --group-directories-first -1 -l -F -a -b --icons=always"
alias ps="ps auxf"
alias pwninit='pwninit --template-path ~/.config/pwninit-template.py'
alias tree="tree --dirsfirst -C -a -I '.git|node_modules|.cache'"
alias checksec="/bin/checksec"

### With color
alias diff="diff --color=always"
alias find="fd --color=always --hidden --follow $FD_EXCLUDE"
alias grep="rg --color=always"
alias ip="ip -color=always"

### Just overrides
alias code="vscodium"
alias curl="curlie"
alias vi="vim"

## Abbreviations
alias b="bat"
alias c="cd"
alias d="docker"
alias f="fuck"
alias g="git"
alias l="eza --group-directories-first -1 -l -F -a -b --icons=always"
alias t="tmux"
alias v="vim"
alias ff="fastfetch"
alias lg="lazygit"
alias py="python"
alias yz="yazi"
alias dol="dolphin . >/dev/null 2>&1 &"
alias gpp="g++"
alias ldocker="lazydocker"
alias lgit="lazygit"
alias wlcpy="wl-copy"
alias wlpst="wl-paste"

## Custom aliases
alias beep="notify-send \"Finished\""
alias ghq-cd="cd \$(ghq root)/\$(ghq list | fzf)"
alias gip="curl ifconfig.me"
alias gtree="git log --graph --oneline --all --decorate"
alias langc="export LANG='C'"
alias n="notify-send \"Finished\""
alias tailreboot="sudo tailscale down && sudo tailscale up"
alias venv="source venv/bin/activate"

## tar
alias untargz="tar -xvzf"
alias untarbz2="tar -xvjf"
alias untarxz="tar -xvJf"
alias untar="tar -xvf"

alias targz="tar -cvzf"
alias tarbz2="tar -cvjf"
alias tarxz="tar -cvJf"
alias tartar="tar -cvf"

## cd shortcuts
alias "..."="cd ./../"
alias "...."="cd ./../../"
alias "cd.."="cd ./.."
alias "cd..."="cd ./../"
alias "cd...."="cd ./../../"

## Restore
alias ccat="/usr/bin/cat"
alias ccurl="/usr/bin/curl"
alias ffind="/usr/bin/find"
alias ggrep="/usr/bin/grep --color=always"
alias lls="/bin/ls --color=always -la"
alias pps="ps auxf"
