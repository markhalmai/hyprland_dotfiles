#!/usr/bin/env sh
set -eu

repo_dir=$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)
config_dir="${XDG_CONFIG_HOME:-$HOME/.config}"
stamp=$(date +%Y%m%d-%H%M%S)

backup_target() {
  target=$1

  if [ -e "$target" ] || [ -L "$target" ]; then
    mv "$target" "$target.backup-$stamp"
  fi
}

link_path() {
  source=$1
  target=$2

  mkdir -p "$(dirname -- "$target")"

  if [ -L "$target" ]; then
    current=$(readlink -- "$target")
    if [ "$current" = "$source" ]; then
      return 0
    fi
  fi

  backup_target "$target"
  ln -s "$source" "$target"
}

link_path "$repo_dir/hypr/hyprland.lua" "$config_dir/hypr/hyprland.lua"
link_path "$repo_dir/hypr/hyprland.conf" "$config_dir/hypr/hyprland.conf"
link_path "$repo_dir/hypr/hyprpaper.conf" "$config_dir/hypr/hyprpaper.conf"

link_path "$repo_dir/waybar/config" "$config_dir/waybar/config"
link_path "$repo_dir/waybar/style.css" "$config_dir/waybar/style.css"
link_path "$repo_dir/waybar/scripts/volume.sh" "$config_dir/waybar/scripts/volume.sh"

link_path "$repo_dir/wofi/config" "$config_dir/wofi/config"
link_path "$repo_dir/wofi/style.css" "$config_dir/wofi/style.css"

link_path "$repo_dir/alacritty/alacritty.toml" "$config_dir/alacritty/alacritty.toml"

link_path "$repo_dir/gtk-3.0/settings.ini" "$config_dir/gtk-3.0/settings.ini"
link_path "$repo_dir/gtk-4.0/settings.ini" "$config_dir/gtk-4.0/settings.ini"
link_path "$repo_dir/gtk-4.0/assets" "$config_dir/gtk-4.0/assets"
link_path "$repo_dir/gtk-4.0/gtk.css" "$config_dir/gtk-4.0/gtk.css"
link_path "$repo_dir/gtk-4.0/gtk-dark.css" "$config_dir/gtk-4.0/gtk-dark.css"

link_path "$repo_dir/xsettingsd/xsettingsd.conf" "$config_dir/xsettingsd/xsettingsd.conf"
link_path "$repo_dir/environment.d/90-hyprland-theme.conf" "$config_dir/environment.d/90-hyprland-theme.conf"
link_path "$repo_dir/Kvantum/kvantum.kvconfig" "$config_dir/Kvantum/kvantum.kvconfig"
link_path "$repo_dir/color-schemes/HyprlandMonoMocha.colors" "$HOME/.local/share/color-schemes/HyprlandMonoMocha.colors"
link_path "$repo_dir/kdeglobals" "$config_dir/kdeglobals"
link_path "$repo_dir/dolphinrc" "$config_dir/dolphinrc"
link_path "$repo_dir/dolphin/view_properties/global/.directory" "$HOME/.local/share/dolphin/view_properties/global/.directory"
link_path "$repo_dir/kiorc" "$config_dir/kiorc"

link_path "$repo_dir/fish/functions/start-hyprland-lua.fish" "$config_dir/fish/functions/start-hyprland-lua.fish"

printf 'Dotfiles linked into %s\n' "$config_dir"
