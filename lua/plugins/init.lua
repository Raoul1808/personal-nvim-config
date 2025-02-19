return {
	{"nvim-treesitter/nvim-treesitter", build = ":TSUpdate"},
	{"nvim-tree/nvim-web-devicons"},
	{
		"navarasu/onedark.nvim",
		priority = 1000,
		config = function()
			require('onedark').setup({
				style = "warm",
			})
		end,
	},
	{"wakatime/vim-wakatime", lazy = false},
}
