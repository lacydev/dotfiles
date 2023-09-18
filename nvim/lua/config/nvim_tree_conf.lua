local api = require "nvim-tree.api"
vim.keymap.set('n', '-',     api.tree.toggle )

local function defautl(bufnr)

  local function opts(desc)
    return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
  end

  -- default mappings
  api.config.mappings.default_on_attach(bufnr)

  -- custom mappings
  vim.keymap.set('n', '%',     api.fs.create,                         opts('Create'))
  vim.keymap.set('n', '-',     api.tree.toggle,                       opts('Toggle'))
  vim.keymap.set('n', '.',     api.tree.toggle_hidden_filter,         opts('Toggle Filter: Dotfiles'))
  vim.keymap.set('n', 'l',     api.node.open.no_window_picker,        opts('Open: No Window Picker'))
  vim.keymap.set('n', 'h',     api.node.navigate.parent,              opts('Parent Directory'))
  vim.keymap.set('n', 'R',     api.fs.rename_basename,                opts('Rename: Basename'))
  vim.keymap.set('n', '<C-t>', api.tree.change_root_to_parent,        opts('Up'))
  vim.keymap.set('n', '?',     api.tree.toggle_help,                  opts('Help'))
end


require("nvim-tree").setup({
  on_attach = defautl,
  sort_by = "case_sensitive",
  view = {
    width = 48,
  },
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = true,
  },
  actions = {
	  open_file = {
		  quit_on_open = true,
	  },
  },
})
