-- ~/.config/hypr/mocha.lua
-- Converted from mocha.conf. Place this file in the SAME directory as
-- hyprland.lua (~/.config/hypr/) so that require("mocha") resolves it.
--
-- Note: hyprlang's "Alpha" variables (e.g. $backgroundAlpha) held bare hex
-- strings meant to be composed into other rgba()/0x... values elsewhere in
-- the old config. They're kept here as plain strings for the same purpose,
-- in case any other part of your setup still references them.

return {
  background = "rgba(101628)",
  backgroundAlpha = "101628",

  foreground = "rgba(cbdaf3)",
  foregroundAlpha = "cbdaf3",

  shadow = "rgba(0c1220cc)",
  shadowAlpha = "0c1220cc",

  border1 = "rgba(3b9effff)",
  borderAlpha1 = "3b9effff",

  border2 = "rgba(86bef7ff)",
  borderAlpha2 = "86bef7ff",

  inactiveBorder = "rgba(3b4261ff)",
  inactiveBorderAlpha = "3b4261ff",

  backgroundLock = "rgba(16, 22, 40, 1.0)",
  backgroundLockAlpha = "16, 22, 40, 1.0",

  foregroundLock = "rgba(203, 218, 243, 1.0)",
  foregroundLockAlpha = "203, 218, 243, 1.0",

  borderLock = "rgba(59, 158, 255, 1.0)",
  borderLockAlpha = "59, 158, 255, 1.0",

  font = "Hack Nerd Font",
}