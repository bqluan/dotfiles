-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua

-- Snacks picker:
-- Make hidden files/directories appear the same as normal files in the picker
vim.api.nvim_set_hl(0, "SnacksPickerPathHidden", { link = "Text" })
