from libqtile import bar, layout, widget, hook
from libqtile.config import Click, Drag, Group, Key, Match, Screen
from libqtile.lazy import lazy
from libqtile.utils import guess_terminal
import os 
import subprocess

@hook.subscribe.startup
def autostart():
	home = os.path.expanduser('~/.config/qtile/autostart.sh')
	subprocess.Popen([home])

mod = "mod4"
jump = "jumpapp -C"
# system apps
term = "alacritty -e byobu"
sysmon="gnome-system-monitor"
launch = "rofi -show combi"
file="nemo"
locks="cinnamon-screensaver-command -l -m 'You are dead'"
power="rofi -show power-menu -modi power-menu:rofi-power-menu"
# default apps
web="firefox"
web2="chromium"
music="spotify"
passwd="keepassxc"
# screen apps
grab="flameshot gui"
#rec="kazam"

color_background = "#2e2e2e"
color_comments = "#797979"
color_white = "#d6d6d6"
color_yellow = "#e5b567"
color_green = "#b4d273"
color_orange = "#e87d3e"
color_purple = "#9e86c8"
color_pink = "#b05279"
color_blue = "#6c99bb"

pctlignore="firefox"

keys = [
	# A list of available commands that can be bound to keys can be found
	# at https://docs.qtile.org/en/latest/manual/config/lazy.html
	# Switch between windows

	# window move.
	# Key([mod], "space", lazy.layout.next(), desc="Move window focus to other window"),
	# Move windows between left/right columns or move up/down in current stack.
	# Moving out of range in Columns layout will create new column.
	Key([mod, "shift"], "h", lazy.layout.shuffle_left(), desc="Move window to the left"),
	Key([mod, "shift"], "l", lazy.layout.shuffle_right(), desc="Move window to the right"),
	Key([mod, "shift"], "j", lazy.layout.shuffle_down(), desc="Move window down"),
	Key([mod, "shift"], "k", lazy.layout.shuffle_up(), desc="Move window up"),

	Key([mod, "control"], "h", lazy.layout.grow_left(), desc="Grow window to the left"),
	Key([mod, "control"], "l", lazy.layout.grow_right(), desc="Grow window to the right"),
	Key([mod, "control"], "j", lazy.layout.grow_down(), desc="Grow window down"),
	Key([mod, "control"], "k", lazy.layout.grow_up(), desc="Grow window up"),
	Key([mod], "n", lazy.layout.normalize(), desc="Reset all window sizes"),
	
	# focus.
	Key([mod], "h", lazy.layout.left(), desc="Move focus to left"),
	Key([mod], "l", lazy.layout.right(), desc="Move focus to right"),
	Key([mod], "j", lazy.layout.down(), desc="Move focus down"),
	Key([mod], "k", lazy.layout.up(), desc="Move focus up"),
	Key([mod], "Tab", lazy.layout.next(), desc="Move window focus to next window"),
	Key([mod, "shift"], "Tab", lazy.layout.previous(), desc="Move window focus to previous window"),

	Key([mod], "z", lazy.next_layout(), desc="Toggle between layouts"),
	Key([mod], "Space", lazy.window.toggle_floating(), desc="Toggle between layouts"),

	Key(
		[mod, "shift"],
		"Return",
		lazy.layout.toggle_split(),
		desc="Toggle between split and unsplit sides of stack",
	),

	# session.
	Key([mod], "Backspace", lazy.window.kill(), desc="Kill focused window"),
	Key([mod, "control"], "r", lazy.reload_config(), desc="Reload the config"),
	# Key([mod, "control"], "q", lazy.shutdown(), desc="Shutdown Qtile"),
	Key([mod, "control"], "l", lazy.spawn(locks), "Don\'t forget to lock up when you\'re done."),
	Key([mod, "control"], "q", lazy.spawn(power), "Power menu"),

	# apps.
	Key([mod], "Return", lazy.spawn(jump + " " + term), desc="Launch terminal"),
	Key([mod], "r", lazy.spawn(launch), desc="Spawn the launcher"),
	Key([mod], "f", lazy.spawn(jump + " " + web), desc="Open web browser"),
	Key([mod], "n", lazy.spawn(jump + " " + file), desc="Open file manager"),
	Key([mod], "m", lazy.spawn(jump + " " + music), desc="Open music player"),
	Key([mod], "p", lazy.spawn(passwd), desc="Open password manager"),

	# media controls.
	Key([], "XF86AudioLowerVolume", lazy.spawn("amixer -D pulse sset Master 5%-"), desc="Lower volume"),
	Key([], "XF86AudioRaiseVolume", lazy.spawn("amixer -D pulse sset Master 5%+"), desc="Raise volume"),
	Key([], "XF86AudioMute", lazy.spawn("amixer -D pulse set Master 1+ toggle"), desc="Mute sound"),

	Key([], "XF86AudioPlay", lazy.spawn("playerctl -i " + pctlignore + " play-pause"), desc="Toggle play/pause"),
	Key([], "XF86AudioPrev", lazy.spawn("playerctl -i " + pctlignore + " previous"), desc="Play previous song in playlist"),
	Key([], "XF86AudioNext", lazy.spawn("playerctl -i " + pctlignore + " next"), desc="Play next song in playlist"),

	# screengrab.
	Key([], "Print", lazy.spawn(grab), desc="Screenshot dialog"),
	# Key(["shift"], "Print", lazy.spawn(rec), desc="Screen Record dialog"),

	# system.
	Key(["shift", "control"], "Escape", lazy.spawn(jump + " " + sysmon), desc="Launch system monitor"),
]

