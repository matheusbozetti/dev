#!/bin/bash

# Shows the fullscreen badge only when the focused AeroSpace window is fullscreen.

fullscreen=$(aerospace list-windows --focused --format "%{window-is-fullscreen}" 2>/dev/null)

if [ "$fullscreen" = "true" ]; then
  sketchybar --set "$NAME" drawing=on
else
  sketchybar --set "$NAME" drawing=off
fi
