function start-hyprland-lua --description 'Start Hyprland with the Lua config'
    set -l config "$HOME/.config/hypr/hyprland.lua"

    Hyprland --verify-config --config "$config"
    or return $status

    exec start-hyprland -- --config "$config"
end
