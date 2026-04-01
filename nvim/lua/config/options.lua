-- disable netrw (required before loading nvim-tree)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- leader key
vim.g.mapleader = " "

-- tab display width
vim.opt.tabstop = 2

-- global statusline (one bar at the bottom, not per-window)
vim.opt.laststatus = 3

-- hide persistent command line, only show when needed
vim.opt.cmdheight = 0
