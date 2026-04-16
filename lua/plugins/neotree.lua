local gh = require("util").gh

vim.pack.add({
    gh("MunifTanjim/nui.nvim"),
    gh("nvim-lua/plenary.nvim"),
    { src = gh("nvim-neo-tree/neo-tree.nvim"), version = vim.version.range('3') },
}, {confirm = false})

require("neo-tree").setup({})
