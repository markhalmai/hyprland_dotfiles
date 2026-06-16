-- Hyprland Lua config generated from hyprland.conf.
-- Source backup: hyprland.conf.backup-2026-06-16

----------------
-- Monitors
----------------

hl.monitor({
    output   = "DP-1",
    mode     = "1920x1080@144",
    position = "0x0",
    scale    = 1,
    vrr      = 1,
})

hl.monitor({
    output    = "DP-2",
    mode      = "1920x1080",
    position  = "1920x0",
    scale     = 1,
    transform = 1,
})

----------------
-- Programs
----------------

local terminal    = "alacritty"
local fileManager = "dolphin"
local menu        = "wofi --show drun"

----------------
-- Autostart
----------------

hl.on("hyprland.start", function()
    hl.exec_cmd("hyprlock & waybar -c ~/.config/waybar/config -s ~/.config/waybar/style.css & hyprpaper & hyprshell")
    hl.exec_cmd("dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP")
end)

----------------
-- Environment
----------------

hl.env("GTK_THEME", "catppuccin-mocha-lavender-standard+default")
hl.env("XCURSOR_THEME", "Bibata-Modern-Classic")
hl.env("XCURSOR_SIZE", "24")
hl.env("HYPRCURSOR_SIZE", "24")
hl.env("QT_QPA_PLATFORMTHEME", "kde")
hl.env("QT_STYLE_OVERRIDE", "kvantum")

----------------
-- Look and feel
----------------

hl.config({
    general = {
        gaps_in     = 6,
        gaps_out    = 12,
        border_size = 1,
        col = {
            active_border   = "rgba(8c8c8cff)",
            inactive_border = "rgba(2a2a2aff)",
        },
        layout = "dwindle",
    },

    decoration = {
        rounding = 12,
        blur = {
            enabled           = true,
            size              = 8,
            passes            = 3,
            new_optimizations = true,
        },
        shadow = {
            enabled = false,
        },
        dim_inactive = true,
        dim_strength = 0.06,
    },

    animations = {
        enabled = true,
    },

    cursor = {
        no_hardware_cursors = 1,
    },

    input = {
        kb_layout    = "us,hu",
        kb_options   = "grp:win_space_toggle",
        follow_mouse = 1,
        sensitivity  = -0.9,
        touchpad = {
            natural_scroll = false,
        },
    },
})

hl.curve("mac", { type = "bezier", points = { { 0.25, 0.9 }, { 0.3, 1.0 } } })

hl.animation({ leaf = "windows",    enabled = true, speed = 5, bezier = "mac" })
hl.animation({ leaf = "windowsOut", enabled = true, speed = 4, bezier = "default", style = "popin 80%" })
hl.animation({ leaf = "fade",       enabled = true, speed = 4, bezier = "default" })
hl.animation({ leaf = "workspaces", enabled = true, speed = 6, bezier = "mac" })

----------------
-- Keybindings
----------------

local mainMod = "SUPER"

hl.bind(mainMod .. " + Q", hl.dsp.exec_cmd(terminal))
hl.bind(mainMod .. " + C", hl.dsp.window.close())
hl.bind(mainMod .. " + M", hl.dsp.exit())
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd(fileManager))
hl.bind(mainMod .. " + V", hl.dsp.window.float({ action = "toggle" }))
hl.bind(mainMod .. " + R", hl.dsp.exec_cmd(menu))
hl.bind(mainMod .. " + P", hl.dsp.window.pseudo())
hl.bind(mainMod .. " + F", hl.dsp.window.fullscreen_state({ internal = 2, client = 2 }))

hl.bind(mainMod .. " + left",  hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + right", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + up",    hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + down",  hl.dsp.focus({ direction = "down" }))

for workspace = 1, 10 do
    local key = workspace % 10
    hl.bind(mainMod .. " + " .. key, hl.dsp.focus({ workspace = workspace }))
    hl.bind(mainMod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = workspace }))
end

hl.bind(mainMod .. " + S", hl.dsp.exec_cmd("hyprshot -m region"))
hl.bind(mainMod .. " + SHIFT + S", hl.dsp.window.move({ workspace = "special:magic" }))

hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + mouse_up", hl.dsp.focus({ workspace = "e-1" }))

hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"), { locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"), { locked = true, repeating = true })
hl.bind("XF86AudioMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"), { locked = true, repeating = true })
hl.bind("XF86AudioMicMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"), { locked = true, repeating = true })
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%+"), { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%-"), { locked = true, repeating = true })

hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"), { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"), { locked = true })

----------------
-- Window rules
----------------

hl.window_rule({
    name  = "suppress-maximize-events",
    match = { class = ".*" },
    suppress_event = "maximize",
})

hl.window_rule({
    name = "fix-xwayland-drags",
    match = {
        class      = "^$",
        title      = "^$",
        xwayland   = true,
        float      = true,
        fullscreen = false,
        pin        = false,
    },
    no_focus = true,
})

hl.window_rule({
    name = "minimal-dolphin",
    match = { class = "dolphin" },
    opacity = "0.99 0.97",
    rounding = 14,
    border_size = 1,
    border_color = "rgba(8c8c8cff)",
})

-- PoE rule from the old config, left disabled because it was commented there.
-- hl.window_rule({
--     name = "poe-apt",
--     match = { tag = "apt" },
--     float = true,
--     no_blur = true,
--     no_shadow = true,
--     border_size = 0,
--     pin = true,
--     render_unfocused = true,
--     size = "(monitor_w*1) (monitor_h*1)",
--     center = true,
-- })
