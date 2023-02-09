from libqtile.config import Key, Group, ScratchPad, DropDown
from libqtile.command import lazy
from libqtile import hook
from .keys import keys, mod, terminal, fileman, music, password, internet, internet2


groups = [Group(i) for i in "123456789"]

for i in groups:
	keys.extend([
		# mod1 + letter of group = switch to group
		Key([mod],
			i.name,
			lazy.group[i.name].toscreen(),
			desc="Switch to group {}".format(i.name)),

		Key([mod], "Right", lazy.screen.next_group(),
			desc="Switch to next group"),

		Key([mod], "Left", lazy.screen.prev_group(),
			desc="Switch to previous group"),

		# mod1 + shift + letter of group = switch to & move focused window to group
		Key([mod, "shift"],
			i.name,
			lazy.window.togroup(i.name, switch_group=True),
			desc="Switch to & move focused window to group {}".format(i.name)),
		# Or, use below if you prefer not to switch to that group.
		# # mod1 + shift + letter of group = move focused window to group
		# Key([mod, "shift"], i.name, lazy.window.togroup(i.name),
		#	  desc="move focused window to group {}".format(i.name)),
	])

groups.append( ScratchPad('scratch', [
	DropDown("term", terminal, width=0.7, height=0.5, x=0.15, y=0.1, on_focus_lost_hide = False, opacity=1),
	DropDown("file", fileman, width=0.4, height=0.5, x=0.3, y=0.2, on_focus_lost_hide = False, opacity=1),
	DropDown("pass", password, width=0.4, height=0.5, x=0.3, y=0.2, on_focus_lost_hide = False, opacity=1),
	DropDown("net1", internet,  width=0.8, height=0.9, x=0.1, y=0.05, on_focus_lost_hide = False, opacity=1),
	DropDown("net2", internet2, width=0.8, height=0.9, x=0.1, y=0.05, on_focus_lost_hide = False, opacity=1),
]))

keys.extend([
	Key([mod, "shift"], "Return", lazy.group['scratch'].dropdown_toggle('term')),
	Key([mod, "shift"], "n", lazy.group['scratch'].dropdown_toggle('file')),
	Key([mod, "shift"], "p", lazy.group['scratch'].dropdown_toggle('pass')),
	Key([mod, "shift"], "F1", lazy.group['scratch'].dropdown_toggle('net1')),
	Key([mod, "shift"], "F2", lazy.group['scratch'].dropdown_toggle('net2')),
])
