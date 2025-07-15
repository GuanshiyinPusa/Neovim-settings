-- Load options early
require "options"

-- Bootstrap lazy.nvim with modern approach
local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    local lazyrepo = "https://github.com/folke/lazy.nvim.git"
    local out = vim.fn.system {
        "git",
        "clone",
        "--filter=blob:none",
        "--branch=stable",
        lazyrepo,
        lazypath,
    }
    if vim.v.shell_error ~= 0 then
        vim.api.nvim_echo({
            { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
            { out, "WarningMsg" },
            { "\nPress any key to exit..." },
        }, true, {})
        vim.fn.getchar()
        os.exit(1)
    end
end
vim.opt.rtp:prepend(lazypath)

-- Setup lazy.nvim with your plugins directory
require("lazy").setup {
    spec = {
        -- Import all plugins from your plugins directory
        { import = "plugins" },
    },
    checker = {
        enabled = true,
        notify = true,
    },
    change_detection = {
        enabled = true,
        notify = true,
    },
}

-- Load keymaps after lazy setup
require "keymap"

-- Set colorscheme
vim.cmd.colorscheme "tokyonight-moon"
