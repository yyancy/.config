# shell/

Zsh configuration. `core/` holds the modules whose *content* is shell-agnostic
(env vars, aliases) as opposed to zsh machinery; they are not drop-in
bash-sourceable — `core/env.sh` needs `pathprepend` from `zsh/helper.zsh`,
which uses zsh's `${(P)}` expansion, and `core/aliases.sh` uses `alias -s`.

Entry chain: `zsh/zprofile` → `zsh/.zshrc` → **`shell/config.zsh`** → modules below.

Fish does **not** read anything here — see `fish/README.md`.

## Layout

```
shell/
├── config.zsh        # Entry point — sources everything in order
├── core/             # Shell-agnostic *content* (env vars, aliases, colors)
│   ├── env.sh        # Environment variables, PATH, proxy detection
│   ├── aliases.sh    # Aliases (eza, git, nvim, ...)
│   └── color.sh      # ANSI color variable exports
└── zsh/              # Zsh-only
    ├── plugins.zsh       # Zim framework init + plugin config
    ├── helper.zsh        # Functions (has, pathprepend, mkc, yy, typeof, ...)
    ├── clipboard.zsh     # Cross-platform clipboard (pbcopy / wl-copy / clip.exe)
    ├── fzf.zsh           # FZF options and the fzf/ autoload dir
    ├── keybindings.zsh   # ZLE word-movement bindings
    ├── tools.zsh         # External tool init (mise, zoxide, atuin, hstr, cargo)
    ├── completions.zsh   # fzf-tab styling
    └── fzf/              # Autoloaded FZF helpers (fp, fps, kp, ks)
```

## Load order

`config.zsh` sources modules in a deliberate order:

1. `zsh/plugins.zsh` — Zim init first, so plugin widgets exist for later modules.
2. `core/color.sh` — color vars used by later modules.
3. `zsh/helper.zsh` — defines `has` and `pathprepend`, required by the next three.
4. `core/env.sh` — needs `pathprepend`.
5. `core/aliases.sh` — needs `has` for conditional aliases.
6. `zsh/clipboard.zsh`, `zsh/fzf.zsh`, `zsh/keybindings.zsh`
7. `zsh/tools.zsh` — needs `has`; `atuin` intentionally rebinds Ctrl-R after `hstr`.
8. `zsh/completions.zsh` — needs the fzf-tab plugin already loaded.

Changing this order can break things: moving `helper.zsh` later leaves `has`
and `pathprepend` undefined, which silently drops aliases and PATH entries.

## Where to add things

| Adding | File | Also update for fish |
|--------|------|----------------------|
| Environment variable | `core/env.sh` | `fish/conf.d/20-env.fish` |
| Alias | `core/aliases.sh` | `fish/conf.d/40-alias.fish` |
| Function | `zsh/helper.zsh` | `fish/conf.d/50-functions.fish` |
| Tool init (`eval "$(x init)"`) | `zsh/tools.zsh` | `fish/conf.d/30-tool.fish` |
| Keybinding | `zsh/keybindings.zsh` | n/a (fish differs) |
| Zsh plugin | `zsh/.zimrc` | n/a |

Zsh and fish are kept separate on purpose — no forced sharing. The tradeoff is
that shared concepts must be edited in two places; the table above lists the
counterpart for each.

## Local / secret overrides

Loaded at the end of `config.zsh`, so they win over everything above.
All are gitignored or live outside the repo:

- `shell/local.zsh` — machine-specific zsh config
- `shell/env.local.sh` — machine-specific env vars
- `~/.secrets/env.sh` — sensitive values (API tokens, etc.)
- `zsh/zshrc.local` — loaded separately at the end of `.zshrc`

## Troubleshooting

**Alias or PATH entry missing.** Usually `has` or `pathprepend` was undefined
when the module ran. Check that `zsh/helper.zsh` still loads before
`core/env.sh` and `core/aliases.sh` in `config.zsh`.

**`command not found: has`.** A module was sourced directly instead of through
`config.zsh`. Source `config.zsh`, or define `has` first.

**Ctrl-R opens the wrong tool.** `zsh/tools.zsh` binds `hstr` first and lets
`atuin init` override it. Reorder that file to change which one wins.

**Completion warning about `compinit`.** `skip_global_compinit=1` in
`zsh/zprofile` suppresses Debian's `/etc/zsh/zshrc` calling `compinit` early.
It only applies to login shells, so `zsh -i` (non-login) still shows it.

**Time the startup.** `time zsh -i -c exit`, or bisect by commenting out
`source` lines in `config.zsh`.

**Check what a module changed.** Compare before/after with
`zsh -i -c 'alias | sort'`, `zsh -i -c 'typeset -f + | sort'`, or
`zsh -i -c 'env | sort'`.
