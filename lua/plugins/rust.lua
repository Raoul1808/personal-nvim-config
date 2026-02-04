return {
    {
        "mrcjkb/rustaceanvim",
        version = "^7",
        lazy = false,
    },
    {
        "Saecki/crates.nvim",
        tab = 'stable',
        opts = {
            lsp = {
                enabled = true,
                actions = true,
                completion = true,
                hover = true,
            },
        },
    },
}
