return {
	{
		"williamboman/mason.nvim",
		lazy = false,
		opts = {},
	},
	{
		"hrsh7th/nvim-cmp",
		dependencies = {},
		event = "InsertEnter",
		config = function()
			local cmp = require("cmp")

			cmp.setup({
				preselect = 'item',
				completion = {
					completeopt = 'menu,menuone,noinsert',
				},
				window = {
					completion = cmp.config.window.bordered(),
					docuentation = cmp.config.window.bordered(),
				},
				sources = {
					{name = "nvim-lsp"},
				},
				mapping = cmp.mapping.preset.insert({
					['<CR>'] = cmp.mapping.confirm({select = false}),
					['<C-Space>'] = cmp.mapping.complete(),
					['<C-u>'] = cmp.mapping.scroll_docs(-4),
					['<C-d>'] = cmp.mapping.scroll_docs(4),
				}),
				snippet = {
					expand = function(args)
						vim.snippet.expand(args.body)
					end,
				},
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		cmd = {'LspInfo', 'LspInstall', 'LspStart'},
		event = {'BufReadPre', 'BufNewFile'},
		dependencies = {
			{"hrsh7th/cmp-nvim-lsp"},
			{"williamboman/mason.nvim"},
			{"williamboman/mason-lspconfig.nvim"},
		},
		init = function()
			vim.opt.signcolumn = 'yes'
		end,
		config = function()
			require('config.lsp')
		end,
	},
}
