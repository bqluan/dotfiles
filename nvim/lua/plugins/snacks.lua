-- 🍿snacks.nvim
-- https://github.com/folke/snacks.nvim

-- Make hidden files/directories appear the same as normal files in the picker
vim.api.nvim_set_hl(0, "SnacksPickerPathHidden", { link = "Text" })

return {
  {
    "folke/snacks.nvim",
    opts = {
      picker = {
        sources = {
          files = {
            hidden = true,
          },
          explorer = {
            hidden = true,
          },
        },
        toggles = {
          hidden = {
            enabled = false,
          },
        },
      },
    },
  },
}
