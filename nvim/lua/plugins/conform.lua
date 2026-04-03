vim.pack.add({
	{ src = "https://github.com/stevearc/conform.nvim" },
})

require("conform").setup({
	formatters_by_ft = {
		go = { "gofmt" },
		lua = { "stylua" },
	},
})
