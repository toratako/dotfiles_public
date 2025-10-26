# Aliases

## For XDG
alias "wget"="wget --hsts-file=$XDG_DATA_HOME/wget-hsts"
alias "mitmproxy"="mitmproxy --set confdir=$XDG_CONFIG_HOME/mitmproxy"
alias "mitmweb"="mitmweb --set confdir=$XDG_CONFIG_HOME/mitmproxy"

## Default overrides
alias "cat"="bat --style=plain --paging=never"
alias "hexdump"="hexyl --border=ascii -v"
alias "ls"="eza --group-directories-first -1 -l -F -a -b --icons=always"
alias "tree"="tree --dirsfirst -C -a -I '.git|node_modules|.cache'"
alias "pwninit"='pwninit --template-path ~/.config/pwninit-template.py'
alias "gdb"="gdb -q -ex init-pwndbg $@"

### With color
alias "diff"="diff --color=always"
alias "find"="fd --color=always --hidden --follow $FD_EXCLUDE"
alias "grep"="rg --color=always"
alias "ip"="ip -color=always"
alias "ps"="ps auxf"

### Just overrides
alias "vi"="vim"
alias "code"="vscodium"
alias "curl"="curlie"

## Abbreviations
alias "c"="cd"
alias "d"="docker"
alias "f"="fuck"
alias "g"="git"
alias "l"="eza --group-directories-first -1 -l -F -a -b --icons=always"
alias "v"="vim"
alias "ff"="fastfetch"
alias "dol"="dolphin . >/dev/null 2>&1 &"
alias "lg"="lazygit"
alias "yz"="yazi"
alias "t"="tmux"
alias "b"="bat"
alias "py"="python"
alias "gpp"="g++"
alias "wlcpy"="wl-copy"
alias "wlpst"="wl-paste"

## Custom aliases
alias "venv"="source venv/bin/activate"
alias "beep"="notify-send \"Finished\""
alias "n"="notify-send \"Finished\""
alias "gip"="curl ifconfig.me"
alias "langc"="export LANG='C'"
alias "tailreboot"="sudo tailscale down && sudo tailscale up"
alias "ghq-cd"="cd \$(ghq root)/\$(ghq list | fzf)"
alias "gtree"="git log --graph --oneline --all --decorate"

## tar
alias "untargz"="tar -xvzf"
alias "untarbz2"="tar -xvjf"
alias "untarxz"="tar -xvJf"
alias "untar"="tar -xvf"

alias "targz"="tar -cvzf"
alias "tarbz2"="tar -cvjf"
alias "tarxz"="tar -cvJf"
alias "tartar"="tar -cvf"

## cd shortcuts
alias "..."="cd ./../"
alias "...."="cd ./../../"
alias "cd.."="cd ./.."
alias "cd..."="cd ./../"
alias "cd...."="cd ./../../"

## Restore
alias "ccat"="/usr/bin/cat"
alias "lls"="/bin/ls --color=always -la"
alias "ccurl"="/usr/bin/curl"
alias "ffind"="/usr/bin/find"
alias "ggrep"="/usr/bin/grep --color=always"
