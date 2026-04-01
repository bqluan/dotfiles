vim.pack.add({
	{ src = "https://github.com/nvim-tree/nvim-web-devicons" },
	{ src = "https://github.com/nvim-tree/nvim-tree.lua" },
})

require("nvim-tree").setup({
	renderer = {
		special_files = {},
	},
	filters = {
		git_ignored = true,
		dotfiles = true,
	},
})
