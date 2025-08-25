return {
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin",
    },
  },

  -- Remove after https://github.com/LazyVim/LazyVim/pull/6354 is merged
  {
    "catppuccin",
    init = function()
      local bufferline = require("catppuccin.groups.integrations.bufferline")
      bufferline.get = bufferline.get_theme
    end,
  },
}
