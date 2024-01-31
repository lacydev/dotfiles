require("nvim-treesitter.configs").setup({
    ensure_installed = {
        "bash",
        "fish",
        "gdscript",     -- Godot
        "lua",
        "vim",
        "vimdoc",
        "html",
        "css",
        "scss",
        "python"
    },
    sync_install = false,
    auto_install = true,
    highlight = { enable = true },
    indent = { enable = true },
})
