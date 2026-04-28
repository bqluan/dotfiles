vim.pack.add({
	{ src = "https://github.com/nvim-tree/nvim-web-devicons" },
	{ src = "https://github.com/nvim-tree/nvim-tree.lua" },
})

require("nvim-tree").setup({
	on_attach = function(bufnr)
		require("nvim-tree.api").config.mappings.default_on_attach(bufnr)
		-- let flash handle 's' (see keymaps.lua)
		vim.keymap.del("n", "s", { buffer = bufnr })
	end,
	view = {
		width = 35,
	},
	renderer = {
		root_folder_label = function(path)
			return "󰙅 " .. vim.fn.fnamemodify(path, ":t")
		end,
		special_files = {},
		icons = {
			git_placement = "after",
		},
	},
	filters = {
		git_ignored = true,
		dotfiles = true,
	},
})
