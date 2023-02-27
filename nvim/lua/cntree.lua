local function open_nvim_tree(data)
	-- checking is [No Name]
	local no_name = data.file == "" and vim.bo[data.buf].buftype == ""

	-- checking if directory
	local directory = vim.fn.isdirectory(data.file) == 1

	if not no_name and not directory then
		return
	end

	-- change directory
	if directory then
		vim.cmd.cd(data.file)
	end

	-- open nvim-tree
	require "nvim-tree.api".tree.open()
end

vim.api.nvim_create_autocmd({ "VimEnter" }, { callback = open_nvim_tree })

local HEIGHT_RATIO = 0.9
local WIDTH_RATIO = 0.6

require "nvim-tree".setup({
	disable_netrw = true,
	hijack_netrw = true,
	-- respect_buf_cwd = true,
	-- sync_root_with_cwd = true,
	sort_by = "case_sensitive",
	reload_on_bufenter = true,
	auto_reload_on_write = true,
	remove_keymaps = { "<Tab>" },
	view = {
		width = function()
			return math.floor(vim.opt.columns:get() * WIDTH_RATIO)
		end,
		mappings = {
			list = {
				{ key = "<a-Up>", action = "close_node" },
				{ key = "h", action = "close_node" },
				{ key = "<a-Down>", action = "edit_no_picker" },
				{ key = "l", action = "edit_no_picker" },
				{ key = "<Esc>", action = "close" },
				},
			},
		float = {
			enable = true,
			open_win_config = function()
				local screen_w = vim.opt.columns:get()
				local screen_h = vim.opt.lines:get() - vim.opt.cmdheight:get()
				local window_w = screen_w * WIDTH_RATIO
				local window_h = screen_h * HEIGHT_RATIO
				local window_w_int = math.floor(window_w)
				local window_h_int = math.floor(window_h)
				local center_x = (screen_w - window_w) / 2
				local center_y = ((vim.opt.lines:get() - window_h) / 2)
										 - vim.opt.cmdheight:get()
				return {
					border = "rounded",
					relative = "editor",
					row = center_y,
					col = center_x,
					width = window_w_int,
					height = window_h_int,
				}
				end,
			},
		},
	actions = {
		open_file = {
			quit_on_open = true
		}
	},
	renderer = {
		group_empty = true,
	},
	filters = {
		dotfiles = false,
	},
})

vim.keymap.set("n", "-", "<cmd>NvimTreeOpen<CR>", { silent = true })

