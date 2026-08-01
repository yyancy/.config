# shell/

Configuration for **bash and zsh**. Sourced by `profile.zsh`, which is loaded from `zsh/.zshrc`.

## Files

| File | Compatible | Purpose |
|------|-----------|---------|
| `profile.zsh` | zsh | Entry point — sources all modules below in order |
| `env.sh` | POSIX | Environment variables, PATH setup, proxy detection |
| `aliases.sh` | POSIX + zsh suffix aliases | Aliases (eza, git, nvim, etc.) |
| `color.sh` | POSIX | ANSI color variable exports |
| `helper.zsh` | zsh | Utility functions (pathprepend, has, mkc, yy, etc.) |
| `plugins.zsh` | zsh | Zim framework init + plugin loading |
| `fzf.zsh` | zsh | FZF configuration and key bindings |
| `keys.zsh` | zsh | ZLE word-movement key bindings |
| `clipboard.zsh` | zsh | Cross-platform clipboard (pbcopy / wl-copy / clip.exe) |
| `bashmarks.sh` | POSIX | Directory bookmarks |
| `fzf/` | — | FZF helper scripts (fp, fps, kp, ks) |

## Local / secret overrides

These files are gitignored and loaded at the end of `profile.zsh`:

- `shell/env.local.sh` — machine-specific env vars
- `~/.secrets/env.sh` — sensitive values (API tokens, etc.)
- `zsh/zshrc.local` — machine-specific zsh config

## Relationship with fish/

`shell/aliases.sh` and `fish/conf.d/40-alias.fish` define the same aliases in their respective syntaxes.
`shell/env.sh` and `fish/conf.d/20-env.fish` set the same environment variables.
This duplication is intentional — fish config is fully self-contained and does not source from shell/.
