#!/usr/bin/env sh

# polybar &
for mon in $(polybar --list-monitors | cut -d":" -f1); do
	MONITOR=$mon polybar --reload bar1 &
done

~/.fehbg &

# start polkit agent from GNOME
/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 & disown
