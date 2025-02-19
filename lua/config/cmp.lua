local cmp = require("cmp")
local types = require("cmp.types")
local luasnip = require("luasnip")
require("config.cmp_colors")

cmp.setup({
	enabled = true,
	preselect = 'item',
	completion = {
		autocomplete = {
			types.cmp.TriggerEvent.TextChanged,
		},
		completeopt = 'menu,menuone,noinsert',
		keyword_pattern = [[\%(-\?\d\+\%(\.\d\+\)\?\|\h\w*\%(-\w*\)*\)]],
		keyword_length = 1,
	},
	window = {
		completion = {
			winhighlight = "Normal:Pmenu,FloatBorder:Pmenu,Search:None",
			col_offset = -3,
			side_padding = 0,
		},
	},
	formatting = {
		fields = {"kind", "abbr", "menu"},
		format = function(entry, vim_item)
			if vim.tbl_contains({ 'path' }, entry.source.name) then
				local icon, hl_group = require("nvim-web-devicons").get_icon(entry:get_completion_item().label)
				if icon then
					vim_item.kind = icon
					vim_item.kind.hl_group = hl_group
				end
			end
			local kind = require("lspkind").cmp_format({ mode = "symbol_text", mazwidth = 50 })(entry, vim_item)
			local strings = vim.split(kind.kind, "%s", { triempty = true })
			kind.kind = " " .. (strings[1] or "") .. " "
			kind.menu = "    (" .. (strings[2] or "") .. ")"
			return kind
		end,
	},
	view = {
		entries = {
			name = "custom",
			selection_order = "near_cursor",
		}
	},
	sources = {
		{name = "nvim_lsp"},
		{name = "luasnip"},
	},
	mapping = cmp.mapping.preset.insert({
		['<CR>'] = cmp.mapping(function(fallback)
			if cmp.visible() then
				if luasnip.expandable() then
					luasnip.expand()
				else
					cmp.confirm({
						select = true,
					})
				end
			else
				fallback()
			end
		end),
		["<Tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_next_item()
			elseif luasnip.locally_jumpable(1) then
				luasnip.jump(1)
			else
				fallback()
			end
		end, { "i", "s" }),
		["<S-Tab"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_prev_item()
			elseif luasnip.locally_jumpable(-1) then
				luasnip.jump(-1)
			else
				fallback()
			end
		end, { "i", "s" }),
		['<C-Space>'] = cmp.mapping.complete(),
		['<C-u>'] = cmp.mapping.scroll_docs(-4),
		['<C-d>'] = cmp.mapping.scroll_docs(4),
	}),
	snippet = {
		expand = function(args)
			require('luasnip').lsp_expand(args.body)
		end,
	},
})
