return {
	{"numToStr/Comment.nvim"},
	{"folke/ts-comments.nvim"},
	{"sphamba/smear-cursor.nvim"},
	{
		"folke/snacks.nvim",
		priority = 1000,
		lazy = false,
		opts = {
			scroll = { enabled = true },
		},
		keys = {
			{"<leader>bd", function() Snacks.bufdelete() end, desc = "Delete Buffer"},
		},
	},
}
