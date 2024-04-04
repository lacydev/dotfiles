
require("nvim-surround").setup({
	keymaps = {
		insert = "<C-g>s",
		insert_line = "<C-g>S",
		normal = "ys",
		normal_cur = "yss",
		normal_line = "yS",
		normal_cur_line = "ySS",
		visual = "S",
		visual_line = "gS",
		delete = "ds",
		change = "cs",
		change_line = "cS",
	},
	surrounds = {},    -- Defines surround keys and behavior
	aliases = {
		["a"] = ">",
		["b"] = ")",
		["B"] = "}",
		["r"] = "]",
		["q"] = { '"', "'", "`" },
		["s"] = { "}", "]", ")", ">", '"', "'", "`" },
	},
	highlight = {},
	move_cursor = false,
	indent_lines = false -- Defines line indentation behavior
})
