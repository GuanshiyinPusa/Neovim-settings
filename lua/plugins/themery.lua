return {
    "zaldih/themery.nvim",
    config = function()
        require("themery").setup({
            themes = {
                "tokyonight-day",
                "tokyonight-moon",
                "tokyonight-night",
                "tokyonight-storm",
                "kanagawa-dragon",
                "kanagawa-lotus",
                "kanagawa-wave",
                "catppuccin-latte",
                "catppuccin-frappe",
                "catppuccin-macchiato",
                "catppuccin-mocha",
                "material",
                "material-darker",
                "material-deep-ocean",
                "material-lighter",
                "material-oceanic",
                "material-palenight",
                "nightfox",
                "dayfox",
                "dawnfox",
                "duskfox",
                "nordfox",
                "terafox",
                "carbonfox",
                "nightfly",
                "rose-pine",
                "rose-pine-dawn",
                "rose-pine-main",
                "rose-pine-moon",
            },                                       -- Your list of installed colorschemes
            themeConfigFile = "~/.config/nvim/lua/theme.lua", -- Described below
            livePreview = true,                      -- Apply theme while browsing. Default to true.
        })
    end,
}
