-- Make hidden files/directories appear the same as normal files in the picker
vim.api.nvim_set_hl(0, "SnacksPickerPathHidden", { link = "Text" })

return {
  {
    "folke/snacks.nvim",
    opts = {
      picker = {
        live = true,
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
