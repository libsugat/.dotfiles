#!/bin/bash
# setup.sh — symlink config files from this repo to home directory

set -e

DOTFILES_DIR=$(pwd)

declare -A FILES=(
  ["$HOME/.tmux.conf"]="$DOTFILES_DIR/tmux/.tmux.conf"
  ["$HOME/.config/nvim"]="$DOTFILES_DIR/nvim"
  ["$HOME/.config/kitty"]="$DOTFILES_DIR/kitty"
  ["$HOME/.config/starship.toml"]="$DOTFILES_DIR/starship.rs/starship.toml"
  ["$HOME/.zshrc"]="$DOTFILES_DIR/zsh/.zshrc"
  ["$HOME/.config/sway"]="$DOTFILES_DIR/desktop/sway"
  ["$HOME/.config/waybar"]="$DOTFILES_DIR/desktop/waybar"
  ["$HOME/.config/swaync"]="$DOTFILES_DIR/desktop/swaync"
)
echo "⚠️ Warning: This will overwrite existing config files:"
for target in "${!FILES[@]}"; do
  if [ -e "$target" ] || [ -L "$target" ]; then
    echo "  - $target"
  fi
done

read -p "Do you want to continue? (y/N): " confirm
confirm=${confirm,,} # to lowercase

if [[ "$confirm" != "y" && "$confirm" != "yes" ]]; then
  echo "Aborted. No changes made."
  exit 1
fi

# Clone tpm
echo "Cloning tmux plugin manager"
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

echo "Starting dotfiles setup from $DOTFILES_DIR"

for target in "${!FILES[@]}"; do
  src="${FILES[$target]}"
  
  if [ -e "$target" ] || [ -L "$target" ]; then
    echo "Removing existing file or symlink: $target"
    rm -rf "$target"
  fi

  # Ensure parent directory exists for target
  mkdir -p "$(dirname "$target")"
  
  echo "Linking $target → $src"
  ln -s "$src" "$target"
done

echo "✅ Dotfiles setup complete!"
