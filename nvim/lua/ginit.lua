function NeovideToggleFullscreen()
	vim.g.neovide_fullscreen = not vim.g.neovide_fullscreen
end

vim.keymap.set('n', '<F11>', ":lua NeovideToggleFullscreen()<cr>", {})
vim.keymap.set('n', '<C-Enter>', ":lua NeovideToggleFullscreen()<cr>", {})

vim.o.guifont = "Mononoki Nerd Font:h11"
vim.g.neovide_scale_factor = 1.0
vim.g.neovide_text_gamma = 0.0
vim.g.neovide_text_contrast = 0.5

vim.g.neovide_padding_top = 8
vim.g.neovide_padding_bottom = 8
vim.g.neovide_padding_right = 8
vim.g.neovide_padding_left = 8

vim.g.neovide_transparency = 0.985
vim.g.neovide_hide_mouse_when_typing = true
vim.g.neovide_theme = 'dark'
vim.g.neovide_remember_window_size = true
-- vim.g.neovide_fullscreen = false

vim.g.neovide_position_animation_length = 0.07
vim.g.neovide_scroll_animation_length = 0.1
vim.g.neovide_cursor_animation_length = 0.07
vim.g.neovide_cursor_trail_size = 0.4
vim.g.neovide_cursor_antialiasing = true
vim.g.neovide_cursor_animate_in_insert_mode = true
vim.g.neovide_cursor_animate_command_line = true
vim.g.neovide_cursor_unfocused_outline_width = 0.125
vim.g.neovide_cursor_smooth_blink = true
-- railgun | torpedo | pixiedust | sonicboom | ripple | wireframe
vim.g.neovide_cursor_vfx_mode = "pixiedust"
