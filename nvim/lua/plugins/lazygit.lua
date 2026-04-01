-- lazygit in a floating terminal
local M = {}

function M.open()
	if vim.fn.executable("lazygit") ~= 1 then
		vim.notify("lazygit not found", vim.log.levels.ERROR)
		return
	end

	local width = math.floor(vim.o.columns * 0.9)
	local height = math.floor(vim.o.lines * 0.9)
	local col = math.floor((vim.o.columns - width) / 2)
	local row = math.floor((vim.o.lines - height) / 2)

	local buf = vim.api.nvim_create_buf(false, true)
	vim.api.nvim_open_win(buf, true, {
		relative = "editor",
		width = width,
		height = height,
		col = col,
		row = row,
		style = "minimal",
		border = "none",
	})

	vim.fn.termopen("lazygit", {
		on_exit = function()
			vim.api.nvim_buf_delete(buf, { force = true })
		end,
	})
	vim.cmd("startinsert")
end

return M
