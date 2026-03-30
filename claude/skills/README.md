# Claude Configuration

Global configuration for Claude Code CLI.

## Usage

Create a symlink from Claude's config directory to this directory.

By default, Claude Code looks for global skills in `~/.claude/skills`.

Run this command to link it:

```bash
mkdir -p ~/.claude && ln -s "$(pwd)" ~/.claude/skills
```

## Available Skills

- **commit** - Generate a conventional commit message and create the commit (`/commit`)