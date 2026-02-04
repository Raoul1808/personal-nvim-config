return {
    {
        "rachartier/tiny-inline-diagnostic.nvim",
        event = "VeryLazy",
        priority = 1000,
        config = function()
            require("tiny-inline-diagnostic").setup({
                preset = "modern",
                options = {
                    show_source = {
                        enabled = true,
                    },
                },
            })
            vim.diagnostic.config({ virtual_text = false })
        end,
    },
    {
        "rachartier/tiny-code-action.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-telescope/telescope.nvim",
        },
        event = "LspAttach",
        opts = {
            backend = "delta",
            picker = "telescope",
            format_title = function(action, client)
                if action.kind then
                    return string.format("%s (%s)", action.title, action.kind)
                end
                return action.title
            end,
        },
    },
}
