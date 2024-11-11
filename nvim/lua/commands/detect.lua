-- custom filetype detector
if vim.g.did_load_filetypes then
	return
end

local api = vim.api
local ftd = api.nvim_create_augroup("filetypedetect", {clear = true})

api.nvim_create_autocmd( { 'BufNewFile', 'BufRead' }, {
	pattern = "*.inc",
	group = ftd,
	command = "set filetype=dosini"
} )

