#!/bin/bash
## Author: Shaun Reed | Contact: shaunrd0@gmail.com | URL: www.shaunreed.com ##
##  A script placed in ~/.config/polybar/ - Uses ${env:MONITOR}              ##
##  Starts polybars top and bottom on multiple displays                      ##
###############################################################################
# start-polybar.sh

# Kill any previous polybars
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done


# For each monitor in list up to ':'
for m in $(polybar --list-monitors | cut -d":" -f1); do
  # Reload polybars with monitor device name
  MONITOR=$m polybar --reload top &
  MONITOR=$m polybar --reload bottom &
done

