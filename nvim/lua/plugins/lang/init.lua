-- auto-load all lua files in this directory
local lang_dir = vim.fn.stdpath("config") .. "/lua/plugins/lang"
for file, _ in vim.fs.dir(lang_dir) do
	if file:match("%.lua$") and file ~= "init.lua" then
		local mod = file:gsub("%.lua$", "")
		require("plugins.lang." .. mod)
	end
end
