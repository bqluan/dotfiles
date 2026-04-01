-- auto-load all lua files in plugins/ directory
local plugin_dir = vim.fn.stdpath("config") .. "/lua/plugins"
for file, _ in vim.fs.dir(plugin_dir) do
	if file:match("%.lua$") and file ~= "init.lua" then
		local mod = file:gsub("%.lua$", "")
		require("plugins." .. mod)
	end
end

require("plugins.lang")
