#!/bin/bash

# Shows the service-mode badge only while AeroSpace is in 'service' mode.
# $MODE is provided by the aerospace_mode_change event trigger (main|service).

if [ "$MODE" = "service" ]; then
  sketchybar --set "$NAME" drawing=on
else
  sketchybar --set "$NAME" drawing=off
fi
