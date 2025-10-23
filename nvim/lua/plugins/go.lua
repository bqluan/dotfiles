return {
  {
    "mfussenegger/nvim-lint",
    opts = {
      linters_by_ft = {
        -- Disable golangci-lint
        -- See https://github.com/LazyVim/LazyVim/blob/b6e48a57fb4ad7a79f24646016926eef68ce3002/lua/lazyvim/plugins/extras/lang/go.lua#L112
        go = {},
      },
    },
  },
}
