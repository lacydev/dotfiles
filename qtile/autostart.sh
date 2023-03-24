#!/usr/bin/env sh

polybar &

~/.fehbg &

# start polkit agent from GNOME
/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 & disown
