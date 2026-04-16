local gh = require("util").gh

vim.pack.add({
    gh("MunifTanjim/nui.nvim"),
    gh("nvim-lua/plenary.nvim"),
    { src = gh("nvim-neo-tree/neo-tree.nvim"), version = vim.version.range('3') },
}, {confirm = false})

require("neo-tree").setup({
    source_selector = {
        winbar = true,
        sources = {
            {
                source = "filesystem",
                display_name = " 󰉓 Files ",
            },
            {
                source = "buffers",
                display_name = " 󰈚 Buffers ",
            },
            {
                source = "git_status",
                display_name = " 󰊢 Git ",
            },
            {
                source = "document_symbols",
                display_name = "  Symbols "
            },
        },
    },
    default_component_configs = {
        indent = {
            with_expanders = true,
        },
    },
    filesystem = {
        filtered_items = {
            visible = true,
            hide_dotfiles = false,
        },
    },
})
