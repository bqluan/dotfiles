# Use vi-style keybindings for command line editing
bindkey -v

# FZF & color theme
# https://github.com/junegunn/fzf
# https://github.com/catppuccin/fzf
export FZF_DEFAULT_OPTS=" \
--color=bg+:#313244,bg:#1E1E2E,spinner:#F5E0DC,hl:#F38BA8 \
--color=fg:#CDD6F4,header:#F38BA8,info:#CBA6F7,pointer:#F5E0DC \
--color=marker:#B4BEFE,fg+:#CDD6F4,prompt:#CBA6F7,hl+:#F38BA8 \
--color=selected-bg:#45475A \
--color=border:#6C7086,label:#CDD6F4"

# Starship
# https://starship.rs
eval "$(starship init zsh)"

# Zoxide
# https://github.com/ajeetdsouza/zoxide
eval "$(zoxide init zsh)"

# Auto-suggestions
# https://github.com/zsh-users/zsh-autosuggestions
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# Aliases
alias c="clear"
alias dps="docker ps -a"
alias lzd="lazydocker"
alias lzg="lazygit"
alias v="nvim"
