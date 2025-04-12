require("nvchad.options")

-- add yours here!

local o = vim.o

-- Clipboard and Completion Menu
-- o.clipboard = "unnamedplus"

-- Mouse and Tab Settings
o.mouse = "a"
o.tabstop = 4
o.softtabstop = 4
o.shiftwidth = 4
o.expandtab = true

-- User Interface Configuration
o.number = true
o.relativenumber = true
o.cursorline = true
o.splitbelow = true
o.splitright = true
o.termguicolors = true
o.showmode = true

-- Searching and Highlighting
o.incsearch = true
o.hlsearch = true
o.ignorecase = true
o.smartcase = true

-- Basic and Visual Options
o.colorcolumn = "80"
o.wrap = true
o.linebreak = true
o.showbreak = "↪ "
o.cindent = true
o.smartindent = true
o.autoindent = true
o.syntax = "on"
o.showmatch = true

-- Folding
o.foldenable = false
o.foldmethod = "indent"

-- Spell Checking
o.spell = false
o.spelllang = "en_us"
