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
        keys = function()
            local crates = require('crates')
            return {
                {
                    "<leader>cf",
                    crates.show_features_popup,
                    desc = "Toggle crate features",
                },
            }
        end,
    },
}
