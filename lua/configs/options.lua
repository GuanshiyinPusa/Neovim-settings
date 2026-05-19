-- =============================================================================
-- Built-in Neovim 0.12 Features (replaces plugins)
-- =============================================================================

-- Opt-in plugins that ship with Neovim 0.12
vim.cmd("packadd nvim.undotree") -- :Undotree  → visual undo-tree navigator
vim.cmd("packadd nvim.difftool") -- :DiffTool  → compare dirs/files

-- ui2: replaces noice.nvim — kills "Press ENTER" forever
-- Messages appear briefly instead of blocking. Use g< for full history.
require("vim._core.ui2").enable {
    enable = true,
    msg = {
        targets = "cmd",
        cmd = { height = 0.5 },
        msg = { height = 0.5, timeout = 4000 },
        pager = { height = 0.5 },
    },
}

-- Built-in autocomplete (replaces blink.cmp)
-- Navigate: Ctrl-N / Ctrl-P or Arrow keys  |  Accept: Ctrl-Y  |  Dismiss: Ctrl-E
-- Enabled per-buffer in lsp.lua via vim.lsp.completion.enable()
vim.opt.completeopt = {
    "menu", -- Show the popup menu when multiple completions are available
    "menuone", -- Show menu even for a single match
    "noselect", -- Do not automatically select an item
    "popup", -- Use popup window for extra info (replaces preview)
}
vim.o.pumborder = "rounded" -- Rounded border on completion popup
vim.o.pummaxwidth = 40 -- Max width of completion popup

-- =============================================================================
-- Clipboard and Mouse
-- =============================================================================
vim.opt.clipboard = "unnamedplus" -- Use system clipboard for copy/paste
vim.opt.mouse = "a" -- Enable mouse support

-- =============================================================================
-- Tab and Indentation
-- =============================================================================
vim.opt.tabstop = 4 -- Number of visual spaces per TAB
vim.opt.softtabstop = 4 -- Number of spaces in tab when editing
vim.opt.shiftwidth = 4 -- Insert 4 spaces on a tab
vim.opt.expandtab = true -- Use spaces instead of tabs
vim.opt.cindent = true -- Enable C-specific indentation
vim.opt.smartindent = true -- Enable smart auto-indentation
vim.opt.autoindent = true -- Enable automatic indentation

-- =============================================================================
-- User Interface
-- =============================================================================
vim.opt.number = true -- Show absolute line numbers
vim.opt.relativenumber = true -- Relative line numbers
vim.opt.cursorline = true -- Highlight cursor line
vim.opt.splitbelow = true -- Open new vertical splits at the bottom
vim.opt.splitright = true -- Open new horizontal splits on the right
vim.opt.termguicolors = true -- Enable 24-bit RGB color in the TUI
vim.opt.showmode = false -- ui2 and statusline already show mode
vim.o.statusline = "%{%v:lua.require('configs.statusline').build()%}"
vim.opt.signcolumn = "yes" -- Always show sign column
vim.opt.scrolloff = 8 -- Keep 8 lines above/below cursor
vim.opt.sidescrolloff = 8 -- Keep 8 columns left/right of cursor

-- =============================================================================
-- Searching and Highlighting
-- =============================================================================
vim.opt.incsearch = true -- Search as characters are entered
vim.opt.hlsearch = true -- Highlight matches
vim.opt.ignorecase = true -- Ignore case in searches by default
vim.opt.smartcase = true -- Use case-sensitive search if uppercase is entered

-- =============================================================================
-- Visual and Text Options
-- =============================================================================
vim.opt.colorcolumn = "80" -- Highlight column 80
vim.opt.textwidth = 80 -- Automatically break lines at 80 characters
vim.opt.wrap = true -- Enable line wrapping
vim.opt.linebreak = true -- Don't break words on wrap
vim.opt.showbreak = "↪ " -- Symbol to show when a line is wrapped
vim.opt.showmatch = true -- Show matching parentheses/braces

-- =============================================================================
-- Folding
-- =============================================================================
vim.opt.foldenable = false -- Start with folds open
vim.opt.foldmethod = "indent" -- Folding method based on indentation

-- =============================================================================
-- Spell Checking
-- =============================================================================
vim.opt.spell = false -- Disable spell checking
vim.opt.spelllang = "en_us" -- Default spell checking language

-- =============================================================================
-- Files and Undo
-- =============================================================================
vim.opt.undofile = true -- Persistent undo across sessions
vim.opt.swapfile = false -- No swap files
vim.opt.backup = false -- No backup files
vim.o.updatetime = 300 -- Faster CursorHold (gitsigns, lsp highlight)
vim.o.timeoutlen = 400 -- Which-key popup delay

-- =============================================================================
-- Grep (use ripgrep if available)
-- =============================================================================
if vim.fn.executable "rg" == 1 then
    vim.o.grepprg = "rg --vimgrep --smart-case"
    vim.o.grepformat = "%f:%l:%c:%m"
end
