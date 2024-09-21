-- helptab
vim.api.nvim_create_user_command("HelpTabCheck",
	function()
		-- if vim.api.nvim_buf_get_option(0, 'buftype') == 'help' then
		if vim.api.nvim_get_option_value('buftype', {}) == 'help' then
			vim.cmd.wincmd("T")
			vim.keymap.set("n", "q", "<cmd>q<cr>", { buffer = true })
			vim.keymap.set("n", "-", "<cmd>q<cr>", { buffer = true })
		end
	end,
{})

vim.api.nvim_create_augroup("help", { clear = true })
vim.api.nvim_create_autocmd({ "BufEnter" },
{
	group = "help",
	pattern = "*.txt",
	command = "HelpTabCheck"
}
)
