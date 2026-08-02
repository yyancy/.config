# fish/

Configuration for **fish shell**. Self-contained — does not depend on `shell/`.

## Loading order

`conf.d/` files are sourced alphabetically on every interactive session:

| File | Purpose |
|------|---------|
| `conf.d/05-brew.fish` | Homebrew environment init |
| `conf.d/20-env.fish` | Environment variables, PATH, proxy detection |
| `conf.d/30-tool.fish` | Tool activations: mise, starship, zoxide, atuin |
| `conf.d/40-alias.fish` | Aliases (eza, git, nvim, lazygit, docker) |
| `conf.d/50-functions.fish` | Helper functions (mkc, hp, o, vv, typeof, cpr/mvr, fif) |
| `conf.d/99-local.fish` | Machine-local config — gitignored, create as needed |

Autoloaded functions live in `functions/` (one function per file), e.g. `functions/yy.fish`.

## Local / secret overrides

These files are gitignored:

- `conf.d/99-local.fish` — machine-specific fish config
- `~/.secrets/env.fish` — sensitive values (loaded by `20-env.fish`)

## Relationship with shell/

`fish/conf.d/20-env.fish` mirrors `shell/core/env.sh`.
`fish/conf.d/40-alias.fish` mirrors `shell/core/aliases.sh`.
`fish/conf.d/50-functions.fish` mirrors `shell/zsh/helper.zsh`.
The duplication is intentional to keep fish config fully independent.
When updating shared config (env vars, aliases, functions), update both sides.
