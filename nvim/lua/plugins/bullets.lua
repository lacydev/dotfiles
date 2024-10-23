return {
	"bullets-vim/bullets.vim",
	config = function()
		vim.g.bullets_enabled_file_types = { 'markdown', 'text', 'gitcommit' }
		vim.g.bullets_enable_in_empty_buffers = 1
		vim.g.bullets_set_mappings = 1
		-- vim.g.bullets_mapping_leader = "\<Space>"
		vim.g.bullets_delete_last_bullet_if_empty = 1
		vim.g.bullets_pad_right = 1
		vim.g.bullets_max_alpha_characters = 2
		vim.g.bullets_outline_levels = { 'ROM', 'ABC', 'num', 'abc', 'rom',
			'std-', 'std*', 'std+' }
		vim.g.bullets_renumber_on_change = 1
		vim.g.bullets_nested_checkboxes = 1
		vim.g.bullets_checkbox_markers = ' .oOX'
		-- vim.g.bullets_checkbox_markers = ' X'
		-- vim.g.bullets_checkbox_markers = '✗○◐●✓'
		vim.g.bullets_checkbox_partials_toggle = 1

	end
}

