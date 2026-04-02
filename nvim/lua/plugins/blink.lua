vim.pack.add({
	{ src = "https://github.com/Saghen/blink.cmp" },
})

require("blink.cmp").setup({
	completion = {
		documentation = {
			-- show documentation window when selecting a completion item
			auto_show = true,
		},
	},
	signature = {
		-- show function signature help while typing
		enabled = true,
	},
})
