return {
	"monaqa/dial.nvim",
	config = function()
		local augend = require("dial.augend")
		require("dial.config").augends:register_group{
			default = {
				augend.integer.alias.decimal,
				augend.integer.alias.hex,
				augend.date.alias["%Y/%m/%d"],
				augend.constant.alias.bool,
				augend.semver.alias.semver,
				augend.constant.alias.alpha,
				augend.constant.alias.Alpha,
			},
			typescript = {
				augend.integer.alias.decimal,
				augend.integer.alias.hex,
				augend.constant.new{ elements = {"let", "const"} },
			},
			-- visual = {
			-- 	augend.integer.alias.decimal,
			-- 	augend.integer.alias.hex,
			-- 	augend.date.alias["%Y/%m/%d"],
			-- 	augend.constant.alias.alpha,
			-- 	augend.constant.alias.Alpha,
			-- },
		}

		-- change augends in VISUAL mode
		local map = require("dial.map")
		vim.keymap.set("n", "<C-a>", function()
			map.manipulate("increment", "normal")
		end)
		vim.keymap.set("n", "<C-x>", function()
			map.manipulate("decrement", "normal")
		end)
		vim.keymap.set("n", "g<C-a>", function()
			map.manipulate("increment", "gnormal")
		end)
		vim.keymap.set("n", "g<C-x>", function()
			map.manipulate("decrement", "gnormal")
		end)
		vim.keymap.set("v", "<C-a>", function()
			map.manipulate("increment", "visual")
		end)
		vim.keymap.set("v", "<C-x>", function()
			map.manipulate("decrement", "visual")
		end)
		vim.keymap.set("v", "g<C-a>", function()
			map.manipulate("increment", "gvisual")
		end)
		vim.keymap.set("v", "g<C-x>", function()
			map.manipulate("decrement", "gvisual")
		end)
	end
}

