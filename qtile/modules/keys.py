from libqtile.lazy import lazy
from libqtile.config import Key
from datetime import datetime
import os

mod = 'mod4'
terminal = 'alacritty'
internet = 'firefox'
internet2 = 'chromium'
fileman = 'thunar'
lock = 'sxlock -p "."'
music = 'spotify'
password = 'keepassxc'
printscreen = {}
printscreen[1] = 'flameshot gui'
printscreen[2] = 'flameshot screen'
printscreen[3] = 'flameshot full'

keys = [
	# Switch between windows
	Key([mod], "h", lazy.layout.left(), desc="Move focus to left"),
	Key([mod], "l", lazy.layout.right(), desc="Move focus to right"),
	Key([mod], "j", lazy.layout.down(), desc="Move focus down"),
	Key([mod], "k", lazy.layout.up(), desc="Move focus up"),
	Key([mod, "shift"],
		"Tab",
		lazy.layout.up(),
		desc="Move focus up (alternative)"),
	Key([mod],
		"Tab",
		lazy.layout.down(),
		desc="Move focus down (alternative)"),

	# rofi setups
	Key([mod], "r", lazy.spawn("rofi -show combi"), desc="spawn rofi"),

	# Move windows between left/right columns or move up/down in current stack.
	# Moving out of range in Columns layout will create new column.
	Key([mod, "shift"],
		"h",
		lazy.layout.shuffle_left(),
		desc="Move window to the left"),
	Key([mod, "shift"],
		"l",
		lazy.layout.shuffle_right(),
		desc="Move window to the right"),
	Key([mod, "shift"],
		"j",
		lazy.layout.shuffle_down(),
		desc="Move window down"),
	Key([mod, "shift"], "k", lazy.layout.shuffle_up(), desc="Move window up"),

	# Grow windows. If current window is on the edge of screen and direction
	# will be to screen edge - window would shrink.
	Key([mod, "control"],
		"h",
		lazy.layout.grow_left(),
		desc="Grow window to the left"),
	Key([mod, "control"],
		"l",
		lazy.layout.grow_right(),
		desc="Grow window to the right"),
	Key([mod, "control"],
		"j",
		lazy.layout.grow_down(),
		desc="Grow window down"),
	Key([mod, "control"], "k", lazy.layout.grow_up(), desc="Grow window up"),
	Key([mod], "n", lazy.layout.normalize(), desc="Reset all window sizes"),

	# Toggle between split and unsplit sides of stack.
	# Split = all windows displayed
	# Unsplit = 1 window displayed, like Max layout, but still with
	# multiple stack panes
	Key([mod, "shift"],
		"Return",
		lazy.layout.toggle_split(),
		desc="Toggle between split and unsplit sides of stack"),

	# Toggle between different layouts as defined below
	Key([mod], "Space", lazy.next_layout(), desc="Toggle between layouts"),
	Key([mod, "shift"], "Space", lazy.prev_layout(), desc="Toggle between layouts"),
	Key([mod, "shift", "control"], "h", lazy.layout.swap_column_left()),
	Key([mod, "shift", "control"], "l", lazy.layout.swap_column_right()),
	# Key([mod, "shift"], "space", lazy.layout.flip()),

	# System shortcuts
	Key([mod], "Backspace", lazy.window.kill(), desc="Kill focused window"),
	Key([mod, "control"], "r", lazy.restart(), desc="Restart Qtile"),
	Key([mod, "control"], "q", lazy.shutdown(), desc="Shutdown Qtile"),
	Key([mod, "shift"], "r", lazy.spawncmd(), desc="Spawn a command using a prompt widget"),
	Key([mod], "Escape", lazy.spawn(os.path.expanduser('~/.config/rofi/powermenu.sh')), desc="Open Power Menu"),
	Key([mod, "shift"], "Escape", lazy.spawn(lock), desc="Open Power Menu"),

	# Media Controls
	Key([], "XF86AudioRaiseVolume",lazy.spawn("amixer set Master 3%+")),
	Key([], "XF86AudioLowerVolume",lazy.spawn("amixer set Master 3%-")),
	Key([], "XF86AudioMute",lazy.spawn("amixer set Master toggle")),

	# App Launchers
	Key([mod], "Return", lazy.spawn(terminal), desc="Launch terminal"),
	Key([mod], "F1", lazy.spawn(internet), desc="Launch web browser"),
	Key([mod], "F2", lazy.spawn(internet2), desc="Launch secondary web browser"),
	Key([mod], "m", lazy.spawn(music), desc="Launch music player"),
	# Key([mod], "p", lazy.spawn(password), desc="Launch password manager"),
	Key([mod], "n", lazy.spawn(fileman), desc="Launch file explorer"),

	# Screenshots
	Key([mod], "Print", lazy.spawn(printscreen[1]), desc="Do a flip...er, a screenshot"),
	Key([mod, "control"], "Print", lazy.spawn(printscreen[2]), desc="Window Screenshot"),
	Key([mod, "shift"], "Print", lazy.spawn(printscreen[3]), desc="Full Desktop Screenshot"),
]
