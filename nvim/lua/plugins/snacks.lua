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
            layout = {
              preview = false,
              layout = {
                backdrop = false,
                width = 40,
                min_width = 40,
                height = 0,
                position = "left",
                border = "none",
                box = "vertical",
                { win = "input", title = "{live} {flags}", height = 1, border = true },
                { win = "list", border = "none" },
                { win = "preview", title = "{preview}", height = 0.4, border = "top" },
              },
            },
          },
        },
        toggles = {
          hidden = {
            enabled = false,
          },
        },
      },
    },
    keys = {
      {
        "<leader>fe",
        function()
          Snacks.explorer()
        end,
        desc = "Explorer Snacks (cwd)",
      },
      {
        "<leader>fE",
        function()
          Snacks.explorer({ cwd = LazyVim.root() })
        end,
        desc = "Explorer Snacks (root dir)",
      },
      { "<leader>e", "<leader>fe", desc = "Explorer Snacks (cwd)", remap = true },
      { "<leader>E", "<leader>fE", desc = "Explorer Snacks (root dir)", remap = true },
      { "<leader>ff", LazyVim.pick("files", { root = false }), desc = "Find Files (cwd)" },
      { "<leader>fF", LazyVim.pick("files"), desc = "Find Files (root dir)" },
      { "<leader><space>", LazyVim.pick("files", { root = false }), desc = "Find Files (cwd)" },
      { "<leader>/", LazyVim.pick("grep", { root = false }), desc = "Grep (cwd)" },
    },
  },
}
