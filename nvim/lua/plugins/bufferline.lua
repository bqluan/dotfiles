vim.pack.add({
	{ src = "https://github.com/akinsho/bufferline.nvim", name = "bufferline" },
})

-- Load Catppuccin before Bufferline reads its highlights, regardless of plugin
-- load order.
require("plugins.colorscheme")

require("bufferline").setup({
	highlights = require("catppuccin.special.bufferline").get_theme(),
	options = {
		indicator = { style = "none" },
		-- Leave space for nvim-tree so the tabline only spans the right side.
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

					-- Mark disabled filters to show which files are visible.
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
