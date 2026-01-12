return {
  {
    "stevearc/conform.nvim",
    opts = function(_, opts)
      opts.formatters.sqlfluff = {
        -- Remove the dialect argument to allow .sqlfluff config file to take precedence
        -- See https://github.com/LazyVim/LazyVim/blob/c64a61734fc9d45470a72603395c02137802bc6f/lua/lazyvim/plugins/extras/lang/sql.lua#L169
        args = { "format", "-" },
      }
    end,
  },
}
