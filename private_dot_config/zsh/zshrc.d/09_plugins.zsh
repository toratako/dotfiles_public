# Initialize plugins/tools

# fzf-tab needs fzf initialization
source <(fzf --zsh)
eval "$(sheldon source)"
eval "$(starship init zsh)"
eval "$(mise activate zsh)"
eval "$(uv generate-shell-completion zsh)"
eval "$(zoxide init zsh)"
eval "$(navi widget zsh)"
eval "$(thefuck --alias)"

# eval "$(direnv hook zsh)"

if [ -e "$HOME/.safe-chain/scripts/init-posix.sh" ]; then
    source "$HOME/.safe-chain/scripts/init-posix.sh"
fi
