local conditions = require("heirline.conditions")
local utils = require("heirline.utils")

local function setup_colors()
	return {
		bright_bg = utils.get_highlight("Folded").bg,
		bright_fg = utils.get_highlight("Folded").fg,
		red = utils.get_highlight("DiagnosticError").fg,
		dark_red = utils.get_highlight("DiffDelete").bg,
		green = utils.get_highlight("String").fg,
		blue = utils.get_highlight("Function").fg,
		gray = utils.get_highlight("NonText").fg,
		orange = utils.get_highlight("Constant").fg,
		purple = utils.get_highlight("Statement").fg,
		cyan = utils.get_highlight("Special").fg,
		diag_warn = utils.get_highlight("DiagnosticWarn").fg,
		diag_error = utils.get_highlight("DiagnosticError").fg,
		diag_hint = utils.get_highlight("DiagnosticHint").fg,
		diag_info = utils.get_highlight("DiagnosticInfo").fg,
		git_del = utils.get_highlight("diffRemoved").fg,
		git_add = utils.get_highlight("diffAdded").fg,
		git_change = utils.get_highlight("diffChanged").fg,
		status_bg = utils.get_highlight("CursorLine").bg,
	}
end

local Align = { provider = "%=" }
local Space = { provider = " " }

local ViMode = {
	init = function(self)
		self.mode = vim.fn.mode(1)
	end,
	static = {
		mode_names = {
			["n"] = "NORMAL",
			["no"] = "O-PENDING",
			["nov"] = "O-PENDING",
			["noV"] = "O-PENDING",
			["no\22"] = "O-PENDING",
			["niI"] = "NORMAL",
			["niR"] = "NORMAL",
			["niV"] = "NORMAL",
			["nt"] = "NORMAL",
			["ntT"] = "NORMAL",
			["v"] = "VISUAL",
			["vs"] = "VISUAL",
			["V"] = "V-LINE",
			["Vs"] = "V-LINE",
			["\22"] = "V-BLOCK",
			["\22s"] = "V-BLOCK",
			["s"] = "SELECT",
			["S"] = "S-LINE",
			["\19"] = "S-BLOCK",
			["i"] = "INSERT",
			["ic"] = "INSERT",
			["ix"] = "INSERT",
			["R"] = "REPLACE",
			["Rc"] = "REPLACE",
			["Rx"] = "REPLACE",
			["Rv"] = "V-REPLACE",
			["Rvc"] = "V-REPLACE",
			["Rvx"] = "V-REPLACE",
			["c"] = "COMMAND",
			["cv"] = "EX",
			["ce"] = "EX",
			["r"] = "REPLACE",
			["rm"] = "MORE",
			["r?"] = "CONFIRM",
			["!"] = "SHELL",
			["t"] = "TERMINAL",
		},
		mode_colors = {
			n = "red",
			i = "green",
            v = "cyan",
            V =  "cyan",
            ["\22"] =  "cyan",
            c =  "orange",
            s =  "purple",
            S =  "purple",
            ["\19"] =  "purple",
            R =  "orange",
            r =  "orange",
            ["!"] =  "red",
            t =  "red",
		},
	},
	{
		provider = function(self)
			return "  "..self.mode_names[self.mode].." "
		end,
		hl = function(self)
			local mode = self.mode:sub(1, 1)
			return { bg = self.mode_colors[mode], fg = "status_bg", bold = true, }
		end,
	},
	{
		provider = "",
		hl = function(self)
			local mode = self.mode:sub(1, 1)
			return { fg = self.mode_colors[mode], bg = "status_bg", bold = true, }
		end,
	},
	update = {
		"ModeChanged",
		pattern = "*:*",
		callback = vim.schedule_wrap(function()
			vim.cmd("redrawstatus")
		end),
	},
}

local WorkDir = {
	init = function(self)
		self.icon = (vim.fn.haslocaldir(0) == 1 and "l" or "g") .. " " .. " "
		local cwd = vim.fn.getcwd(0)
		self.cwd = vim.fn.fnamemodify(cwd, ":~")
	end,
	hl = { fg = "blue" },

	flexible = 1,

	{
		provider = function(self)
			local trail = self.cwd:sub(-1) == "/" and "" or "/"
			return self.icon .. self.cwd .. trail .. " "
		end,
	},
	{
		provider = function(self)
			local cwd = vim.fn.pathshorten(self.cwd)
			local trail = self.cwd:sub(-1) == "/" and "" or "/"
			return self.icon .. cwd .. trail .. " "
		end,
	},
	{
		provider = "",
	},
}

local FileIcon = {
	init = function(self)
		local filename = self.filename
		local extension = vim.fn.fnamemodify(filename, ":e")
		self.icon, self.icon_color = require("nvim-web-devicons").get_icon_color(filename, extension, { default = true })
	end,
	provider = function(self)
		return self.icon and (self.icon .. " ")
	end,
	hl = function(self)
		return { fg = self.icon_color }
	end,
}

