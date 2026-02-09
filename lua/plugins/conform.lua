return {
    "stevearc/conform.nvim",
    opts = {
        formatters_by_ft = {
            rust = { "rustfmt" },
        },
        format_on_save = {
            timeout_ms = 500,
            lsp_format = "fallback",
        },
    },
    init = function()
        vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
        vim.api.nvim_create_autocmd("BufWritePre", {
            pattern = "*",
            callback = function(args)
                require("conform").format({ bufnr = args.buf })
            end,
        })
    end,
}
