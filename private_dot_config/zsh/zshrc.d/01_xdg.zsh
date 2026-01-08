# XDG Settings
# Thanks: xdg-ninja

export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_STATE_HOME="$HOME/.local/state"
export XDG_CACHE_HOME="$HOME/.cache"

export ANDROID_USER_HOME="$XDG_DATA_HOME"/android
export ANDROID_HOME="$XDG_DATA_HOME"/android/sdk

export CARGO_HOME="$XDG_DATA_HOME"/cargo
export DOCKER_CONFIG="$XDG_CONFIG_HOME"/docker
export DOTNET_CLI_HOME="$XDG_DATA_HOME"/dotnet
export GOPATH="$XDG_DATA_HOME"/go
export GRADLE_USER_HOME="$XDG_DATA_HOME"/gradle
export NUGET_PACKAGES="$XDG_CACHE_HOME"/NuGetPackages
export RUSTUP_HOME="$XDG_DATA_HOME"/rustup
export DOT_SAGE="$XDG_CONFIG_HOME"/sage
export TEXMFVAR="$XDG_CACHE_HOME"/texlive/texmf-var

export NPM_CONFIG_INIT_MODULE="$XDG_CONFIG_HOME"/npm/config/npm-init.js
export NPM_CONFIG_CACHE="$XDG_CACHE_HOME"/npm
export NODE_REPL_HISTORY="$XDG_STATE_HOME"/node_repl_history

export GTK2_RC_FILES="$XDG_CONFIG_HOME"/gtk-2.0/gtkrc
export GDBHISTFILE="$XDG_CONFIG_HOME"/gdb/gdb_history
export PYTHON_HISTORY="$XDG_STATE_HOME"/python/history
