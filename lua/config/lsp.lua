require("mason").setup({})
require("mason-lspconfig").setup({
    automatic_enable = {
        exclude = { "rust_analyzer" },
    },
})

vim.diagnostic.config({
    virtual_text = false,
    signs = {
        text = {
            [vim.diagnostic.severity.ERROR] = "",
            [vim.diagnostic.severity.WARN] = "",
            [vim.diagnostic.severity.INFO] = "󰋼",
            [vim.diagnostic.severity.HINT] = "󰌵",
        },
    },
})

vim.lsp.enable("rust_analyzer")
