# Hyprland Dotfiles

Personal Hyprland setup with a dark, minimal, macOS-ish look:

- Hyprland Lua config
- Hyprpaper wallpaper config
- Waybar
- Wofi
- Alacritty
- GTK / xsettingsd theme settings
- Kvantum theme selection
- KDE / Dolphin dark minimal config
- Fish helper for starting Hyprland with the Lua config

## Requirements

Install the packages you use with this setup:

```sh
sudo pacman -S --needed hyprland hyprpaper waybar wofi alacritty dolphin \
  papirus-icon-theme bibata-cursor-theme kvantum kvantum-qt5
```

Optional but expected by the config:

```sh
sudo pacman -S --needed hyprlock brightnessctl playerctl pavucontrol
```

The GTK theme used here is:

```text
catppuccin-mocha-lavender-standard+default
```

The cursor theme is:

```text
Bibata-Modern-Classic
```

The Kvantum theme is:

```text
KvMojave
```

## Install

From the repository root:

```sh
./install.sh
```

The installer creates symlinks from this repository into `~/.config`.
If a target already exists and is not the intended symlink, it is moved to
`*.backup-YYYYmmdd-HHMMSS` first.

## Starting Hyprland

This repo installs a fish helper:

```fish
start-hyprland-lua
```

It verifies the Lua config before starting:

```fish
Hyprland --verify-config --config ~/.config/hypr/hyprland.lua
```

If you still want to use the old .config file for now `start-hyprland` command remains a fallback if you keep a legacy
`~/.config/hypr/hyprland.conf`.

## Local Tweaks

`hypr/hyprpaper.conf` points to:

```text
/home/cisztah/Pictures/wallpaper7.jpg
```

Change that path if you use the repo on another machine.

Monitor names and layout are currently machine-specific:

- `DP-1`: 1920x1080@144, primary
- `DP-2`: 1920x1080, rotated

Adjust `hypr/hyprland.lua` if your outputs differ.
