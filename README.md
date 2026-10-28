# Dotfiles

Personal configuration files managed with [GNU Stow](https://www.gnu.org/software/stow/).

## Setup

Clone the repository:
```bash
git clone <repo-url> ~/dotfiles
cd ~/dotfiles
```

Stow the packages you want:
```bash
stow fish hypr kitty waybar rofi wofi aerospace starship spicetify
```

## Notes

- **Hyprland**: Uses `hyprland.lua`. Place your wallpaper in `hypr/.config/hypr/wallpapers/` and update `hyprpaper.conf` accordingly.
- **Fish**: `fish_variables` is not tracked as it's machine-specific.
- **Aerospace**: Included for both Linux and macOS setups.
