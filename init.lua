require("config.lazy")

local config_dir = vim.fn.stdpath("config")
---@cast config_dir string

vim.cmd("source" .. vim.fs.joinpath(config_dir, "vim_conf/options.vim"))
