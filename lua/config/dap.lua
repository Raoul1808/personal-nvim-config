local dap = require('dap')

dap.adapters.cppdbg = {
	id = 'cppdbg',
	type = 'executable',
	command = '~/bin/extension/debugAdapters/bin/OpenDebugAD7',
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
