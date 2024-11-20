return {
	{"42Paris/42header"},
	{
		"hardyrafael17/norminette42.nvim",
		config = function()
			require("norminette").setup({
				runOnSave = true,
				active = true,
			})
		end,
	},
}
