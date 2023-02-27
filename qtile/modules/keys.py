from libqtile.lazy import lazy
from libqtile.config import Key
from datetime import datetime
import os

mod = 'mod4'
launcher = 'rofi -show combi'
terminal = 'alacritty'
internet = 'firefox'
internet2 = 'chromium'
fileman = 'alacritty -e ranger'
screenlock = 'sxlock -p "."'
music = 'spotify'
password = 'keepassxc'
printscreen = {}
printscreen["region"] = 'flameshot gui'
printscreen["screen"] = 'flameshot screen'
printscreen["desktop"] = 'flameshot full'

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
	Key([mod], "r", lazy.spawn(launcher), desc="spawn rofi"),

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

	# Toggle between different layouts as defined below
	Key([mod], "F9", lazy.prev_layout(), desc="Toggle between layouts"),
	Key([mod], "F10", lazy.next_layout(), desc="Toggle between layouts"),

	# System shortcuts
	Key([mod], "Backspace", lazy.window.kill(), desc="Kill focused window"),
	Key([mod, "control"], "r", lazy.restart(), desc="Restart Qtile"),
	Key([mod, "control"], "q", lazy.shutdown(), desc="Shutdown Qtile"),
	Key([mod, "shift"], "r", lazy.spawncmd(), desc="Spawn a command using a prompt widget"),
	Key([mod], "Escape", lazy.spawn(os.path.expanduser('~/.config/rofi/powermenu.sh')), desc="Open Power Menu"),
	Key([mod, "shift"], "Escape", lazy.spawn(screenlock), desc="Lock screen"),
	Key([mod], "Space", lazy.window.toggle_floating(), desc="Toggle floating window"),

	# Media Controls
	Key([], "XF86AudioRaiseVolume",lazy.spawn("amixer set Master 3%+")),
	Key([], "XF86AudioLowerVolume",lazy.spawn("amixer set Master 3%-")),
	Key([], "XF86AudioMute",lazy.spawn("amixer set Master toggle")),

	Key([], "XF86AudioNext", lazy.spawn("playerctl next")),
	# Key([], "XF86AudioPrevious", lazy.spawn("playerctl previous")),
	Key([], "XF86AudioPlay", lazy.spawn("playerctl play-pause")),

	# App Launchers
	Key([mod], "Return", lazy.spawn(terminal), desc="Launch terminal"),
	Key([mod], "f", lazy.spawn(internet), desc="Launch web browser"),
	Key([mod], "m", lazy.spawn(music), desc="Launch music player"),

	# Screenshots
	Key([mod], "Print", lazy.spawn(printscreen["region"]), desc="Do a flip...er, a screenshot"),
	Key([mod, "control"], "Print", lazy.spawn(printscreen["screen"]), desc="Window Screenshot"),
	Key([mod, "shift"], "Print", lazy.spawn(printscreen["desktop"]), desc="Full Desktop Screenshot"),
]
