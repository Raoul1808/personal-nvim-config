return {
	{
		"williamboman/mason.nvim",
		lazy = false,
		opts = {},
	},
	{
		"L3MON4D3/LuaSnip",
		version = "v2.*",
	},
	{
		"hrsh7th/nvim-cmp",
		dependencies = {
			"L3MON4D3/LuaSnip",
			"hrsh7th/nvim-cmp",
			"onsails/lspkind.nvim",
		},
		event = "InsertEnter",
		config = function()
			require('config.cmp')
		end,
	},
	{
		"neovim/nvim-lspconfig",
		cmd = {'LspInfo', 'LspInstall', 'LspStart'},
		event = {'BufReadPre', 'BufNewFile'},
		dependencies = {
			{"hrsh7th/cmp-nvim-lsp"},
		},
		init = function()
			vim.opt.signcolumn = 'yes'
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		dependencies = {
			"williamboman/mason.nvim",
			"neovim/nvim-lspconfig",
		},
		config = function()
			require('config.lsp')
		end,
	}
}
