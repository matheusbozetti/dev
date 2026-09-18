#!/bin/sh

source "$CONFIG_DIR/colors.sh"

LOC_CACHE="/tmp/sketchybar_location.json"

# Atualiza localização no máximo a cada 1h
if [ ! -f "$LOC_CACHE" ] || [ $(($(date +%s) - $(stat -f %m "$LOC_CACHE"))) -gt 3600 ]; then
  TMP_LOC=$(mktemp)
  if curl -fs --connect-timeout 5 --max-time 10 "https://ipapi.co/json" -o "$TMP_LOC" &&
     jq -e '.latitude and .longitude' "$TMP_LOC" > /dev/null 2>&1; then
    mv "$TMP_LOC" "$LOC_CACHE"
  else
    rm -f "$TMP_LOC"
  fi
fi

LAT=$(jq -r '.latitude // empty' "$LOC_CACHE" 2>/dev/null)
LON=$(jq -r '.longitude // empty' "$LOC_CACHE" 2>/dev/null)

# fallback caso falhe
if [ "$LAT" = "null" ] || [ "$LON" = "null" ] || [ -z "$LAT" ] || [ -z "$LON" ]; then
  LAT="-15.4644"
  LON="-56.4777"
fi

URL="https://api.open-meteo.com/v1/forecast?latitude=$LAT&longitude=$LON&current=temperature_2m,weather_code,precipitation&timezone=auto&temperature_unit=celsius"

DATA=$(curl -fs --connect-timeout 5 --max-time 10 "$URL")

FORECAST=$(curl -fs --connect-timeout 5 --max-time 10 "https://api.open-meteo.com/v1/forecast?latitude=$LAT&longitude=$LON&hourly=precipitation&forecast_hours=2&timezone=auto&precipitation_unit=mm")

RAIN_NEXT_2HRS=$(echo "$FORECAST" | jq -r '
  [.hourly.precipitation[0:2][]] | add // 0 | (. * 10 | round) / 10
' 2>/dev/null)

TEMP=$(echo "$DATA" | jq -r '.current.temperature_2m // empty' 2>/dev/null) # e.g. 23.4
CODE=$(echo "$DATA" | jq -r '.current.weather_code // empty' 2>/dev/null) # e.g. 2

# Sem resposta da API, sai sem alterar o item.
if [ -z "$TEMP" ]; then
  exit 0
fi

# Map WMO code to icon 
case $CODE in
  0) ICON="" ;;      # Clear sky
  1) ICON="" ;;      # Mainly clear
  2) ICON="" ;;      # Partly cloudy
  3) ICON="" ;;      # Overcast
  45|48) ICON="" ;;  # Fog or depositing rime fog
  51|53|55) ICON="" ;;  # Drizzle: Light, moderate, dense
  56|57) ICON="?" ;;      # Freezing drizzle
  61|63|65) ICON="" ;;  # Rain: slight, moderate, heavy
  66|67) ICON="?" ;;      # Freezing rain
  71|73|75) ICON="󰖘" ;;  # Snowfall
  77) ICON="?" ;;         # Snow grains
  80|81|82) ICON="" ;;  # Rain showers
  85|86) ICON="?" ;;      # Snow showers
  95) ICON="󰖓" ;;        # Thunderstorm
  96|99) ICON="?" ;;      # Thunderstorm with hail
  *) ICON="" ;;         # Unknown
esac

# Format temp: round to nearest integer, add degree symbol
TEMP_LABEL="$(printf "%.0f°C" "$TEMP")"

# Only show rain label/color if rain is expected soon
if awk -v r="${RAIN_NEXT_2HRS:-0}" 'BEGIN { exit !(r > 0) }'; then
  LABEL="$TEMP_LABEL, ${RAIN_NEXT_2HRS} mm"
  COLOR="$BLUE"
  sketchybar --set "$NAME" icon="$ICON" label="$LABEL" icon.color=$COLOR label.color=$COLOR
else
  LABEL="$TEMP_LABEL"
  sketchybar --set "$NAME" icon="$ICON" label="$LABEL"
fi
