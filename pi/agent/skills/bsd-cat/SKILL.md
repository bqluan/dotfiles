---
name: bsd-cat
description: The system runs BSD cat (macOS). GNU-only flags like -A/-T/-E are unavailable; use BSD-compatible equivalents (-et for tab+line-end visibility).
---

# BSD cat

This machine runs **BSD cat** (macOS), not GNU coreutils. The option sets differ.

## BSD cat supports only

`-b -e -l -n -s -t -u -v`

In particular `-e` and `-t` **imply `-v`**, so `-et` already shows all non-printing characters (tabs as `^I`, line ends as `$`).

## Do NOT use (GNU-only)

`-A` (=`-vET`), `-T`, `-E` — these fail with `cat: illegal option`.

## Cheat sheet (GNU → BSD)

| Goal                                              | GNU  | BSD (this machine) |
| ------------------------------------------------- | ---- | ------------------ |
| Show everything (tabs + line ends + non-printing) | `-A` | `-et`              |
| Tabs as `^I`                                      | `-T` | `-t`               |
| Line ends as `$`                                  | `-E` | `-e`               |
| Non-printing chars                                | `-v` | `-v`               |
| Number lines                                      | `-n` | `-n`               |
| Number non-blank lines                            | `-b` | `-b`               |
| Squeeze blank lines                               | `-s` | `-s`               |

## Note

This is an environment fact, not a tool preference. Use `cat` normally for viewing
content; just reach for BSD-compatible flags when inspecting whitespace/indentation.
