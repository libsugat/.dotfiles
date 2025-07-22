#!/bin/bash

SYSTEMD_USER_DIR="$HOME/.config/systemd/user"
DOTFILES_SYSTEMD="$HOME/.dotfiles/systemd"

mkdir -p "$SYSTEMD_USER_DIR"

for kind in services timers; do
  echo "Processing $kind..."
  for unit in "$DOTFILES_SYSTEMD/$kind"/*.{service,timer}; do
    [ -e "$unit" ] || continue
    target="$SYSTEMD_USER_DIR/$(basename "$unit")"
    echo "Creating symlink: $target -> $unit"
    ln -sf "$unit" "$target"
  done
done

echo "Reloading systemd user daemon..."
systemctl --user daemon-reload

echo "Enabling and starting timers if not already enabled..."
for timer_path in "$DOTFILES_TIMERS_DIR/timers"/*.timer; do
  timer_name=$(basename "$timer_path")
  if ! systemctl --user is-enabled --quiet "$timer_name"; then
    echo "Enabling and starting timer: $timer_name"
    systemctl --user enable --now "$timer_name"
  else
    echo "Timer $timer_name is already enabled."
  fi
done

echo "Setup complete."
