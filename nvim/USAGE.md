# Neovim — Usage Guide

Your config lives in `~/.config/nvim`. **Leader = `Space`** (so `<leader>x` is
written **`Space x`** below). In insert mode `jk` = Escape; `;` = command mode.

> - **All keymaps live in `lua/keymap.lua`** — one place to read/change them.
>   Plugin files under `lua/plugins/` hold only each plugin's settings.
> - Press **`Space`** and wait: [which-key](https://github.com/folke/which-key.nvim)
>   shows every mapping under it. `Space ?` lists buffer-local maps.
> - After editing config, restart Neovim. `:Lazy` manages plugins; `:Mason`
>   manages LSPs/linters/formatters/debuggers.

---

# Keymap reference

Notation: `Space x` = leader+x. `Ctrl h` = `<C-h>`. `Alt j` = `<A-j>`. Modes are
noted when not normal mode: **(v)** visual, **(o)** operator-pending, **(i)** insert.

## Basics & help
| Key | Action |
|---|---|
| `;` | Enter command mode (`:`) |
| `jk` **(i)** | Escape to normal mode |
| `Space` (wait) | which-key popup of all mappings |
| `Space ?` | Buffer-local keymaps |
| `Space km` | Search all keymaps (Telescope) |

## Files & search
| Key | Action |
|---|---|
| `Space ff` | Find files |
| `Space fg` | Live grep (search text in project) |
| `Space fb` | Open buffers |
| `Space fh` | Help tags |
| `Space of` | Recently opened files |
| `Space n` | Toggle Neotree file sidebar (float) |
| `-` | Open parent dir in **Oil** (edit filesystem as a buffer; `:w` applies renames/moves/deletes) |
| `Space ma` | Man pages · `Space sp` spelling · `Space qf` quickfix list |

## Jump / motion (Flash)
| Key | Action |
|---|---|
| `s` + label | Jump anywhere on screen |
| `S` | Treesitter node select |
| `r` **(o)** | Remote flash (operate at a distance, e.g. `yr`) |
| `R` **(o/v)** | Treesitter search |
| `Ctrl s` (in `/` search) | Toggle Flash in search |

## Windows / splits (smart-splits — also crosses into kitty windows)
| Key | Action |
|---|---|
| `Ctrl h/j/k/l` | Move to left/down/up/right split |
| `Alt h/j/k/l` | Resize split left/down/up/right |

## LSP (in code buffers with a language server)
| Key | Action |
|---|---|
| `g d` / `g D` | Go to definition / declaration |
| `g r` / `g i` / `g t` | References / implementation / type definition |
| `K` | Hover documentation |
| `Space ca` | Code action (fixes, refactors) |
| `Space rn` | Rename symbol |
| `Space td` / `ti` / `tt` / `tr` | Same as above but via Telescope list |
| `Space wa` / `wr` / `wl` | Add / remove / list workspace folder |
| `Space ch` *(C/C++)* | Switch source ↔ header (`:ClangdSwitchSourceHeader`) |
| `Space ci` *(C/C++)* | clangd symbol info (`:ClangdSymbolInfo`) |

> **Code actions are position-sensitive:** `Space ca` only offers a fix when the
> cursor is on the exact spot the LSP flagged. clangd anchors a missing-`;` error
> to the *next* token (often the following line), so jump to it with `]d` first,
> then `Space ca`. Neovim's built-in `gra` also triggers code action.

## Diagnostics
| Key | Action |
|---|---|
| `Space e` | Show full diagnostic under cursor in a float |
| `[d` / `]d` | Previous / next diagnostic |
| `Space dd` | All diagnostics (Telescope) |
| `Space dc` | Current-buffer diagnostics (Telescope) |
| `Space xx` | Diagnostics panel (Trouble) |
| `Space xX` | Buffer diagnostics (Trouble) |

> Inline messages wrap automatically at the cursor (tiny-inline-diagnostic).

## Lists & navigation (Trouble / Aerial / todo)
| Key | Action |
|---|---|
| `Space xs` | Symbols outline (Trouble) |
| `Space xl` | LSP definitions/references (Trouble) |
| `Space xL` / `xQ` | Location list / quickfix (Trouble) |
| `Space oa` | Toggle Aerial symbol-outline sidebar |
| `] t` / `[ t` | Next / previous TODO comment |
| `Space ft` | Find TODOs (Telescope) · `Space xt` TODOs in Trouble |
| `[q` / `]q` | Previous / next quickfix item |

## Format · Lint · Comment
| Key | Action |
|---|---|
| `Space gf` **(n/v)** | Format (async) |
| `Space mp` / `fa` **(n/v)** | Format file/range (sync) |
| `Space gl` / `Space ll` | Lint current file |
| `Space cc` | Toggle line comment (native `gcc` / `gc` also work) |

> Formatting also runs automatically on save (conform.nvim).

## Git
| Key | Action |
|---|---|
| `Space lg` | LazyGit (needs `lazygit` binary) |
| `Space gd` / `Space gD` | Diffview open / close |
| `Space gh` / `Space gH` | File history (current file / branch) |

> Git change signs appear in the gutter automatically (gitsigns).

## Debugging (nvim-dap) — `Space b` group
| Key | Action |
|---|---|
| `F5` | Start / continue — on a **C/C++ file this builds the file and stops at `main`** |
| `F9` | Toggle breakpoint |
| `F10` / `F11` / `F12` | Step over / into / out |
| `Space bb` / `bB` | Breakpoint / conditional breakpoint |
| `Space bc` | Continue |
| `Space bi` / `bo` / `bO` | Step into / over / out |
| `Space br` | Toggle REPL |
| `Space bl` | Run last |
| `Space bt` | Terminate |
| `Space bu` | Toggle debugger UI |
| `Space be` **(n/v)** | Evaluate expression |

> **Minimal debug flow:** open `foo.c` → `F9` on a line to set a breakpoint →
> `F5` (compiles with `gcc -g` and runs) → `F10`/`F11` to step, `Space bu` for panels.

## Run C/C++
| Key | Action |
|---|---|
| `Space rr` | Build & **run** current C/C++ file in a terminal split |

> Use this (or `:terminal ./main`) instead of `:!./main` — `:!` has no
> interactive stdin and freezes on input. In a terminal buffer, `Ctrl-\ Ctrl-n`
> returns to normal mode. To **debug** instead of run, use `F5` (nvim-dap).

## Study / systems — `Space m` group
| Key | Action |
|---|---|
| `Space mg` **(n)** | Godbolt: assembly for whole buffer |
| `Space mg` **(v)** | Godbolt: assembly for selection |
| `Space ml` | LeetCode menu (`:Leet`) |
| `Space mv` | Select Python virtualenv |

## Sessions · Undo · UI utilities — `Space o` / `Space u`
| Key | Action |
|---|---|
| `Space os` / `ol` / `od` | Restore session (cwd) / restore last / stop saving |
| `Space uu` | Toggle Undotree |
| `Space up` / `uP` | Precognition motion-hints peek / toggle |
| `Space uh` / `ud` | Hawtkeys suggestions / find duplicate maps |

## Claude Code — `Space a` group
| Key | Action |
|---|---|
| `Space ac` | Toggle Claude |
| `Space af` | Focus Claude |
| `Space ar` / `aC` | Resume / continue session |
| `Space am` | Select model |
| `Space ab` | Add current buffer to context |
| `Space as` **(v)** | Send selection to Claude |
| `Space as` (in file tree) | Add the file under cursor |
| `Space aa` / `ad` | Accept / deny proposed diff |

---

# Plugin reference

Each plugin, what it does, and its GitHub page. Keys are in the reference above.

## Core editor & UI
| Plugin | Function |
|---|---|
| [lazy.nvim](https://github.com/folke/lazy.nvim) | Plugin manager (`:Lazy`) |
| [tokyonight.nvim](https://github.com/folke/tokyonight.nvim) | Colorscheme (`tokyonight-moon`) |
| [which-key.nvim](https://github.com/folke/which-key.nvim) | Popup of available keymaps |
| [lualine.nvim](https://github.com/nvim-lualine/lualine.nvim) | Statusline |
| [noice.nvim](https://github.com/folke/noice.nvim) | Prettier cmdline / messages / popups |
| [nvim-notify](https://github.com/rcarriga/nvim-notify) | Notification popups (used by noice) |
| [indent-blankline.nvim](https://github.com/lukas-reineke/indent-blankline.nvim) | Indentation guide lines |
| [nvim-autopairs](https://github.com/windwp/nvim-autopairs) | Auto-close brackets/quotes |
| [flash.nvim](https://github.com/folke/flash.nvim) | Jump to any location by label |
| [hardtime.nvim](https://github.com/m4xshen/hardtime.nvim) | Nudges you off key-repeat spamming |
| [precognition.nvim](https://github.com/tris203/precognition.nvim) | Shows motion hints (`w`, `b`, `$`…) |
| [hawtkeys.nvim](https://github.com/tris203/hawtkeys.nvim) | Audit keymaps for clashes/ergonomics |

## Files, search & git
| Plugin | Function |
|---|---|
| [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim) | Fuzzy finder for everything |
| [telescope-file-browser.nvim](https://github.com/nvim-telescope/telescope-file-browser.nvim) | Browse/create files in Telescope |
| [telescope-ui-select.nvim](https://github.com/nvim-telescope/telescope-ui-select.nvim) | Routes selection menus (code actions etc.) through Telescope |
| [neo-tree.nvim](https://github.com/nvim-neo-tree/neo-tree.nvim) | Sidebar file tree |
| [oil.nvim](https://github.com/stevearc/oil.nvim) | Edit the filesystem as a buffer |
| [gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim) | Git change signs + inline blame |
| [diffview.nvim](https://github.com/sindrets/diffview.nvim) | Side-by-side diffs & file history |

## LSP, completion, format, lint, syntax
| Plugin | Function |
|---|---|
| [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig) | Language servers (clangd, pyright…) |
| [mason.nvim](https://github.com/williamboman/mason.nvim) | Installs LSPs/linters/formatters/DAP |
| [mason-lspconfig.nvim](https://github.com/williamboman/mason-lspconfig.nvim) | Bridges Mason ↔ lspconfig |
| [blink.cmp](https://github.com/saghen/blink.cmp) | Autocompletion (`Tab`/`Enter`/`Ctrl Space`) |
| [friendly-snippets](https://github.com/rafamadriz/friendly-snippets) | Snippet library |
| [conform.nvim](https://github.com/stevearc/conform.nvim) | Formatting (format-on-save) |
| [mason-conform.nvim](https://github.com/zapling/mason-conform.nvim) | Auto-installs formatters |
| [nvim-lint](https://github.com/mfussenegger/nvim-lint) | Linting (cpplint, flake8, mypy…) |
| [mason-nvim-lint](https://github.com/rshkarin/mason-nvim-lint) | Auto-installs linters |
| [tiny-inline-diagnostic.nvim](https://github.com/rachartier/tiny-inline-diagnostic.nvim) | Wrapped inline diagnostics at cursor |
| [trouble.nvim](https://github.com/folke/trouble.nvim) | Panel for diagnostics/refs/symbols |
| [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter) | Syntax highlighting & parsing |

## C / C++ & systems study
| Plugin | Function |
|---|---|
| [clangd_extensions.nvim](https://github.com/p00f/clangd_extensions.nvim) | Extra clangd features (`:ClangdAST`, `:ClangdMemoryUsage`) |
| [godbolt.nvim](https://github.com/p00f/godbolt.nvim) | See the assembly your code compiles to |
| [aerial.nvim](https://github.com/stevearc/aerial.nvim) | Symbol-outline sidebar |

## Debugging
| Plugin | Function |
|---|---|
| [nvim-dap](https://github.com/mfussenegger/nvim-dap) | Debug Adapter Protocol client |
| [nvim-dap-ui](https://github.com/rcarriga/nvim-dap-ui) | Debugger UI (scopes/stacks/watches) |
| [nvim-dap-virtual-text](https://github.com/theHamsta/nvim-dap-virtual-text) | Inline variable values while debugging |
| [nvim-dap-python](https://github.com/mfussenegger/nvim-dap-python) | Python debugging (debugpy) |
| [mason-nvim-dap.nvim](https://github.com/jay-babu/mason-nvim-dap.nvim) | Installs codelldb / debugpy |
| [nvim-nio](https://github.com/nvim-neotest/nvim-nio) | Async lib (dap-ui dependency) |

## Python · Algorithms · Workflow
| Plugin | Function |
|---|---|
| [venv-selector.nvim](https://github.com/linux-cultist/venv-selector.nvim) | Pick a virtualenv for LSP/debug (needs `fd`) |
| [leetcode.nvim](https://github.com/kawre/leetcode.nvim) | Solve LeetCode in-editor (C++ default) |
| [smart-splits.nvim](https://github.com/mrjones2014/smart-splits.nvim) | Move/resize across nvim splits + kitty |
| [persistence.nvim](https://github.com/folke/persistence.nvim) | Save/restore sessions per project |
| [undotree](https://github.com/mbbill/undotree) | Browse undo history as a tree |
| [todo-comments.nvim](https://github.com/folke/todo-comments.nvim) | Highlight/jump TODO/FIXME/NOTE |

## AI
| Plugin | Function |
|---|---|
| [claudecode.nvim](https://github.com/coder/claudecode.nvim) | Claude Code inside Neovim |
| [snacks.nvim](https://github.com/folke/snacks.nvim) | Utility library (powers `Space lg` lazygit) |

---

# System-side installs (Arch)
| For | Command |
|---|---|
| `Space lg` lazygit | `sudo pacman -S lazygit` |
| kitty ↔ nvim navigation | already in `~/.config/kitty/kitty.conf` — **fully restart kitty** |
| C/C++ debugging | `codelldb` auto-installed by Mason; `gcc`/`gdb` already present |

# which-key `Space` groups
`f` find/format · `g` git/go · `c` code · `d` diagnostics · `t` telescope(LSP) ·
`b` debug · `x` trouble · `o` open/session · `m` misc (godbolt/leetcode/venv) ·
`u` ui/utilities · `a` Claude · `w` workspace · `l` lint/lazygit · `r` rename ·
`n` neotree · `k` keymaps · `q` quickfix · `s` spelling
