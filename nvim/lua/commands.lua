-- dotfile editing
vim.api.nvim_create_user_command('Rc', ':$tabnew | NvimTreeOpen ~/.dotfiles/nvim/', { bang = true })
vim.api.nvim_create_user_command('Reload', ':source $MYVIMRC', { bang = true })

-- helptab
function help_tab_check()
	if vim.api.nvim_buf_get_option(0, 'buftype') == 'help' then
		vim.cmd.wincmd("T")
		vim.cmd.normal("zz") -- TODO not working for some reason
		vim.keymap.set("n", "q", ":q<cr>", { buffer = true })
	end
end

vim.api.nvim_create_augroup("help", { clear = true })
vim.api.nvim_create_autocmd({ "BufEnter" },  
{
	-- group = "help",
	pattern = "*.txt",
	command = "lua help_tab_check()"
}
)

