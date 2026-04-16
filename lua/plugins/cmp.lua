local gh = require("util").gh

vim.pack.add({{ src = gh("saghen/blink.cmp"), version = vim.version.range("1") }}, {confirm = false})

require("blink.cmp").setup({
    enabled = function ()
        return not vim.tbl_contains({ "markdown" }, vim.bo.filetype)
    end,
    cmdline = { enabled = false },
    keymap = { preset = "super-tab" },
    appearance = {
        nerd_font_variant = "normal",
    },
    sources = {
        default = {"lsp", "path", "snippets"},
        per_filetype = {
            lua = { inherit_defaults = true, "lazydev" },
        },
        providers = {
            lazydev = {
                name = "LazyDev",
                module = "lazydev.integrations.blink",
                score_offset = 100,
            },
        },
    },
    fuzzy = { implementation = "prefer_rust_with_warning" },
    opts_extend = { "sources.default" },
})
