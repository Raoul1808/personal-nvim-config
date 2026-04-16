local gh = require("util").gh

vim.pack.add({
    gh("rachartier/tiny-inline-diagnostic.nvim"),
    gh("rachartier/tiny-code-action.nvim"),
}, {confirm = false})

require("tiny-inline-diagnostic").setup()
vim.diagnostic.config({ virtual_text = false })

require("tiny-code-action").setup({
    picker = "buffer",
})

vim.keymap.set("n", "<leader>ca", function() require("tiny-code-action").code_action({}) end, { desc = "Code Action" })
