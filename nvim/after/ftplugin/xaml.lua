-- Detects XAML files as XML
vim.api.nvim_create_autocmd( { "BufNewFile", "BufRead" }, {
	pattern = "*.xaml",
	callback = function()
		vim.bo.filetype = "xml"
	end,
}
-- au BufNewFile,BufRead *.xaml setlocal filetype=xml
