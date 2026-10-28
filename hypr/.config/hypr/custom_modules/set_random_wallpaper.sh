#!/bin/bash

WALLPAPER_DIR="$HOME/.config/hypr/images"
CONFIG_FILE="$HOME/.config/hypr/hyprpaper.conf"

EXTENSIONS="jpg jpeg png webp bmp tiff"

IMAGES=()
for ext in $EXTENSIONS; do
    while IFS= read -r -d '' file; do
        IMAGES+=("$file")
    done < <(find "$WALLPAPER_DIR" -type f -iname "*.$ext" -print0 2>/dev/null)
done

if [ ${#IMAGES[@]} -eq 0 ]; then
    echo "Keine Bilder im Ordner $WALLPAPER_DIR gefunden!"
    exit 1
fi

RANDOM_IMAGE="${IMAGES[$RANDOM % ${#IMAGES[@]}]}"

echo "Ausgewähltes Hintergrundbild: $RANDOM_IMAGE"

cat > "$CONFIG_FILE" << EOF
# Generated: $(date)

preload = $RANDOM_IMAGE
wallpaper = ,$RANDOM_IMAGE

# Enable IPC for runtime wallpaper changes
ipc = on

# Enable splash screen
splash = false
EOF

if pgrep -x "hyprpaper" > /dev/null; then
    echo "Lade neues Hintergrundbild..."
    hyprctl hyprpaper preload "$RANDOM_IMAGE" 2>/dev/null
    hyprctl hyprpaper wallpaper ",$RANDOM_IMAGE" 2>/dev/null
fi
