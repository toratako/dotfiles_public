# Options

# Disable telemetry
# Thanks: https://github.com/beatcracker/toptout
export CHECKPOINT_DISABLE=1
export DOCKER_CLI_HINTS=false
export DOCKER_SCAN_SUGGEST=false
export DOTNET_CLI_TELEMETRY_OPTOUT=1
export DOTNET_SYSTEM_GLOBALIZATION_INVARIANT=1
export GOTELEMETRY=off
export NEXT_TELEMETRY_DISABLED=1
export POWERSHELL_TELEMETRY_OPTOUT=1
export VAGRANT_CHECKPOINT_DISABLE=ANY_VALUE

export BROWSER=firefox
export EDITOR=vim
export DEBUGINFOD_URLS="https://debuginfod.archlinux.org"

export LESS='-R --use-color -Dd+r$Du+b$'
export MANPAGER="sh -c 'awk '\''{ gsub(/\x1B\[[0-9;]*m/, \"\", \$0); gsub(/.\x08/, \"\", \$0); print }'\'' | bat -p -lman'"

export FD_EXCLUDE="--exclude .git --exclude node_modules --exclude .cache --exclude __pycache__ --exclude .steam --exclude .git --exclude Steam"
export FZF_DEFAULT_COMMAND="fd --type f --hidden --follow $FD_EXCLUDE"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="fd --type d --hidden --follow $FD_EXCLUDE"

export FZF_CTRL_T_OPTS="
  --walker-skip .git,node_modules,target
  --preview 'bat -n --color=always {}'
  --bind 'ctrl-/:change-preview-window(down|hidden|)'"

export FZF_ALT_C_OPTS="
  --walker-skip .git,node_modules,target
  --preview 'tree -C {}'"

export TIMEFMT=$'\n\n========================\nProgram : %J\nCPU     : %P\nuser    : %*Us\nsystem  : %*Ss\ntotal   : %*Es\n========================\n'
