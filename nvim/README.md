# Neovim Configuration

A minimal Neovim configuration built on **Neovim >= 0.12** using the built-in `vim.pack` package manager. No third-party plugin managers required.

## Requirements

- Neovim >= 0.12
- [fzf](https://github.com/junegunn/fzf) (for fzf-lua)
- [lazygit](https://github.com/jesseduffield/lazygit) (for git integration)
- Language servers as needed:
  - `lua-language-server` (Lua)
  - `gopls` (Go)

## Keymaps

Leader key: `Space`

## Adding a New Plugin

Create a `lua/plugins/<name>.lua` file:

```lua
vim.pack.add({
  { src = "https://github.com/owner/repo", name = "plugin-name" },
})

require("plugin-name").setup({})
```

It will be auto-loaded on startup.

## Adding a New Language

Create a `lua/plugins/lang/<lang>.lua` file:

```lua
vim.lsp.config("server_name", {
  cmd = { "server-binary" },
  filetypes = { "lang" },
  root_markers = { "marker-file" },
})
vim.lsp.enable("server_name")
```

Also add the language to `supportedLanguages` in `lua/plugins/treesitter.lua` for syntax highlighting.
