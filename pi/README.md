# Pi

To use this configuration, create a symlink from Pi's config directory
to this directory.

By default, [Pi](https://pi.dev) looks for its configuration in `~/.pi`.

Run this command to link it:

```bash
ln -sf "$(pwd)" ~/.pi
```

## Prerequisites

- [ripgrep](https://github.com/BurntSushi/ripgrep) (`rg`) — required by the `prefer-rg` skill
- [fd](https://github.com/sharkdp/fd) — required by the `prefer-fd` skill
