# Neovim Settings

Minimal plugin setup for C, C++, and Python development.  
Auto-completion is powered by **Blink** — I used to use `nvim-cmp`, but trends change, and honestly, I enjoy Blink's terminal-style suggestions.

## Plugins & Tools

- **Blink** — for auto-completion (inspired by terminal completion).
- **Telescope** — for fuzzy finding.  
  Why not `fzy-lua`? I don’t work on huge projects (currently unemployed — yeah), so Telescope is more than enough.

## FAQ

**Why isn't the leader key set to Space?**  
I prefer seeing actual space characters in the WhichKey menu instead of the word “leader”.

**Why not something else?**  
This setup hits the sweet spot for me: minimal but practical. There are leaner setups out there, but hey — it’s 2025. This works for me.

**LSP folders?**  
Sure, I could set them up manually, but Mason now auto-enables installed LSP servers — so I let it handle that with defaults. Works great.

## Branches

- `nvchad` — Meh. Tried it.
- `lazyvim` — Barely touched the configs.
- `old-work` — My pre-Neovim 0.11 setup.

Some old commits feature **alpha.nvim** (another dashboard plugin). I liked it, but I built this config for work — not for aesthetic vimporn.

---

Happy coding. FK HUAWEI BTW!
