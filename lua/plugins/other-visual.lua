local gh = require("util").gh

vim.pack.add({
    gh("nvim-mini/mini.indentscope"),
}, {confirm = false})

require("mini.indentscope").setup({
    symbol = "│",
})
