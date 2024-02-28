-- lualine theme
require('lualine').setup {
    theme = 'iceberg_light',
}

-- Colorthem Config, change with time, tokyonight
local hour = tonumber(os.date("%H"))

-- Define daytime and nighttime hours
local dayStart, dayEnd = 6, 18 -- 6 AM to 6 PM

-- Choose color schemes
local dayTheme, nightTheme = "tokyonight-day", "tokyonight-storm"

if hour >= dayStart and hour < dayEnd then
    vim.cmd("colorscheme " .. dayTheme)
else
    vim.cmd("colorscheme " .. nightTheme)
end

-- The starting phase for Neovim, alpha
local alpha = require("alpha")
local dashboard = require("alpha.themes.startify")

dashboard.section.header.val =      {
    [[                                                                       ]],
    [[                                                                       ]],
    [[                                                                       ]],
    [[                                                                       ]],
    [[                                                                     ]],
    [[       ████ ██████           █████      ██                     ]],
    [[      ███████████             █████                             ]],
    [[      █████████ ███████████████████ ███   ███████████   ]],
    [[     █████████  ███    █████████████ █████ ██████████████   ]],
    [[    █████████ ██████████ █████████ █████ █████ ████ █████   ]],
    [[  ███████████ ███    ███ █████████ █████ █████ ████ █████  ]],
    [[ ██████  █████████████████████ ████ █████ █████ ████ ██████ ]],
    [[                                                                       ]],
    [[                                                                       ]],
    [[                                                                       ]],
}

alpha.setup(dashboard.opts)
