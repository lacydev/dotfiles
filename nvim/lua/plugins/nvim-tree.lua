return {
	'nvim-tree/nvim-tree.lua',
	version = '*',
	lazy = false,
	dependencies = {
		'nvim-tree/nvim-web-devicons',
	},
	config = function()
		local api = require("nvim-tree.api")

		-- sets `-` to open/focus nvim-tree and find the current open file
		local function focusTree(updateRoot)
			api.tree.find_file{ open = true, update_root = updateRoot }
			api.tree.focus()
		end

		vim.keymap.set("n", "-", function() focusTree(false) end )
		vim.keymap.set("n", "_", function() focusTree(true)  end)

		local function defautl(bufnr)
			local function opts(desc)
				return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
			end

			-- default mappings
			api.config.mappings.default_on_attach(bufnr)

			vim.keymap.set("n", "/",		 api.tree.toggle_help,							opts("Help"))
			vim.keymap.set("n", "l",		 api.node.open.no_window_picker,		opts("Open"))
			vim.keymap.set("n", "h",		 api.node.navigate.parent_close,		opts("Close Directory"))
			vim.keymap.set("n", "<C-l>", api.tree.change_root_to_node,			opts("CD"))
			vim.keymap.set("n", "<C-h>", api.tree.change_root_to_parent,		opts("Up"))
			-- vim.keymap.set("n", "-",		 api.tree.reload,										opts("Refresh"))
			vim.keymap.set("n", "-",		 api.tree.close,										opts("Close"))
		end

		require("nvim-tree").setup{
			on_attach = defautl,
			view = {
				centralize_selection = true,
				cursorline = true,
				debounce_delay = 15,
				-- hide_root_folder = false,
				side = "left",
				preserve_window_proportions = false,
				number = false,
				relativenumber = true,
				signcolumn = "yes",
				width = 45,
				float = {
					enable = false,
					quit_on_focus_loss = true,
					open_win_config = {
						relative = "editor",
						border = "rounded",
						width = 30,
						height = 30,
						row = 1,
						col = 1,
					},
				},
			},
		}
	end,
}
