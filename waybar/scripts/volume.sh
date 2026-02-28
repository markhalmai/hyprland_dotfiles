#!/usr/bin/env bash
# Prints: " 37%" or " 0%" when muted

status=$(wpctl get-volume @DEFAULT_AUDIO_SINK@ 2>/dev/null)
# status looks like: "Volume: 0.47" or "Volume: 0.47 [MUTED]"
vol=$(printf '%s' "$status" | awk '{print $2}')
muted=0
printf '%s' "$status" | grep -qi 'MUTED' && muted=1

# to percent (rounded)
percent=$(awk -v v="$vol" 'BEGIN{printf("%d", v*100 + 0.5)}')

if [ "$muted" -eq 1 ]; then
  icon=""   # Nerd Font muted icon
else
  icon=""   # Nerd Font speaker icon
fi

echo "$icon $percent%"

