-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Formatting
vim.keymap.set({ "n", "i", "v" }, "<D-f>", function()
  LazyVim.format({ force = true })
end, { desc = "Format" })

-- Save file
vim.keymap.set({ "n", "i", "v" }, "<D-s>", "<cmd>w<cr><esc>", { desc = "Save File" })

-- lazygit
if vim.fn.executable("lazygit") == 1 then
  vim.keymap.set({ "n", "i", "v" }, "<D-g>", function()
    Snacks.lazygit({ cwd = LazyVim.root.git() })
  end, { desc = "Lazygit (Root Dir)" })
end