groups = [Group(i) for i in "1234567890"]

for i in groups:
	keys.extend(
		[
			# mod1 + letter of group = switch to group
			Key(
				[mod],
				i.name,
				lazy.group[i.name].toscreen(),
				desc="Switch to group {}".format(i.name),
			),

			# mod1 + shift + letter of group = move focused window to group
			Key(
				[mod, "shift"],
				i.name,
				lazy.window.togroup(i.name),
				desc="move focused window to group {}".format(i.name),
			# Or, use below if you prefer to switch to that group.
			# mod1 + shift + letter of group = switch to & move focused window to group
			# 	lazy.window.togroup(i.name, switch_group=True),
			# 	desc="Switch to & move focused window to group {}".format(i.name),
				),
		]
	)

layouts = [
	layout.Columns(
		border_focus=color_pink,
		border_normal=color_background,
		border_on_single=True,
		border_width=2,
		margin=8,
		),
	layout.Max(
		border_focus=color_pink,
		border_normal=color_background,
		border_width=2,
		margin=8,
		),
]

widget_defaults = dict(
	font="Mononoki Nerd Font Mono",
	fontsize=16,
	padding=2,
)
extension_defaults = widget_defaults.copy()

screens = [
	Screen(
	),
]

# floating layouts.

mouse = [
	Drag([mod], "Button1", lazy.window.set_position_floating(), start=lazy.window.get_position()),
	Drag([mod], "Button3", lazy.window.set_size_floating(), start=lazy.window.get_size()),
	Click([mod], "Button2", lazy.window.bring_to_front()),
]

dgroups_key_binder = None
dgroups_app_rules = []	# type: list
follow_mouse_focus = True
bring_front_click = False
cursor_warp = False
floating_layout = layout.Floating(
	float_rules=[
		# Run the utility of `xprop` to see the wm class and name of an X client.
		*layout.Floating.default_float_rules,
		Match(wm_class="confirmreset"),  # gitk
		Match(wm_class="makebranch"),  # gitk
		Match(wm_class="maketag"),	# gitk
		Match(wm_class="ssh-askpass"),	# ssh-askpass
		Match(title="branchdialog"),  # gitk
		Match(title="pinentry"),  # GPG key password entry
		Match(wm_class=["nemo-preview-start"]),
		Match(wm_class=["Godot_ProjectList"]),
	]
)
auto_fullscreen = True
focus_on_window_activation = "smart"
reconfigure_screens = True

# If things like steam games want to auto-minimize themselves when losing
# focus, should we respect this or not?
auto_minimize = True

# When using the Wayland backend, this can be used to configure input devices.
wl_input_rules = None

# XXX: Gasp! We're lying here. In fact, nobody really uses or cares about this
# string besides java UI toolkits; you can see several discussions on the
# mailing lists, GitHub issues, and other WM documentation that suggest setting
# this string if your java app doesn't work correctly. We may as well just lie
# and say that we're a working one by default.
#
# We choose LG3D to maximize irony: it is a 3D non-reparenting WM written in
# java that happens to be on java's whitelist.
wmname = "LG3D"
