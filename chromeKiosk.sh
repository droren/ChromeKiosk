#!/bin/bash

# Workaround for bug locking screen even if disabled. 
gsettings set org.gnome.desktop.lockdown disable-lock-screen 'true'
xset s noblank
xset s off
xset -dpms
gnome-screensaver-command --quit

# execute zonebrowser
zonebrowser &

# Setting default screen mode, and shutting down laptopdisplay. 
xrandr --output VGA1 --mode 1280x1024 --primary
xrandr --output LVDS1 --off

# Debug terminal if needed. 
xterm

# Main browser loop.
while true; do chromium-browser %u --proxy-pac-url="<insert proxy here>" --kiosk --start-maximized; sleep 5s; done
