local colors = require("mocha")
local border1 = colors.border1
local inactiveBorder = colors.inactiveBorder
local shadow = colors.shadow

-------------------------------
---- ENVIRONMENT VARIABLES ----
-------------------------------

hl.env("LIBVA_DRIVER_NAME", "nvidia")
hl.env("__GLX_VENDOR_LIBRARY_NAME", "nvidia")

hl.env("HYPRCURSOR_THEME", "rose-pine-hyprcursor")
hl.env("HYPRCURSOR_SIZE", "27")
hl.env("XCURSOR_THEME", "Nordzy-cursors")
hl.env("XCURSOR_SIZE", "24")

------------------
---- MONITORS ----
------------------

hl.monitor({ output = "DP-2", mode = "2560x1440@180", position = "auto-left", scale = 1 })
hl.monitor({ output = "DP-1", mode = "2560x1440@180", position = "auto-right", scale = 1 })

hl.workspace_rule({ workspace = "9", monitor = "DP-1" })
hl.workspace_rule({ workspace = "1", monitor = "DP-2" })

---------------------
---- MY PROGRAMS ----
---------------------

local terminal = "kitty"
local fileManager = "nautilus"
local menu = "wofi"
local code = "code"
local browser = "firefox"

-------------------
---- AUTOSTART ----
-------------------

hl.on("hyprland.start", function()
  hl.exec_cmd("waybar")
  hl.exec_cmd("hyprpaper")
  hl.exec_cmd("sleep 2 && ~/.config/hypr/custom_modules/set_random_wallpaper.sh")
  hl.exec_cmd('xfconf-query -c xsettings -p /Net/ThemeName -s "Nordic"')
  hl.exec_cmd('xfconf-query -c xfwm4 -p /general/theme -s "Nordic"')

  hl.exec_cmd("dbus-update-activation-environment --systemd --all")

  hl.exec_cmd("kitty fish -c 'htop; exec fish'")
  hl.exec_cmd("kitty fish -c 'btop; exec fish'")
  hl.exec_cmd("kitty fish -c 'ncdu; exec fish'")
end)

-----------------------
---- LOOK AND FEEL ----
-----------------------

-- transparency
-- hl.window_rule({ match = { class = "^(Code)$" }, opacity = { 0.97, 0.85, 1 } })
-- hl.window_rule({ match = { class = "^(firefox)$" }, opacity = { 0.95, 0.85, 1 } })
-- hl.window_rule({ match = { class = "^(Spotify)$" }, opacity = { 0.95, 0.85, 1 } })

hl.config({
  general = {
    gaps_in = 4,
    gaps_out = 0,

    border_size = 3,

    col = {
      active_border = border1,
      inactive_border = inactiveBorder,
    },

    resize_on_border = false,

    allow_tearing = false,

    layout = "dwindle",
  },

  decoration = {
    rounding = 10,
    rounding_power = 2,

    active_opacity = 1.0,
    inactive_opacity = 1.0,

    shadow = {
      enabled = true,
      range = 4,
      render_power = 3,
      color = shadow,
    },

    blur = {
      enabled = true,
      size = 3,
      passes = 1,

      vibrancy = 0.1696,
    },
  },

  animations = {
    enabled = true,
  },
})

hl.curve("easeOutQuint", { type = "bezier", points = { { 0.23, 1 }, { 0.32, 1 } } })
hl.curve("easeInOutCubic", { type = "bezier", points = { { 0.65, 0.05 }, { 0.36, 1 } } })
hl.curve("linear", { type = "bezier", points = { { 0, 0 }, { 1, 1 } } })
hl.curve("almostLinear", { type = "bezier", points = { { 0.5, 0.5 }, { 0.75, 1.0 } } })
hl.curve("quick", { type = "bezier", points = { { 0.15, 0 }, { 0.1, 1 } } })

hl.animation({ leaf = "global", enabled = true, speed = 10, bezier = "default" })
hl.animation({ leaf = "border", enabled = true, speed = 5.39, bezier = "easeOutQuint" })
hl.animation({ leaf = "windows", enabled = true, speed = 4.79, bezier = "easeOutQuint" })
hl.animation({ leaf = "windowsIn", enabled = true, speed = 4.1, bezier = "easeOutQuint", style = "popin 87%" })
hl.animation({ leaf = "windowsOut", enabled = true, speed = 1.49, bezier = "linear", style = "popin 87%" })
hl.animation({ leaf = "fadeIn", enabled = true, speed = 1.73, bezier = "almostLinear" })
hl.animation({ leaf = "fadeOut", enabled = true, speed = 1.46, bezier = "almostLinear" })
hl.animation({ leaf = "fade", enabled = true, speed = 3.03, bezier = "quick" })
hl.animation({ leaf = "layers", enabled = true, speed = 3.81, bezier = "easeOutQuint" })
hl.animation({ leaf = "layersIn", enabled = true, speed = 4, bezier = "easeOutQuint", style = "fade" })
hl.animation({ leaf = "layersOut", enabled = true, speed = 1.5, bezier = "linear", style = "fade" })
hl.animation({ leaf = "fadeLayersIn", enabled = true, speed = 1.79, bezier = "almostLinear" })
hl.animation({ leaf = "fadeLayersOut", enabled = true, speed = 1.39, bezier = "almostLinear" })
hl.animation({ leaf = "workspaces", enabled = true, speed = 1.94, bezier = "almostLinear", style = "fade" })
hl.animation({ leaf = "workspacesIn", enabled = true, speed = 1.21, bezier = "almostLinear", style = "fade" })
hl.animation({ leaf = "workspacesOut", enabled = true, speed = 1.94, bezier = "almostLinear", style = "fade" })

