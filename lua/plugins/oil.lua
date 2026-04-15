local gh = require("util").gh

vim.pack.add({
    gh("nvim-mini/mini.icons"),
    gh("stevearc/oil.nvim"),
})

require("oil").setup()

vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
