return {
	{
		"lewis6991/gitsigns.nvim",
		config = function()
			require('gitsigns').setup()
		end,
	},
	{
		"rebelot/heirline.nvim",
		dependencies = {
			"nvim-tree/nvim-web-devicons",
			"folke/noice.nvim",
			"lewis6991/gitsigns.nvim",
		},
		event = "UiEnter",
		config = function()
			require('config.heirline')
		end,
	},
	{
		"akinsho/bufferline.nvim",
		dependencies = {
			"nvim-tree/nvim-web-devicons"
		},
		config = function ()
			require("bufferline").setup({
				options = {
					offsets = {
						{
							filetype = "NvimTree",
							text = "File Explorer",
							text_align = "center",
							separator = true,
						},
					},
					color_icons = true,
					separator_style = "slant",
				}
			})
		end
	},
}
