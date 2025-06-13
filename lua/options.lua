-- Clipboard and Completion Menu
vim.opt.clipboard = "unnamedplus" -- Use system clipboard for copy/paste
vim.opt.completeopt = {
    "menu", -- Show the popup menu when multiple completions are available
    "menuone", -- Automatically select the first completion item when it's the only one
    "noselect", -- Do not automatically select an item from the menu, allow manual selection
    "noinsert", -- Do not automatically insert the selected completion, allow manual insertion
    "preview", -- Show preview of the selected completion in a separate popup
}

-- Mouse and Tab Settings
vim.opt.mouse = "a" -- Enable mouse support
vim.opt.tabstop = 4 -- Number of visual spaces per TAB
vim.opt.softtabstop = 4 -- Number of spaces in tab when editing
vim.opt.shiftwidth = 4 -- Insert 4 spaces on a tab
vim.opt.expandtab = true -- Use spaces instead of tabs, mainly for Python

-- User Interface Configuration
vim.opt.number = true -- Show absolute line numbers
vim.opt.relativenumber = true -- Add numbers to each line on the left side
vim.opt.cursorline = true -- Highlight cursor line underneath the cursor horizontally
vim.opt.splitbelow = true -- Open new vertical splits at the bottom
vim.opt.splitright = true -- Open new horizontal splits on the right
vim.opt.termguicolors = true -- Enable 24-bit RGB color in the TUI
vim.opt.showmode = true -- Show mode in status line

-- Searching and Highlighting
vim.opt.incsearch = true -- Search as characters are entered
vim.opt.hlsearch = true -- Highlight matches
vim.opt.ignorecase = true -- Ignore case in searches by default
vim.opt.smartcase = true -- Use case-sensitive search if uppercase is entered

-- Basic and Visual Options
vim.opt.colorcolumn = "80" -- Highlight column 80
vim.opt.textwidth = 80 -- Automatically break lines at 80 characters
vim.opt.wrap = true -- Disable line wrapping
vim.opt.linebreak = true -- Don't break words on wrap
vim.opt.showbreak = "↪ " -- Symbol to show when a line is wrapped
vim.opt.cindent = true -- Enable C-specific indentation
vim.opt.smartindent = true -- Enable smart auto-indentation
vim.opt.autoindent = true -- Enable automatic indentation
vim.opt.syntax = "on" -- Enable syntax highlighting
vim.opt.showmatch = true -- Show matching parentheses/braces

-- Folding
vim.opt.foldenable = false -- Enable code folding
vim.opt.foldmethod = "indent" -- Folding method based on indentation

-- Spell Checking
vim.opt.spell = false -- Disable spell checking
vim.opt.spelllang = "en_us" -- Set the default spell checking language
vim.o.showmatch = true -- Highlighting matching brackets
