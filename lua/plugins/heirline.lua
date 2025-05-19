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
}
