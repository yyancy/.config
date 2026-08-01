# fish/

Configuration for **fish shell**. Self-contained — does not depend on `shell/`.

## Loading order

`conf.d/` files are sourced alphabetically on every interactive session:

| File | Purpose |
|------|---------|
| `conf.d/5-brew.fish` | Homebrew environment init |
| `conf.d/20-env.fish` | Environment variables, PATH, proxy detection |
| `conf.d/30-tool.fish` | Tool activations: mise, starship, zoxide |
| `conf.d/40-alias.fish` | Aliases (eza, git, nvim, lazygit, docker) |
| `conf.d/99-local.fish` | Machine-local config — gitignored, create as needed |

## Local / secret overrides

These files are gitignored:

- `conf.d/99-local.fish` — machine-specific fish config
- `~/.secrets/env.fish` — sensitive values (loaded by `20-env.fish`)

## Relationship with shell/

`fish/conf.d/20-env.fish` mirrors `shell/env.sh`.
`fish/conf.d/40-alias.fish` mirrors `shell/aliases.sh`.
The duplication is intentional to keep fish config fully independent.
When updating shared config (env vars, aliases), update both files.
