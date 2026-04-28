vim.pack.add({
	{ src = "https://github.com/nvim-tree/nvim-web-devicons" },
	{ src = "https://github.com/nvim-tree/nvim-tree.lua" },
})

require("nvim-tree").setup({
	on_attach = function(bufnr)
		local api = require("nvim-tree.api")
		api.config.mappings.default_on_attach(bufnr)
		-- let flash handle 's'
		vim.keymap.set("n", "s", function()
			require("flash").jump()
		end, { buffer = bufnr, desc = "Flash" })
		-- open with system default app
		vim.keymap.set("n", "O", function()
			local node = api.tree.get_node_under_cursor()
			if node then
				vim.ui.open(node.absolute_path)
			end
		end, { buffer = bufnr, desc = "System Open" })
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
