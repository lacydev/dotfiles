require("toggleterm").setup{
	open_mapping = "<c-\\>",
	direction = "float",
	float_opts = {
		border = "double",
		-- 'single' | 'double' | 'shadow' | 'curved' | ... other options supported by win open
		winblend = 3,
	},
	winbar = {
		enabled = true,
	},
}
