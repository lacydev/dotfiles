from libqtile import layout
from libqtile.config import Match
import re

layouts = [
	layout.MonadTall(margin=8, border_focus='#ffe21a',
					 border_normal='#272121'),
	layout.MonadWide(margin=8, border_focus='#ffe21a',
				  border_normal='#272121'),
	layout.Max(margin=10),
]


floating_layout = layout.Floating(float_rules=[
	# Run the utility of `xprop` to see the wm class and name of an X client.
	*layout.Floating.default_float_rules,
	Match(wm_class='confirmreset'),  # gitk
	Match(wm_class='makebranch'),  # gitk
	Match(wm_class='maketag'),	# gitk
	Match(wm_class='ssh-askpass'),	# ssh-askpass
	Match(title='branchdialog'),  # gitk
	Match(title='pinentry'),  # GPG key password entry
	Match(title='*(DEBUG)'),  # godot debug
	Match(func=lambda c: c.has_fixed_size()),
	Match(func=lambda c: c.has_fixed_ratio()),
])
