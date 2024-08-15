let g:bullets_enabled_file_types = ['markdown', 'text', 'gitcommit']
let g:bullets_enable_in_empty_buffers = 1
let g:bullets_set_mappings = 1
" let g:bullets_mapping_leader = "\<Space>"
let g:bullets_delete_last_bullet_if_empty = 1
let g:bullets_pad_right = 1
let g:bullets_max_alpha_characters = 2
let g:bullets_outline_levels = ['ROM', 'ABC', 'num', 'abc', 'rom', 'std-',
	\ 'std*', 'std+']
let g:bullets_renumber_on_change = 1
let g:bullets_nested_checkboxes = 1
let g:bullets_checkbox_markers = ' .oOX'
let g:bullets_checkbox_markers = ' X'
" let g:bullets_checkbox_markers = '✗○◐●✓'
let g:bullets_checkbox_partials_toggle = 1

nmap <leader><Space> <cmd>ToggleCheckbox<cr>
