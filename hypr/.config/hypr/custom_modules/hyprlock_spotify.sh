#!/bin/bash

if command -v playerctl > /dev/null 2>&1; then
  status=$(playerctl status 2> /dev/null)

  if [[ "$status" == "Paused" ]]; then
    echo "♫ -"
    exit 0
  fi

  artist=$(playerctl metadata -f '{{ artist }}' 2> /dev/null)
  title=$(playerctl metadata -f '{{ title }}' 2> /dev/null)

  if [ $? -eq 0 ] && [ -n "$title" ]; then
    echo "♫ $artist - $title"
    exit 0
  elif [ $? -eq 0 ] && [ -z "$title" ] && [ -n "$artist" ]; then
    echo "♫ $artist"
    exit 0
  fi
else
  echo "playerctl not found. Please install it to use this script."
  exit 1
fi

echo "♫ -"
exit 1
