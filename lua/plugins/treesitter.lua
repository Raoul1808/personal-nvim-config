return {
    "nvim-treesitter/nvim-treesitter",
    branch = "master",
    lazy = false,
    build = ":TSUpdate",
    config = function()
        require("nvim-treesitter.configs").setup({
            ensure_installed = { "vim", "regex", "lua", "bash", "markdown", "markdown_inline" },
            auto_install = true,
        })
    end,
}