local FileName = {
	init = function(self)
		self.lfilename = vim.fn.fnamemodify(self.filename, ":.")
		if self.lfilename == "" then self.lfilename = "[No Name]" end
	end,
	hl = { fg = utils.get_highlight("Directory").fg, bold = true },

	flexible = 2,
	{
		provider = function(self)
			return self.lfilename
		end,
	},
	{
		provider = function(self)
			return vim.fn.pathshorten(self.lfilename)
		end,
	},
}

local FileType = {
	provider = function()
		return string.upper(vim.bo.filetype)
	end,
	hl = { fg = utils.get_highlight("Type").fg, bold = true },
}

local FileNameBlock = {
	init = function(self)
		self.filename = vim.api.nvim_buf_get_name(0)
	end,
	FileIcon,
	FileName,
}

local Git = {
	condition = conditions.is_git_repo,

	init = function(self)
		self.status_dict = vim.b.gitsigns_status_dict
		self.has_changes = self.status_dict.added ~= 0 or self.status_dict.removed ~= 0 or self.status_dict.changed ~= 0
	end,

	hl = { fg = "orange" },

	{
		provider = function(self)
			return " " .. self.status_dict.head
		end,
		hl = { bold = true },
	},
	{
		condition = function(self)
			return self.has_changes
		end,
		{
			provider = "(",
		},
		{
			provider = function(self)
				local count = self.status_dict.added or 0
				return count > 0 and ("+" .. count)
			end,
			hl = { fg = "git_add" },
		},
		{
			provider = function(self)
				local count = self.status_dict.removed or 0
				return count > 0 and ("-" .. count)
			end,
			hl = { fg = "git_del" },
		},
		{
			provider = function(self)
				local count = self.status_dict.changed or 0
				return count > 0 and ("~" .. count)
			end,
			hl = { fg = "git_change" },
		},
		{
			provider = ")",
		},
	}
}

local LSPActive = {
	condition = conditions.lsp_attached,
	update = {
		"LspAttach",
		"LspDetach",
	},
	provider = function()
		local names = {}
		for i, server in pairs(vim.lsp.get_clients({ bufnr = 0})) do
			table.insert(names, server.name)
		end
		return " [" .. table.concat(names, " ") .. "]"
	end,
	hl = { fg = "green", bold = true },
}

local Diagnostics = {
	condition = conditions.has_diagnostics,

	static = {
        error_icon = vim.fn.sign_getdefined("UndeprecatedizedDiagnosticSignError")[1].text,
        warn_icon = vim.fn.sign_getdefined("UndeprecatedizedDiagnosticSignWarn")[1].text,
        info_icon = vim.fn.sign_getdefined("UndeprecatedizedDiagnosticSignInfo")[1].text,
        hint_icon = vim.fn.sign_getdefined("UndeprecatedizedDiagnosticSignHint")[1].text,
	},

	init = function(self)
		self.errors = #vim.diagnostic.get(0, { severity = vim.diagnostic.ERROR })
		self.warnings = #vim.diagnostic.get(0, { severity = vim.diagnostic.WARN })
		self.hints = #vim.diagnostic.get(0, { severity = vim.diagnostic.HINT })
		self.infos = #vim.diagnostic.get(0, { severity = vim.diagnostic.INFO })
	end,

	update = {
		"DiagnosticChanged",
		"BufEnter",
	},

	{
		provider = function(self)
			return self.errors > 0 and (self.error_icon .. self.errors .. " ")
		end,
		hl = { fg = "diag_error" },
	},
	{
		provider = function(self)
			return self.warnings > 0 and (self.warn_icon .. self.warnings .. " ")
		end,
		hl = { fg = "diag_warn" },
	},
	{
		provider = function(self)
			return self.infos > 0 and (self.info_icon .. self.infos .. " ")
		end,
		hl = { fg = "diag_info" },
	},
	{
		provider = function(self)
			return self.hints > 0 and (self.hint_icon .. self.hints)
		end,
		hl = { fg = "diag_hint" },
	},
}

local Scrollbar = {
	static = {
		sbar = { '🭶', '🭷', '🭸', '🭹', '🭺', '🭻' },
	},
	provider = function(self)
		local curr_line = vim.api.nvim_win_get_cursor(0)[1]
		local lines = vim.api.nvim_buf_line_count(0)
		local i = math.floor((curr_line - 1) / lines * #self.sbar) + 1
		return string.rep(self.sbar[i], 2)
	end,
	hl = { fg = "blue", bg = "bright_bg" },
}

local Ruler = {
	provider = "%7(%l/%3L%):%2v %P",
}

local StatusLine = {
	hl = { bg = "status_bg" },
	ViMode, Space, WorkDir, FileNameBlock, Space, Git,
	Align,
	Diagnostics,
	Align,
	LSPActive, Space, FileType, Space, Ruler, Space, Scrollbar,
}

require("heirline").setup({
	statusline = StatusLine,
	opts = {
		colors = setup_colors,
	}
})

vim.api.nvim_create_augroup("Heirline", { clear = true })
vim.api.nvim_create_autocmd("ColorScheme", {
	group = "Heirline",
	callback = function()
		utils.on_colorscheme(setup_colors)
	end,
})
vim.api.nvim_create_autocmd("VimEnter", {
	group = "Heirline",
	callback = function()
		utils.on_colorscheme(setup_colors)
	end,
})
