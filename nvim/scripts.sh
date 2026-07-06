#!/bin/bash

# Neovim Cache Cleanup Script
# Aggressive cache cleaning to fix Mason and plugin issues

set -e

echo "🧹 Neovim Cache Cleanup"
echo "======================="

# Check if nvim config directory exists
NVIM_CONFIG="$HOME/.config/nvim"
if [ ! -d "$NVIM_CONFIG" ]; then
    echo "❌ Neovim config directory not found at $NVIM_CONFIG"
    exit 1
fi

echo "📂 Found Neovim config at: $NVIM_CONFIG"

# Clean all Neovim caches aggressively
echo "🧹 Cleaning all Neovim caches..."

# Clean Lazy.nvim plugin cache
LAZY_DIR="$HOME/.local/share/nvim/lazy"
if [ -d "$LAZY_DIR" ]; then
    echo "🗑️  Cleaning Lazy.nvim plugin cache"
    rm -rf "$LAZY_DIR"
    echo "✅ Cleaned Lazy.nvim cache"
fi

# Clean Mason completely (fixes most Mason issues)
MASON_DIR="$HOME/.local/share/nvim/mason"
if [ -d "$MASON_DIR" ]; then
    echo "🔨 Cleaning Mason directory completely"
    rm -rf "$MASON_DIR"
    echo "✅ Cleaned Mason directory"
fi

# Clean LSP cache
LSP_DIR="$HOME/.local/share/nvim/lsp_servers"
if [ -d "$LSP_DIR" ]; then
    echo "🗑️  Cleaning LSP servers cache"
    rm -rf "$LSP_DIR"
    echo "✅ Cleaned LSP cache"
fi

# Clean swap files
SWAP_DIR="$HOME/.local/state/nvim/swap"
if [ -d "$SWAP_DIR" ]; then
    echo "🗑️  Cleaning swap files"
    rm -rf "$SWAP_DIR"/*
    echo "✅ Cleaned swap files"
fi

# Clean shada/viminfo
SHADA_FILE="$HOME/.local/state/nvim/shada/main.shada"
if [ -f "$SHADA_FILE" ]; then
    echo "🗑️  Cleaning shada file"
    rm "$SHADA_FILE"
    echo "✅ Cleaned shada file"
fi

# Clean undo files
UNDO_DIR="$HOME/.local/state/nvim/undo"
if [ -d "$UNDO_DIR" ]; then
    echo "🗑️  Cleaning undo files"
    rm -rf "$UNDO_DIR"/*
    echo "✅ Cleaned undo files"
fi

# Clean log files
LOG_FILE="$HOME/.local/state/nvim/log"
if [ -f "$LOG_FILE" ]; then
    echo "🗑️  Cleaning log file"
    rm "$LOG_FILE"
    echo "✅ Cleaned log file"
fi

# Clean any leftover lock files
LOCK_FILES="$HOME/.local/share/nvim/*.lock"
if ls $LOCK_FILES 1>/dev/null 2>&1; then
    echo "🗑️  Cleaning lock files"
    rm -f $LOCK_FILES
    echo "✅ Cleaned lock files"
fi

echo ""
echo "🎉 Aggressive cache cleanup completed!"
echo ""
echo "📋 Next steps:"
echo "1. Start Neovim - everything will be reinstalled fresh"
echo "2. Run :Mason to reinstall language servers and tools"
echo "3. Run :checkhealth to verify everything works"
echo ""
echo "💡 If Mason still has issues, run this script again"
echo "Happy coding! 🎯"

