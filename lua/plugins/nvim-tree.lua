return {
  "nvim-tree/nvim-tree.lua",
  version = "*",
  lazy = false,
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    require("nvim-tree").setup {
		renderer = {
			highlight_git = "all",
			highlight_modified = "all",
		},
		diagnostics = {
			enable = true,
		},
		modified = {
			enable = true,
		},
	}
  end,
}