hl.config({
  dwindle = {
    preserve_split = true,
  },

  master = {
    new_status = "master",
  },

  misc = {
    disable_hyprland_logo = true,
  },
})

---------------
---- INPUT ----
---------------

hl.config({
  input = {
    kb_layout = "us, de",
    kb_variant = "",
    kb_model = "",
    kb_options = "grp:alt_shift_toggle",
    kb_rules = "",

    follow_mouse = 1,

    sensitivity = 0,

    touchpad = {
      natural_scroll = false,
    },
  },
})

hl.device({
  name = "epic-mouse-v1",
  sensitivity = -0.5,
})

---------------------
---- KEYBINDINGS ----
---------------------

local mainMod = "SUPER"

hl.bind(mainMod .. " + Return", hl.dsp.exec_cmd(terminal))
hl.bind(mainMod .. " + Q", hl.dsp.window.close())
hl.bind(mainMod .. " + C", hl.dsp.exec_cmd(code))
hl.bind(mainMod .. " + SHIFT + M", hl.dsp.exit())
hl.bind(mainMod .. " + B", hl.dsp.exec_cmd(browser))
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd(fileManager))
hl.bind(mainMod .. " + V", hl.dsp.window.float({ action = "toggle" }))
hl.bind(mainMod .. " + L", hl.dsp.exec_cmd("hyprlock"))
hl.bind(mainMod .. " + W", hl.dsp.exec_cmd("~/.config/hypr/custom_modules/set_random_wallpaper.sh"))
hl.bind(mainMod .. " + F", hl.dsp.window.fullscreen({ mode = 0 }))
hl.bind(mainMod .. " + R", hl.dsp.exec_cmd(menu))
hl.bind(mainMod .. " + P", hl.dsp.window.pseudo())
hl.bind(mainMod .. " + Y", hl.dsp.layout("togglesplit"))

-- screenshot
hl.bind(mainMod .. " + SPACE", hl.dsp.exec_cmd(
  'grim -g "$(slurp)" - | wl-copy && wl-paste > ~/Pictures/Screenshots/Screenshot-$(date +%F_%T).png | dunstify "Screenshot of the region taken" -t 1000'
))
hl.bind(mainMod .. " + SHIFT + SPACE", hl.dsp.exec_cmd(
  'grim - | wl-copy && wl-paste > ~/Pictures/Screenshots/Screenshot-$(date +%F_%T).png | dunstify "Screenshot of whole screen taken" -t 1000'
))

-- Move focus with mainMod + arrow keys
hl.bind(mainMod .. " + left", hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + right", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + up", hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + down", hl.dsp.focus({ direction = "down" }))

-- Switch workspaces with mainMod + [0-9]
-- Move active window to a workspace with mainMod + SHIFT + [0-9]
for i = 1, 10 do
  local key = i % 10 -- 10 maps to key 0
  hl.bind(mainMod .. " + " .. key, hl.dsp.focus({ workspace = i }))
  hl.bind(mainMod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = i }))
end

-- special workspace (scratchpad)
hl.bind(mainMod .. " + S", hl.dsp.workspace.toggle_special("magic"))
hl.bind(mainMod .. " + SHIFT + S", hl.dsp.window.move({ workspace = "special:magic" }))

-- Scroll through existing workspaces with mainMod + scroll
hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + mouse_up", hl.dsp.focus({ workspace = "e-1" }))

-- Move/resize windows with mainMod + LMB/RMB and dragging
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })
hl.bind(mainMod .. " + SHIFT + right", hl.dsp.window.move({ direction = "right" }))
hl.bind(mainMod .. " + SHIFT + left", hl.dsp.window.move({ direction = "left" }))
hl.bind(mainMod .. " + SHIFT + up", hl.dsp.window.move({ direction = "up" }))
hl.bind(mainMod .. " + SHIFT + down", hl.dsp.window.move({ direction = "down" }))

-- Enter resize mode with mainMod+SHIFT+R
hl.bind(mainMod .. " + SHIFT + R", hl.dsp.submap("resize"))

hl.define_submap("resize", function()
  hl.bind("right", hl.dsp.window.resize({ x = 10, y = 0, relative = true }), { repeating = true })
  hl.bind("left", hl.dsp.window.resize({ x = -10, y = 0, relative = true }), { repeating = true })
  hl.bind("up", hl.dsp.window.resize({ x = 0, y = -10, relative = true }), { repeating = true })
  hl.bind("down", hl.dsp.window.resize({ x = 0, y = 10, relative = true }), { repeating = true })

  hl.bind("escape", hl.dsp.submap("reset"))
end)

-- Laptop multimedia keys for volume and LCD brightness
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"), { locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"), { locked = true, repeating = true })
hl.bind("XF86AudioMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"), { locked = true, repeating = true })
hl.bind("XF86AudioMicMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"), { locked = true, repeating = true })
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl s 10%+"), { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl s 10%-"), { locked = true, repeating = true })

-- Requires playerctl
hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"), { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"), { locked = true })

--------------------------------
---- WINDOWS AND WORKSPACES ----
--------------------------------

-- Ignore maximize requests from apps. You'll probably like this. (disabled)
-- hl.window_rule({ name = "suppress-maximize-events", match = { class = ".*" }, suppress_event = "maximize" })

-- Fix some dragging issues with XWayland (disabled)
-- hl.window_rule({
--   name = "fix-xwayland-drags",
--   match = { class = "^$", title = "^$", xwayland = true, floating = true, fullscreen = false, pin = false },
--   no_focus = true,
-- })
