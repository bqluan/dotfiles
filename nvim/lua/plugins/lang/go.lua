vim.lsp.config("gopls", {
	cmd = { "gopls" },
	filetypes = { "go" },
	root_markers = { "go.mod", "go.work", ".git" },
})
vim.lsp.enable("gopls")
