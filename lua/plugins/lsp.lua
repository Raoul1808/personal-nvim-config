local gh = require("util").gh

vim.pack.add({
    gh("neovim/nvim-lspconfig"),
    gh("mason-org/mason.nvim"),
    gh("mason-org/mason-lspconfig.nvim"),
    gh("folke/lazydev.nvim"),
}, {confirm = false})

require("mason").setup()
require("mason-lspconfig").setup({
    automatic_enable = {
        exclude = {
            "rust_analyzer",
        },
    },
})

require("lazydev").setup()
