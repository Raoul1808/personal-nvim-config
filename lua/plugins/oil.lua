local gh = require("util").gh

vim.pack.add({
    gh("nvim-mini/mini.icons"),
    gh("stevearc/oil.nvim"),
}, { confirm = false })

require("mini.icons").setup()
require("oil").setup()

vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
