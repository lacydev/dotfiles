" blink after search, and center result
if has('timers')
	noremap <expr> <plug>(slash-after) 'zz' . slash#blink(4,500)
endif
