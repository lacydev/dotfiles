return {
	{
		"loctvl842/monokai-pro.nvim",
		name = "monokai",
		priority = 1000,
		config = function()
			require("monokai-pro").setup({
				styles = {
					comment = { italic = true },
					keyword = { italic = true }, -- any other keyword
					type = { italic = true }, -- (preferred) int, long, char, etc
					storageclass = { italic = true }, -- static, register, volatile, etc
					structure = { italic = true }, -- struct, union, enum, etc
					parameter = { italic = true }, -- parameter pass in function
					annotation = { italic = true },
					tag_attribute = { italic = true }, -- attribute of tag in reactjs
				},
				filter = "ristretto", -- classic | octagon | pro | machine | ristretto | spectrum
			})
			-- vim.cmd.colorscheme('monokai-pro')
		end,
	},

	{
		"ellisonleao/gruvbox.nvim",
		name = "gruvbox",
		priority = 1000,
		config = function()
			vim.cmd.colorscheme("gruvbox")
		end,
	},

	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,
		config = function()
			require("catppuccin").setup({
				flavour = "mocha", -- latte, frappe, macchiato, mocha-
			})
			-- vim.cmd.colorscheme('catppuccin')
		end,
	}
}
