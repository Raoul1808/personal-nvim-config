local gh = require("util").gh

vim.pack.add({gh("folke/which-key.nvim")}, {confirm = false})

require("which-key").setup()

vim.keymap.set("n", "<leader>?", function() require("which-key").show({ global = false }) end, { desc = "Buffer Local Keymaps (which-key)" })
