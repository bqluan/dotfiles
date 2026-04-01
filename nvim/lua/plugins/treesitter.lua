vim.pack.add({
	{ src = "https://github.com/nvim-treesitter/nvim-treesitter", name = "nvim-treesitter" },
})

-- add languages here for treesitter parser install + highlight
local supportedLanguages = { "go", "lua" }

-- install parsers (async, no-op if already installed)
require("nvim-treesitter").install(supportedLanguages)

-- enable treesitter highlighting
vim.api.nvim_create_autocmd("FileType", {
	pattern = supportedLanguages,
	callback = function()
		vim.treesitter.start()
	end,
})
