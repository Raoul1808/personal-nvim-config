local dap = require('dap')
local dapui = require('dapui')

dap.adapters.cppdbg = {
	id = 'cppdbg',
	type = 'executable',
	command = vim.env.HOME .. '/bin/cpptools-linux-x64/extension/debugAdapters/bin/OpenDebugAD7'
}
dap.configurations.cpp = {
	{
		name = "Debug program",
		type = "cppdbg",
		program = function()
			return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
		end,
		request = "launch",
		MIMode = "gdb",
		miDebuggerPath = "/usr/bin/gdb",
		cwd = "${workspaceFolder}",
		setupCommands = {
			{
				text = '-enable-pretty-printing',
				description = 'enable pretty printing',
				ignoreFailures = false,
			},
		},
	}
}
dap.configurations.c = dap.configurations.cpp

local open_dapui = function()
	dapui.open();
	vim.cmd("NvimTreeFresh")
end

local close_dapui = function()
	dapui.close();
	vim.cmd("NvimTreeFresh")
end

vim.api.nvim_create_user_command(
	"ToggleDapUi",
	function()
		require("dapui").toggle()
		vim.cmd("NvimTreeRefresh")
	end,
	{}
)

dap.listeners.before.attach.dapui_config = function()
	open_dapui()
end
dap.listeners.before.launch.dapui_config = function()
	open_dapui()
end
dap.listeners.before.event_terminated.dapui_config = function()
	close_dapui()
end
dap.listeners.before.event_exited.dapui_config = function()
	close_dapui()
end

dapui.setup({})
