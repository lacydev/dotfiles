return {
	{
		'nvim-telescope/telescope.nvim', tag = '0.1.8',
		dependencies = {
			'nvim-lua/plenary.nvim',
			'nvim-tree/nvim-web-devicons',
		},
		config = function()
			local builtin = require('telescope.builtin')
			vim.keymap.set('n', '<C-p>', builtin.find_files, {desc = "Telescope: Files"})
			vim.keymap.set('n', '<leader>tg', builtin.live_grep, {desc = "Telescope: Live Grep"})
			vim.keymap.set('n', '<leader>tb', builtin.buffers, {desc = "Telescope: Buffers"})
			vim.keymap.set('n', '<leader>to', builtin.oldfiles, {desc = "Telescope: Recent Files"})
		end
	},
	{
		'nvim-telescope/telescope-ui-select.nvim',
		config = function()
			require("telescope").setup {
				extensions = {
					["ui-select"] = {
						require("telescope.themes").get_dropdown {
						}
					}
				}
			}
			require("telescope").load_extension("ui-select")
		end
	}

}
