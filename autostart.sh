#!/usr/bin/env sh

# picom for fancy graphics
picom &

# start polkit agent from GNOME
/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 & disown

# automounting manager
pgrep udiskie || udiskie &
