vim.pack.add({
	{ src = "https://github.com/nvim-tree/nvim-web-devicons" },
	{ src = "https://github.com/nvim-tree/nvim-tree.lua" },
})

require("nvim-tree").setup({
	view = {
		width = 35,
	},
	renderer = {
		root_folder_label = function(path)
			return "󰙅 " .. vim.fn.fnamemodify(path, ":t")
		end,
		special_files = {},
	},
	filters = {
		git_ignored = true,
		dotfiles = true,
	},
})
