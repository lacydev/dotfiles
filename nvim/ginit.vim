if exists('g:fvim_loaded')
	set guifont=Mononoki\ Nerd\ Font\ Mono:h14

	" Toggle between normal and fullscreen
	" FVimToggleFullScreen

	" Cursor tweaks
	FVimCursorSmoothMove v:true
	FVimCursorSmoothBlink v:true

	" Background composition
	FVimBackgroundComposition 'acrylic'
	FVimBackgroundOpacity 0.97
	FVimBackgroundAltOpacity 0.97
	" FVimBackgroundImage 'C:/foobar.png'
	" FVimBackgroundImageVAlign 'center'
	" FVimBackgroundImageHAlign 'center'
	" FVimBackgroundImageStretch 'fill'
	" FVimBackgroundImageOpacity 0.85

	" Title bar tweaks
	FVimCustomTitleBar v:true

	" Debug UI overlay
	" FVimDrawFPS v:true

	" Font tweaks
	FVimFontAntialias v:true
	FVimFontAutohint v:true
	FVimFontHintLevel 'full'
	FVimFontLigature v:true
	FVimFontLineHeight '+1.0'
	FVimFontSubpixel v:true
	FVimFontNoBuiltinSymbols v:false

	" Try to snap the fonts to the pixels, reduces blur
	" in some situations (e.g. 100% DPI).
	" FVimFontAutoSnap v:true

	" Font weight tuning, possible valuaes are 100..900
	FVimFontNormalWeight 400
	FVimFontBoldWeight 800

	" Font debugging -- draw bounds around each glyph
	" FVimFontDrawBounds v:true

	" UI options (all default to v:false)
	" FVimUIPopupMenu v:true
	" FVimUIWildMenu v:false

	" Keyboard mapping options
	FVimKeyDisableShiftSpace v:true
	FVimKeyAutoIme v:true
	FVimKeyAltGr v:true

	" Default options (workspace-agnostic)
	FVimDefaultWindowWidth 1600
	FVimDefaultWindowHeight 900

	" Detach from a remote session without killing the server
	" If this command is executed on a standalone instance,
	" the embedded process will be terminated anyway.
	" FVimDetach

	" =========== BREAKING CHANGES -- the following commands are disabled ============
	" FVimUIMultiGrid v:true     -- per-window grid system -- done and enabled by default
	" FVimUITabLine v:false      -- external tabline -- not implemented
	" FVimUICmdLine v:false      -- external cmdline -- not implemented
	" FVimUIMessages v:false     -- external messages -- not implemented
	" FVimUITermColors v:false   -- not implemented
	" FVimUIHlState v:false      -- not implemented

	" Ctrl-ScrollWheel for zooming in/out
	nnoremap <silent> <C-ScrollWheelUp> :set guifont=+<CR>
	nnoremap <silent> <C-ScrollWheelDown> :set guifont=-<CR>
	nnoremap <A-CR> :FVimToggleFullScreen<CR>

endif
