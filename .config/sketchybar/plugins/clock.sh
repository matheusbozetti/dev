#!/bin/sh

# The $NAME variable is passed from sketchybar and holds the name of
# the item invoking this script:

DATE_PART=$(LC_TIME=pt_BR.UTF-8 date +'%a, %d %b')
TIME_PART=$(date +'%-I:%M %p')

sketchybar --set "$NAME" \
  label="$DATE_PART • $TIME_PART" \
  padding_left=0
