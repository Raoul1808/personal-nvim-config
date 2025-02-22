return {
	{
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
		config = function()
			require("nvim-treesitter.configs").setup({
				sync_install = true,
				auto_install = true,
			})
		end,
	},
	{ "nvim-tree/nvim-web-devicons" },
	{
		"navarasu/onedark.nvim",
		priority = 1000,
		config = function()
			require('onedark').setup({
				style = "warm",
			})
		end,
	},
	{
		"wakatime/vim-wakatime",
		lazy = false,
	},
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		opts = {},
		keys = {
			{
				"<Leader>?",
				function()
					require("which-key").show({ global = false })
				end,
				desc = "Buffer Local Keymaps (which-key)",
			},
		},
	},
}
