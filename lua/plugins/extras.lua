return {
	{
		"numToStr/Comment.nvim",
		config = function()
			require('Comment').setup()
		end,
	},
	{ "folke/ts-comments.nvim" },
	{
		"folke/snacks.nvim",
		priority = 1000,
		lazy = false,
		opts = {
			scroll = { enabled = true },
		},
	},
}
