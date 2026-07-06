#!/bin/bash
# =============================================================================
# Neovim 0.12 Setup — Remaining Steps
# =============================================================================
# You've already:
#   ✓ Backed up ~/.config/nvim
#   ✓ Created ~/.config/nvim-new with empty files
#
# This script handles the rest.
# =============================================================================

set -e

echo "=== Neovim 0.12 Setup (remaining steps) ==="
echo ""

# ── Step 1: Add shell aliases ───────────────────────────────────────────
SHELL_RC=""
if [ -f "$HOME/.zshrc" ]; then
    SHELL_RC="$HOME/.zshrc"
elif [ -f "$HOME/.bashrc" ]; then
    SHELL_RC="$HOME/.bashrc"
fi

if [ -n "$SHELL_RC" ]; then
    # Check if aliases already exist
    if ! grep -q "NVIM_APPNAME=nvim-new" "$SHELL_RC" 2>/dev/null; then
        echo "" >>"$SHELL_RC"
        echo "# Neovim configs — vv for 0.12 (new), v for lazy (old)" >>"$SHELL_RC"
        echo "alias vv='NVIM_APPNAME=nvim-new nvim'" >>"$SHELL_RC"
        echo "alias v='nvim'" >>"$SHELL_RC"
        echo "Added aliases to $SHELL_RC"
        echo "  vv  → nvim-new (0.12 + vim.pack)"
        echo "  v   → nvim     (old lazy config)"
    else
        echo "Aliases already exist in $SHELL_RC"
    fi
else
    echo "Could not find .zshrc or .bashrc. Add these manually:"
    echo "  alias vv='NVIM_APPNAME=nvim-new nvim'"
    echo "  alias v='nvim'"
fi

echo ""

# ── Step 2: Reload shell config ────────────────────────────────────────
echo "Run this now to load the aliases:"
echo ""
echo "  source $SHELL_RC"
echo ""

# ── Step 3: First launch instructions ──────────────────────────────────
cat <<'EOF'
=== After copying config files into ~/.config/nvim-new ===

1. Run: vv
   → vim.pack will prompt to install missing plugins
   → Press 'A' to install All

2. Run :restart

3. Run :TSUpdate
   → Installs treesitter parsers for your languages

4. Install LSP servers:
   :MasonInstall lua-language-server clangd pyright stylua black

5. Verify everything:
   :checkhealth vim.lsp
   :checkhealth vim.treesitter

=== Useful commands to remember ===
  :lsp status              → see active LSP clients
  :lsp log                 → LSP log (replaces :LspLog)
  vim.pack.update({})      → update plugins (:write to confirm)
  :restart                 → restart nvim without quitting
  :Undotree                → built-in undo tree
  :DiffTool dir1 dir2      → built-in directory diff
  g<                       → view message history (replaces noice)

=== When ready to make nvim-new your default ===
  mv ~/.config/nvim ~/.config/nvim-lazy    # rename old config
  mv ~/.config/nvim-new ~/.config/nvim     # promote new config
  # Then update aliases:
  #   alias v='nvim'       (now points to 0.12 config)
  #   remove vv alias

  # Clean old lazy.nvim data:
  rm -rf ~/.local/share/nvim/lazy
  rm -rf ~/.local/state/nvim/lazy
EOF
