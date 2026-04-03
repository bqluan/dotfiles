-- which-key groups
require("which-key").add({
	{ "<leader>b", group = "Buffer" },
	{ "<leader>c", group = "Code" },
	{ "<leader>f", group = "Find" },
	{ "<leader>g", group = "Git" },
})

-- general
vim.keymap.set("n", "<leader>e", "<cmd>NvimTreeToggle<cr>", { desc = "Explorer" })
vim.keymap.set({ "n", "i" }, "<D-s>", "<cmd>write<cr>", { desc = "Save file" })
vim.keymap.set("n", "<leader>qq", "<cmd>qa<cr>", { desc = "Quit all" })

-- clipboard
vim.keymap.set("v", "<leader>y", '"+y', { desc = "Copy" })
vim.keymap.set("n", "<leader>Y", '"+y$', { desc = "Copy to end of line" })
vim.keymap.set("n", "Y", "y$", { desc = "Yank to end of line" })

-- buffer
vim.keymap.set("n", "<Tab>", "<cmd>BufferLineCycleNext<cr>", { desc = "Next buffer" })
vim.keymap.set("n", "<S-Tab>", "<cmd>BufferLineCyclePrev<cr>", { desc = "Prev buffer" })
vim.keymap.set("n", "<leader>bd", "<cmd>bdelete<cr>", { desc = "Delete buffer" })
vim.keymap.set("n", "<leader>bo", "<cmd>BufferLineCloseOthers<cr>", { desc = "Close other buffers" })

-- git
vim.keymap.set("n", "<leader>gg", function()
	require("plugins.lazygit").open()
end, { desc = "Lazygit" })

-- code (lsp)
vim.api.nvim_create_autocmd("LspAttach", {
	callback = function(args)
		local opts = { buffer = args.buf }
		vim.keymap.set("n", "gd", vim.lsp.buf.definition, vim.tbl_extend("force", opts, { desc = "Goto definition" }))
		vim.keymap.set("n", "gr", vim.lsp.buf.references, vim.tbl_extend("force", opts, { desc = "References" }))
		vim.keymap.set("n", "K", vim.lsp.buf.hover, vim.tbl_extend("force", opts, { desc = "Hover" }))
		vim.keymap.set("n", "<leader>cr", vim.lsp.buf.rename, vim.tbl_extend("force", opts, { desc = "Rename" }))
		vim.keymap.set(
			"n",
			"<leader>ca",
			vim.lsp.buf.code_action,
			vim.tbl_extend("force", opts, { desc = "Code action" })
		)
		vim.keymap.set("n", "<leader>cf", function()
			require("conform").format({ bufnr = args.buf })
		end, vim.tbl_extend("force", opts, { desc = "Format" }))
	end,
})

-- find
vim.keymap.set("n", "<leader>ff", "<cmd>FzfLua files<cr>", { desc = "Find files" })
vim.keymap.set("n", "<leader>fg", "<cmd>FzfLua live_grep<cr>", { desc = "Grep" })
vim.keymap.set("n", "<leader>fb", "<cmd>FzfLua buffers<cr>", { desc = "Find buffers" })
vim.keymap.set("n", "<leader>fr", "<cmd>FzfLua oldfiles<cr>", { desc = "Recent files" })

-- flash jump
vim.keymap.set({ "n", "x", "o" }, "s", function()
	require("flash").jump()
end, { desc = "Flash" })
vim.keymap.set({ "n", "x", "o" }, "S", function()
	require("flash").treesitter()
end, { desc = "Flash treesitter" })

-- window navigation
vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Go to left window" })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Go to lower window" })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Go to upper window" })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Go to right window" })
