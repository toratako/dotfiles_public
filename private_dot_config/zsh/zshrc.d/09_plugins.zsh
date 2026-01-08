# Initialize plugins/tools

# fzf-tab needs fzf initialization
source <(fzf --zsh)

# Thanks: https://zenn.dev/fuzmare/articles/zsh-plugin-manager-cache
sheldon_cache="$XDG_CACHE_HOME/sheldon.zsh"
sheldon_toml="$XDG_CONFIG_HOME/sheldon/plugins.toml"
if [[ ! -r "$sheldon_cache" || "$sheldon_toml" -nt "$sheldon_cache" ]]; then
  sheldon source > $sheldon_cache
fi
source "$sheldon_cache"
unset sheldon_cache sheldon_toml

eval "$(starship init zsh)"

if type zsh-defer >/dev/null; then
    zsh-defer eval "$(mise activate zsh)"
    zsh-defer eval "$(zoxide init zsh)"
    zsh-defer eval "$(navi widget zsh)"
else
    eval "$(mise activate zsh)"
    eval "$(zoxide init zsh)"
    eval "$(navi widget zsh)"
fi

# eval "$(direnv hook zsh)"

if [ -e "$HOME/.safe-chain/scripts/init-posix.sh" ]; then
    source "$HOME/.safe-chain/scripts/init-posix.sh"
fi
