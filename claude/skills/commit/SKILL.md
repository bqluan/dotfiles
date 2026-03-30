---
name: commit
description: Generate a conventional commit message and create the commit
user_invocable: true
---

# Commit Workflow

Generate a commit message following [conventional commits](https://www.conventionalcommits.org/en/v1.0.0/#specification) and create the commit.

**Commit Message:**

- Use format: `type(scope): description` (e.g., `feat(core): add user authentication`)
  - Scope is optional but recommended when changes are focused on a specific area
- Keep the message concise (one line preferred)
  - If changes span multiple distinct areas, use a one-line title followed by a list explaining each change
- Use English by default; Chinese is acceptable for specific domain terms
- Do NOT add "Co-Authored-By" line

**Steps:**

1. Run `git fetch` to update remote info
2. Run `git status`, `git diff`, and `git log --oneline -5` to see changes and recent commit style
   - If `git status` shows "your branch is behind": STOP and warn user to handle manually (pull/rebase first)
   - For untracked directories shown by git status, check both files and symlinks
3. Stage relevant files with `git add`
4. Generate commit message using the format specified above
5. Run `git commit` with the message
6. After successful commit, ask user if they want to push:
   - Use AskUserQuestion tool with options: "Yes, push now" / "No"
   - If user selects "Yes", run `git push`
