vim.pack.add({
	{ src = "https://github.com/akinsho/bufferline.nvim", name = "bufferline" },
})

require("bufferline").setup({
	options = {
		-- leave space for nvim-tree so the tabline only spans the right side
		offsets = {
			{
				filetype = "NvimTree",
				text = function()
					local ok, explorer = pcall(require("nvim-tree.core").get_explorer)
					if not ok or not explorer then
						return "Explorer"
					end

					local filters = explorer.filters.state
					local indicators = {}

					-- filter off = files are visible, show indicator
					if not filters.dotfiles then
						table.insert(indicators, "h")
					end
					if not filters.git_ignored then
						table.insert(indicators, "i")
					end

					if #indicators > 0 then
						return "Explorer [" .. table.concat(indicators) .. "]"
					end
					return "Explorer"
				end,
				text_align = "center",
				separator = false,
			},
		},
	},
})
