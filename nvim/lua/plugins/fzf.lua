vim.pack.add({
	{ src = "https://github.com/ibhagwan/fzf-lua" },
})

require("fzf-lua").setup({
	winopts = {
		row = 0.5,
		col = 0.5,
		height = 0.85,
		width = 0.85,
		preview = {
			horizontal = "right:50%",
		},
	},
})
