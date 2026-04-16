local gh = require("util").gh

vim.pack.add({gh("nvim-mini/mini.icons")}, {confirm = false})

require("mini.icons").setup()
MiniIcons.mock_nvim_web_devicons()
