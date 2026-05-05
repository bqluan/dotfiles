---
name: commit
description: Generate a conventional commit message and create the commit
---

# Commit Workflow

Generate a commit message following [conventional commits](https://www.conventionalcommits.org/en/v1.0.0/#specification) and create the commit.

**Commit Message:**

- Use format: `type(scope): description` (e.g., `feat(core): add user authentication`)
  - Scope is optional but recommended when changes are focused on a specific area
- Keep the message concise (one line preferred)
  - If changes span multiple distinct areas, use a one-line title followed by a list of the key changes only
- Use English by default; Chinese is acceptable for specific domain terms
- Do NOT add "Co-Authored-By" line

**Steps:**

1. Check git remote info and current status (including diff and recent commit history)
   - If branch is behind remote: STOP and warn user to handle manually (pull/rebase first)
   - For untracked directories, check both files and symlinks
2. Stage relevant files
3. Generate commit message using the format specified above
4. Commit
5. Ask user if they want to push, and push if so
