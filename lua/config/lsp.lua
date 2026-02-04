require("mason").setup({})
require("mason-lspconfig").setup({
    automatic_enable = {
        exclude = { "rust_analyzer" },
    },
})

vim.lsp.enable("rust_analyzer")
