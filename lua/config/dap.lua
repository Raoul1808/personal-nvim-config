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
		MIMode = "gdb",
		miDebuggerPath = "/usr/bin/gdb",
		cwd = "${workspaceFolder}",
	}
}
dap.configurations.c = dap.configurations.cpp

dap.listeners.before.attach.dapui_config = function()
	dapui.open()
end
dap.listeners.before.launch.dapui_config = function()
	dapui.open()
end
dap.listeners.before.event_terminated.dapui_config = function()
	dapui.close()
end
dap.listeners.before.event_exited.dapui_config = function()
	dapui.close()
end
