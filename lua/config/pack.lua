local config_path = vim.fn.stdpath("config")
for _, file in ipairs(vim.fn.readdir(config_path .. "/lua/plugins", [[v:val =~ '\.lua$']])) do
    require("plugins." .. file:gsub("%.lua$", ""))
end
