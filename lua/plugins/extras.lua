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
		keys = {
			{ "<leader>bd", function() Snacks.bufdelete() end, desc = "Delete Buffer" },
		},
	},
}
