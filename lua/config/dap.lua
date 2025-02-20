local dap = require('dap')

dap.adapters.codelldb = {
	type = 'executable',
	command = function()
		local mason_registry = require('mason-registry')
		local codelldb = mason_registry.get_package('codelldb')
		return vim.fn.joinpath(codelldb, 'codelldb')
	end,
}
dap.configurations.cpp = {
	{
		name = "Debug program",
		type = "cppdbg",
		program = function()
			return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
		end,
		cwd = "${workspaceFolder}",
	}
}
dap.configurations.c = dap.configurations.cpp
