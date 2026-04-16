local gh = require("util").gh

vim.pack.add({
    gh("NeogitOrg/neogit")
}, {confirm = false})

vim.keymap.set(
    "n",
    "<leader>gg",
    "<CMD>Neogit<CR>",
    { desc = "Open Neogit UI" }
)
