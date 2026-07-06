return {
    -- {
    --     "oxfist/night-owl.nvim",
    --     lazy = false, -- make sure we load this during startup if it is your main colorscheme
    --     priority = 1000, -- make sure to load this before all the other start plugins
    -- },
    {
        "folke/tokyonight.nvim",
        lazy = false,
        priority = 1000,
        opts = {},
    },
    -- {
    --     "catppuccin/nvim",
    --     name = "catppuccin",
    --     lazy = false,
    --     priority = 1000,
    --     opts = {},
    -- },
    -- {
    --     "rebelot/kanagawa.nvim",
    --     lazy = false,
    --     priority = 1000,
    --     opts = {},
    -- },
    -- {
    --     "EdenEast/nightfox.nvim",
    --     lazy = false, -- load at startup so the foxes exist
    --     priority = 1000, -- as early as possible
    -- },
    -- {
    --     "rose-pine/neovim",
    --     name = "rose-pine",
    --     lazy = false,
    --     priority = 1000,
    -- },
    -- {
    --   "zaldih/themery.nvim",
    --   lazy = false,
    --   config = function()
    --     require("themery").setup {
    --       -- add the config here
    --       themes = {
    --         "night-owl",
    --         "tokyonight",
    --         "tokyonight-night",
    --         "tokyonight-storm",
    --         "tokyonight-day",
    --         "tokyonight-moon",
    --         "catppuccin",
    --         "catppuccin-macchiato",
    --         "catppuccin-frappe",
    --         "catppuccin-latte",
    --         "catppuccin-mocha",
    --         "kanagawa",
    --         "kanagawa-dragon",
    --         "kanagawa-lotus",
    --         "kanagawa-wave",
    --         "nightfox",
    --         "dayfox",
    --         "dawnfox",
    --         "duskfox",
    --         "nordfox",
    --         "terafox",
    --         "carbonfox",
    --       }, -- Your list of installed colorschemes.
    --       livePreview = true, -- Apply theme while picking. Default to true.
    --     }
    --   end,
    -- },
}
