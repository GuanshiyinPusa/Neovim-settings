return {
    "goolord/alpha-nvim",
    dependencies = {
        "nvim-tree/nvim-web-devicons",
    },

    config = function()
        local alpha = require("alpha")
        local dashboard = require("alpha.themes.startify")

        local ascii_art_list = {
            {
                [[                                                                                 ]],
                [[                                                                                  ]],
                [[                                                                                  ]],
                [[                                                                                  ]],
                [[                                                                                ]],
                [[                  ████ ██████           █████      ██                     ]],
                [[                 ███████████             █████                             ]],
                [[                 █████████ ███████████████████ ███   ███████████   ]],
                [[                █████████  ███    █████████████ █████ ██████████████   ]],
                [[               █████████ ██████████ █████████ █████ █████ ████ █████   ]],
                [[             ███████████ ███    ███ █████████ █████ █████ ████ █████  ]],
                [[            ██████  █████████████████████ ████ █████ █████ ████ ██████ ]],
                [[                                                                                  ]],
                [[                                                                                  ]],
                [[                                                                                  ]],
            },
            {
                [[          =================     ===============     ===============   ========  ========]],
                [[          \\ . . . . . . .\\   //. . . . . . .\\   //. . . . . . .\\  \\. . .\\// . . //]],
                [[          ||. . ._____. . .|| ||. . ._____. . .|| ||. . ._____. . .|| || . . .\/ . . .||]],
                [[          || . .||   ||. . || || . .||   ||. . || || . .||   ||. . || ||. . . . . . . ||]],
                [[          ||. . ||   || . .|| ||. . ||   || . .|| ||. . ||   || . .|| || . | . . . . .||]],
                [[          || . .||   ||. _-|| ||-_ .||   ||. . || || . .||   ||. _-|| ||-_.|\ . . . . ||]],
                [[          ||. . ||   ||-'  || ||  `-||   || . .|| ||. . ||   ||-'  || ||  `|\_ . .|. .||]],
                [[          || . _||   ||    || ||    ||   ||_ . || || . _||   ||    || ||   |\ `-_/| . ||]],
                [[          ||_-' ||  .|/    || ||    \|.  || `-_|| ||_-' ||  .|/    || ||   | \  / |-_.||]],
                [[          ||    ||_-'      || ||      `-_||    || ||    ||_-'      || ||   | \  / |  `||]],
                [[          ||    `'         || ||         `'    || ||    `'         || ||   | \  / |   ||]],
                [[          ||            .===' `===.         .==='.`===.         .===' /==. |  \/  |   ||]],
                [[          ||         .=='   \_|-_ `===. .==='   _|_   `===. .===' _-|/   `==  \/  |   ||]],
                [[          ||      .=='    _-'    `-_  `='    _-'   `-_    `='  _-'   `-_  /|  \/  |   ||]],
                [[          ||   .=='    _-'          '-__\._-'         '-_./__-'         `' |. /|  |   ||]],
                [[          ||.=='    _-'                                                     `' |  /==.||]],
                [[          =='    _-'                        N E O V I M                         \/   `==]],
                [[          \   _-'                                                                `-_   /]],
                [[           `''                                                                      ``' ]],
            },
            {
                [[           ⠄⠄⣴⣶⣤⡤⠦⣤⣀⣤⠆⠄⠄⠄⠄⠄⣈⣭⣭⣿⣶⣿⣦⣼⣆⠄⠄⠄⠄⠄⠄⠄⠄]],
                [[           ⠄⠄⠄⠉⠻⢿⣿⠿⣿⣿⣶⣦⠤⠄⡠⢾⣿⣿⡿⠋⠉⠉⠻⣿⣿⡛⣦⠄⠄⠄⠄⠄⠄]],
                [[           ⠄⠄⠄⠄⠄⠈⠄⠄⠄⠈⢿⣿⣟⠦⠄⣾⣿⣿⣷⠄⠄⠄⠄⠻⠿⢿⣿⣧⣄⠄⠄⠄⠄]],
                [[           ⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⣸⣿⣿⢧⠄⢻⠻⣿⣿⣷⣄⣀⠄⠢⣀⡀⠈⠙⠿⠄⠄⠄⠄]],
                [[           ⠄⠄⢀⠄⠄⠄⠄⠄⠄⢠⣿⣿⣿⠈⠄⠄⠡⠌⣻⣿⣿⣿⣿⣿⣿⣿⣛⣳⣤⣀⣀⠄⠄]],
                [[           ⠄⠄⢠⣧⣶⣥⡤⢄⠄⣸⣿⣿⠘⠄⠄⢀⣴⣿⣿⡿⠛⣿⣿⣧⠈⢿⠿⠟⠛⠻⠿⠄⠄]],
                [[           ⠄⣰⣿⣿⠛⠻⣿⣿⡦⢹⣿⣷⠄⠄⠄⢊⣿⣿⡏⠄⠄⢸⣿⣿⡇⠄⢀⣠⣄⣾⠄⠄⠄]],
                [[           ⣠⣿⠿⠛⠄⢀⣿⣿⣷⠘⢿⣿⣦⡀⠄⢸⢿⣿⣿⣄⠄⣸⣿⣿⡇⣪⣿⡿⠿⣿⣷⡄⠄]],
                [[           ⠙⠃⠄⠄⠄⣼⣿⡟⠌⠄⠈⠻⣿⣿⣦⣌⡇⠻⣿⣿⣷⣿⣿⣿⠐⣿⣿⡇⠄⠛⠻⢷⣄]],
                [[           ⠄⠄⠄⠄⠄⢻⣿⣿⣄⠄⠄⠄⠈⠻⣿⣿⣿⣷⣿⣿⣿⣿⣿⡟⠄⠫⢿⣿⡆⠄⠄⠄⠁]],
                [[           ⠄⠄⠄⠄⠄⠄⠻⣿⣿⣿⣿⣶⣶⣾⣿⣿⣿⣿⣿⣿⣿⣿⡟⢀⣀⣤⣾⡿⠃⠄⠄⠄⠄]],
                [[           ⠄⠄⠄⠄⢰⣶⠄⠄⣶⠄⢶⣆⢀⣶⠂⣶⡶⠶⣦⡄⢰⣶⠶⢶⣦⠄⠄⣴⣶⠄⠄⠄⠄]],
                [[           ⠄⠄⠄⠄⢸⣿⠶⠶⣿⠄⠈⢻⣿⠁⠄⣿⡇⠄⢸⣿⢸⣿⢶⣾⠏⠄⣸⣟⣹⣧⠄⠄⠄]],
                [[           ⠄⠄⠄⠄⠸⠿⠄⠄⠿⠄⠄⠸⠿⠄⠄⠿⠷⠶⠿⠃⠸⠿⠄⠙⠷⠤⠿⠉⠉⠿⠆⠄⠄]],
            },
            {
                [[`-._     `-.     `.   \      :      /   .'     .-'     _.-'      ]],
                [[._     `-._    `-.    `.  `.    :    .'  .'    .-'    _.-'     _ ]],
                [[  `--._    `-._   `-.   `.  \   :   /  .'   .-'   _.-'    _.--   ]],
                [[__     `--._   `-._  `-.  `. `. : .' .'  .-'  _.-'   _.--'     __]],
                [[  `--.__    `--._  `-.  `-. `. \:/ .' .-'  .-'  _.--'    __.--'  ]],
                [[-..__   `--.__   `--.  _\|      __     |/_  .--'   __.--'   __..-]],
                [[__   `--..__  `--._  _-  \_   _/"->   _/  -_  _.--'  __..--'   __]],
                [[  ``--..__  `--..__  -_    `-'7   F`-'    _-  __..--'  __..--''  ]],
                [[__        ``--..__ `- `=.__.=-(  ,)-=.__.=' -' __..--''        __]],
                [[  ```---...___    ``--..    ')) ()()'    ..--''    ___...---'''  ]],
                [[----....._____```---...    '( (' )) )'    ...---'''_____.....----]],
                [[                 """""""""` . _    _ .`"""""""""                 ]],
            },
            {
                "⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿",
                "⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡏⣿⣿⢳⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⢧⣿⡿⣸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿",
                "⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠁⣿⡏⠸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠸⣿⡇⢹⣿⣿⣿⣿⣿⣿⣿⣿⢻⢿⣿⡿⣿⣿⡇⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿",
                "⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠀⠸⣇⠀⠹⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣯⠀⢻⡇⠈⢿⣿⣿⣿⣿⣿⣿⣿⣬⣬⣾⠃⣿⣿⠀⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿",
                "⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣇⠀⠹⣆⠀⢹⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡄⠀⢻⡄⠈⢿⣿⣿⣿⣿⣿⣿⡇⣿⣿⠀⢿⣿⡀⠈⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿",
                "⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣆⠀⢹⡆⠀⢻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡀⠈⢷⡀⠈⢿⣿⣿⣿⣿⣿⠀⣿⣿⡀⠈⢿⣷⡀⠘⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿",
                "⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⣛⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣘⣉⣸⣿⣿⡄⠀⢿⡄⠀⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⢻⢛⣿⣿⣷⡀⠈⣷⡀⠘⣿⣿⣿⣿⣿⠀⠘⣿⣷⡀⠈⢿⣷⠀⠘⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿",
                "⣿⣿⣿⣿⣿⣿⣿⣿⡏⣾⡿⠛⠛⠿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡀⠘⣷⡀⢸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠿⣫⣭⣽⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣶⣶⣿⣿⣿⣧⠀⢹⣧⠀⢹⣿⣿⣿⣿⣧⠀⠘⣿⣷⡀⠈⢿⣧⠀⢸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⢻⣿⣿⣿⣿",
                "⣿⣿⣿⣿⣿⣿⣿⣿⣧⠙⢀⣤⣤⡀⢹⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡟⢿⣿⣿⣿⣧⠀⣿⣇⠀⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡏⡾⠟⠋⠙⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠿⢿⣿⣿⣿⡆⠈⣿⡆⢸⣿⣿⣿⠿⣿⣧⠀⠹⣿⣷⠀⠘⣿⡆⠀⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡇⠸⣿⣿⣿⣿",
                "⣿⣿⣿⣿⣿⣿⣿⣿⡏⢀⠀⠈⠉⠀⢸⣿⣿⡿⠟⢿⣿⣿⣿⣿⡿⠛⠉⠉⠉⠛⠛⠿⢿⣿⣿⣿⣿⣿⠀⠀⠙⣿⣿⣿⠀⣿⣿⠰⢿⣿⣿⣿⡏⢻⣿⣿⣿⣿⣿⡿⠀⠠⣴⣦⡀⠈⣿⣿⣿⠿⠛⠉⠉⠛⠛⠻⠿⣿⣿⣿⣿⣿⡏⠀⠀⢻⣿⣿⣷⠀⣿⡇⣸⣿⡟⠁⡀⣸⣿⣇⠀⢻⣿⣇⠀⢻⣿⠀⡙⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠿⠿⠿⠿⣷⡀⢻⣿⣿⣿",
                "⣿⣿⡟⠙⠿⠿⠿⠟⠁⣾⣿⣷⡆⠘⠛⠛⠉⢀⣀⢠⣿⣿⣿⢋⣠⣤⣤⣤⣤⣄⡀⠀⠀⠈⠉⠙⠛⠛⠳⢄⠀⠻⠿⠛⠁⢟⡅⣾⣆⣿⣿⣿⣅⠀⠻⠿⣿⠿⠋⣰⣄⠀⠀⠉⠁⣰⣿⡟⢁⣠⣤⣤⣤⣤⣀⡀⠀⠀⠈⠉⠛⠛⠛⠷⡀⠀⠿⠿⠋⢰⣿⢧⣿⠏⣠⣾⡇⣿⣿⣿⡄⠈⢿⣿⠀⢸⣿⠀⣿⢸⠟⠉⠙⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠿⠛⠋⠁⠀⢀⣀⣀⡀⢹⣧⠀⢿⣿⣿",
                "⣿⣿⣿⣦⣄⣀⣀⣠⣼⣿⣿⣿⣧⣄⣠⣴⠾⣿⣇⠘⠿⣿⣿⣿⡿⠿⠿⠟⠛⠋⠁⠀⣀⣀⣀⣠⣀⣀⣰⡿⠀⣤⣤⣴⢣⢟⣾⡿⠋⠙⠻⣿⣿⡄⢀⣀⣀⣠⣴⣿⣿⣿⣶⡆⠰⢿⣿⣴⣿⣿⠿⠿⠟⠛⠋⠁⠀⣀⣀⣀⣀⣀⣀⣼⡟⢠⣤⣤⣶⣿⢫⣿⠏⣰⣿⣿⡀⣿⣿⣿⣷⠀⡀⠀⢀⣾⡿⣼⡟⠀⢠⣤⡀⠈⠻⣿⣿⣿⣿⣿⣿⣿⠿⠟⠋⠉⠀⣀⣠⣴⣶⣿⣿⣿⣿⣿⢸⣿⠆⣾⣿⣿",
                "⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣄⠀⣠⣿⣄⠀⠀⠀⠀⠀⠀⢀⣀⣠⣴⣾⣿⣿⣿⣿⣿⣿⡿⠋⢀⣼⣿⣿⡏⣡⣾⣿⣿⣦⣤⣾⣿⡿⢃⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⡀⠀⠀⠀⠀⠀⠀⢀⣀⣤⣴⣾⣿⣿⣿⣿⣿⣿⠿⠋⢠⣾⣿⣿⣿⣱⠟⢃⣴⣿⣿⣿⣇⠈⠉⠉⠁⢠⣿⣿⣿⠟⣽⠟⢰⡀⠀⠈⠁⢠⣄⡀⠉⠉⠉⠉⠁⠀⣀⣠⣤⣶⣿⣿⣿⣿⣿⡋⠀⢙⣿⠏⠈⢁⣴⣿⣿⣿",
                "⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡋⠀⠉⣻⣿⣿⣿⣿⣿⣿⣿⣷⣽⣻⠿⢿⣿⣿⠿⠟⠋⠁⣀⣴⣿⣿⣿⣿⡇⠹⣿⣿⣿⣿⡿⠟⠋⢀⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣮⣟⡿⠿⣿⣿⣿⠿⠟⠋⠁⣠⣴⣿⣿⣿⣿⣿⣶⣾⣿⣿⣿⣿⣿⣿⣷⣶⣶⡘⠿⠿⠿⠏⠞⢁⣠⣿⣿⣷⣶⣤⣾⣿⣿⣿⣶⣶⣶⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣶⣿⣿⣦⣶⣿⣿⣿⣿⣿",
                "⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣶⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣶⣦⣤⣀⣤⣶⣾⣿⣿⣿⣿⣿⣿⣷⡀⠀⠈⠁⠀⠀⣠⣴⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⣶⣤⣀⣀⣤⣶⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣶⣶⣶⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿",
                "⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⣶⣶⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿",
                "⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿",
            },
            {
                "                                                                                  ",
                "                                                                                  ",
                "                      *((##*                                                      ",
                "                  /###%%#%&&&%,                           .%((//(/.              ",
                "                  #%%&&&&@@@@@@@*                        #%#&%@&%%##%%            ",
                "                 &&&@@@@@@@@@@@@@   .**(/(,*,/,*,       &@@@@@@@@@&&%%%*          ",
                "                 @@@@@@@@@@&@*                         %@@@@@@@@@@@@&&&&          ",
                "                  @@@@%/,               ,                 /@&%@@@@@@@&&&*         ",
                "                   &@,                 .                      /%@@@@@@@&.         ",
                "                .(..                  ,                         *#@@@@@#          ",
                "              .(                                                 .@@@@*           ",
                "              #                                                    (              ",
                "             ,             *%@%             .@@@@&*                 ,             ",
                "          *            /@@@@@@&            @@@@@@@@&                .*           ",
                "          ,            @@@@@@@@,   ...  .   .@@@@@@@@@                 /          ",
                "          /           @@@@@@/                  *&@@@@@&                           ",
                "         /           ,@&@@@.    %@@@@@@@@@,     .#@@@&&                 ,         ",
                "         #            (%%%/    *@@@@@@@@@%*      *&%#(*                 /         ",
                "         *        .     .           /                   , .,.                     ",
                "          .                /                     *                      *         ",
                "          *                #.    ./%,%/.      ,%                       /..        ",
                "          .,                                                        ,,*  *        ",
                "            %*                                 (%%#%%(,          *&*..    ,       ",
                "           ,/**#@%,**         ........ ...    #&&&@&&&%%%&(,#@@@@@&##%(%%#,,.     ",
                "          .%@@@@@@@@@@@@@@@@@@@@@@@&@@@@@@@@@(@@@@@@&&@@%&%%&&&#@@@@@@@@&&&%(,    ",
                "          (%@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@.@@@@@@@@@@@@@@@&&%&@%&@@@@@@@@@%#,   ",
                "        *&@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@/@@@@@@@@@@@@@@@@@@@@&%&&*&@@@@@@&&#.  ",
                "        &@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@/@@@@@@@@@@@@@@@@@@@@@&@@@&&(@@@@@@&%* ",
                "      .#@@@@@@@@@@@@@@@@@@@@@@@@@@@&@@@%@@@(@@@@@@@@@@@@@@@@@@@@@@@@@&@@@@##@@@@#.",
                "      /@@@@@@@@@@@%%&%@&##%&#%/(@(&#%%###%&%@/@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@&/",
                "     @@@@@@@@@@%((/((**,.,,,,*,,.,*.*.,*,,,,.. @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@/",
                "    .@@@@@@@@@/.*   .                           @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@(",
            },
            {
                [[                                                                                                                   ]],
                [[                                                                                                                   ]],
                [[                                                                                                                   ]],
                [[                                                                                                                   ]],
                [[                                                                                                                   ]],
                [[                                                                                                                   ]],
                [[                                                                                                                   ]],
                [[                                                                                                                   ]],
                [[                                                                                                                   ]],
                [[                                                                                                                   ]],
                [[                                                                                                                   ]],
                [[                                                                                                                   ]],
                [[                                                                                                                   ]],
                [[                                                                                                                   ]],
                [[                                                                                                                   ]],
                [[                                                                                                                   ]],
                [[                                                                                                                   ]],
                [[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⣠⣤⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
                [[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣠⣶⡶⣶⣶⣤⣀⣤⣤⣤⣤⡴⡶⢶⢶⣚⢿⣩⢳⡍⣿⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
                [[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣾⣿⣾⣿⣷⣻⡝⣿⣿⣿⣿⣻⢷⡹⣏⢷⡹⣎⢷⣣⣟⡆⢷⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
                [[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⣾⣿⣗⡿⣿⠿⣷⣹⣳⡟⣧⢿⣏⢷⡻⣜⢏⠷⣙⡞⣻⣿⣿⡀⢟⠄⠀⠀⠀Fuck those idiots.⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
                [[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⣿⣿⣿⣷⢮⣿⣛⣾⣿⣳⢿⡽⣾⣹⢞⡷⢍⢎⡱⢣⣜⡱⣊⠷⣌⠃⠨⣿⡆⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣤⣄⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
                [[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣰⣿⣿⣿⣿⣿⣾⣿⣿⣿⣳⢯⣳⢏⣷⡯⠿⢞⣺⣒⣷⣋⡜⢧⢎⣕⠚⡠⣸⣿⣿⠆⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠐⡂⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣰⣿⡿⣾⡷⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
                [[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣸⣿⡿⣟⣿⣿⣿⣿⢿⣟⡷⢯⡻⠼⣯⣷⣦⣿⣿⣿⣿⣿⣷⣌⣎⢣⣜⣧⡔⢻⣿⣿⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⠀⠠⡏⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⣾⣿⣻⡽⢛⣴⠇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
                [[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣰⣿⣿⡹⢯⣷⢯⡟⣞⣯⢾⡹⢣⠍⡘⠉⠈⠙⠿⣿⣿⣿⣿⠟⣿⣿⣿⣿⣶⣿⣷⣟⣿⡆⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠺⣦⡀⣧⣄⣀⣀⣀⡀⠀⠀⠀⢠⣾⡿⣯⡿⣟⣶⡾⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
                [[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣤⣾⣿⣟⡾⣟⣧⢻⣾⢽⣺⡼⢣⢣⠁⠄⠀⠀⠀⠀⠀⠞⠯⠟⠁⠂⠸⢿⡿⣿⣿⣿⣿⣿⣾⣧⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⢠⡀⠀⠀⠈⠻⣷⡈⠉⠩⠉⠄⠀⢀⣼⣿⢯⣷⢟⣽⡿⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
                [[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⣶⡿⣟⣯⣟⡾⣟⣿⣞⡿⣞⣯⣷⢻⣍⠦⢩⠐⡀⠀⠀⠀⠀⠀⠀⠀⠀⠈⣥⢻⢍⠻⣹⢾⣽⣿⣿⣿⣿⣦⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠊⠳⣄⠀⠀⠀⠈⠛⠃⠀⠀⢀⣴⣿⣿⡟⣟⣵⡿⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
                [[⠀⠀⠀⠀⠀⠀⠀⠀⢀⣤⣾⢿⣹⢟⣯⢷⢯⢿⡽⣾⣟⣿⣽⡶⣯⡟⣼⢫⢆⠳⣀⠐⠀⠀⠠⠄⠀⣀⣴⡀⢞⣮⢦⢃⡜⢋⡿⣿⣿⣿⣿⣿⣧⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠚⢷⡶⠶⢤⣬⣷⣄⡀⠀⠀⠀⢀⣴⣿⣿⢏⣟⣿⡿⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
                [[⠀⠀⠀⠀⠀⠀⠀⣠⣾⣿⣛⣾⣹⡞⣽⣚⢿⣺⣽⣳⢿⣻⣿⣟⡷⣿⢯⣟⣮⢻⡡⣙⠀⠀⡗⢀⣿⢭⣿⣷⡾⢟⡂⢏⢣⢳⢿⣿⣿⣿⣿⣿⣿⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠹⢦⡀⠀⠈⠉⠀⠀⠀⣠⣾⣿⣛⣞⣯⡿⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
                [[⠀⠀⠀⠀⠀⠀⣾⣿⣿⣿⣿⣼⣳⢽⣣⢯⢷⣣⢯⡝⣯⠿⣽⢿⣻⣽⣯⣟⣾⣳⢿⡬⣍⠂⢅⡎⢿⣿⣿⣿⣿⣷⡿⣼⣏⣧⣋⣿⣿⣿⣿⣿⡿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⢠⣾⠛⠳⢦⡀⠀⠀⠈⠛⠁⠠⠂⠀⣠⣾⣿⢟⣧⣿⡿⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
                [[⠀⠀⠀⠀⢀⣸⣿⣿⣿⣿⣿⣿⣭⣷⡹⢎⢷⣊⠶⡹⢎⢻⡹⢞⣳⢛⢾⡹⣞⠽⣎⠳⠆⠂⠀⠘⠣⢞⡽⢻⠿⣿⣿⣿⣿⣾⣿⠿⠛⠛⠉⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⢸⡌⠀⠀⠈⢻⡄⠀⠀⠀⠀⠀⢀⣶⣿⡿⢮⣿⠿⠋⠀⠀⠀⠀⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
                [[⠀⠀⠀⠀⣾⣿⣿⣿⣿⣾⢿⣻⣿⣿⣿⣝⣎⠧⡓⢭⡘⠤⡑⢊⠔⠩⠆⠱⢌⠛⡌⠓⡌⠀⠀⠀⠀⠀⠈⠣⢟⡶⡹⢜⡩⣿⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣀⡀⠀⠀⠀⠙⢶⣤⣤⠞⠀⠀⠀⠀⢀⣴⣿⡟⣵⣟⣯⣿⣶⣶⣶⣶⣾⣿⣿⣷⣤⣀⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
                [[⠀⠀⠀⣰⣿⢧⡿⣿⣿⣿⣿⣟⣿⣽⣻⢿⡾⣯⡝⢦⡘⢤⠉⠄⠠⢀⠐⠀⠂⠀⠀⠁⠀⠀⠀⠀⠀⠀⠀⠀⠁⠐⠓⠈⠑⣗⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢄⣠⡿⠉⢹⣗⣀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣤⣾⢟⣧⣟⣻⣾⣿⣻⣯⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣦⣄⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
                [[⠀⠀⢠⣿⣿⢯⡿⣽⢿⣿⣿⣿⣿⢾⣯⡻⣵⢣⡛⢦⡙⢦⠙⡢⢑⠢⠄⠠⠀⠄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡧⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⢷⣴⠟⠉⢹⡏⠀⠀⠀⠀⠀⢀⣴⡿⣋⣿⣾⢻⡴⣫⣟⣾⣷⣯⣿⣿⣾⣷⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣆⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
                [[⠀⢀⣿⣿⣿⡿⣾⣽⣻⢿⣿⣿⣿⣿⣳⢿⣽⡖⡩⢆⠈⢂⠱⠀⢃⠐⠈⠁⠈⠀⠂⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠠⠀⢷⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⢷⣦⡿⠁⠀⠀⠀⠀⢰⣿⢫⣵⣿⡿⣼⣳⣿⣿⣿⢟⠻⠍⠀⢻⣞⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
                [[⢀⣾⣿⣿⣿⣟⣷⣻⣞⡿⣿⣿⣿⣷⣿⣻⣾⣿⡱⣀⠈⠀⠀⠈⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢰⡄⠆⡄⠀⣻⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠁⠀⠀⠀⠀⠀⣰⡟⣧⢿⣽⣷⣿⣿⣿⣿⠿⡍⠄⠂⠀⠀⠢⢝⣾⣻⣿⣿⣿⣿⣿⣿⣿⣿⣻⣽⣿⣿⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
                [[⢸⣿⣿⣿⣿⣿⣿⡷⣯⣟⣿⣻⣿⣽⣾⣟⡾⣽⣻⣶⣌⠄⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⠀⠀⠀⢀⠁⡄⡠⢀⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⡾⣿⣼⣿⣿⣿⣿⣿⡿⣟⢯⡟⣘⢦⠡⡀⠀⠐⡈⢶⢻⡷⣟⣿⣾⣟⣿⣯⣿⢿⣟⣿⣿⣧⡀⠀⠀⠀⠀⠀⠀⠀⠀]],
                [[⢸⣿⣿⣿⣿⣿⣿⣽⡿⣽⣳⣟⣿⣯⣷⣿⣻⣗⣯⣿⣻⡴⢐⡀⠀⠀⠀⠀⠀⠀⡀⠠⠀⠀⠀⡠⠀⠀⠀⢠⠦⢏⠠⢑⢠⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⣼⣟⣳⣿⣿⣿⣿⣿⣟⢯⡽⣹⢮⡽⣽⣎⠇⡔⠀⢂⠱⢌⡳⣽⣻⣞⡷⣿⣯⣷⡿⣿⣻⣿⢿⣿⣧⡀⠀⠀⠀⠀⠀⠀⠀]],
                [[⢸⣿⣯⣿⣿⣿⣾⣟⡿⣷⣟⣾⢯⣿⣿⣿⢷⣻⣾⣳⣿⣹⣧⡜⢧⣌⢀⠃⠌⡐⢀⠂⠌⠐⠀⠁⢀⠄⠚⢀⠂⠄⠂⣌⠸⣇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣴⣿⣿⣽⣿⣿⣿⣿⣿⣳⢏⡾⣱⢯⣷⣿⣿⣏⠖⠀⠈⡀⢊⠲⣹⢖⡿⣞⣿⣟⣾⣯⣿⣟⣯⣿⣿⣿⣿⣿⣀⠀⠀⠀⠀⠀⠀]],
                [[⠸⣿⣿⣷⣿⣷⣿⣯⣿⡷⣯⣿⣻⣽⣿⣿⣿⢯⣟⡷⣯⢷⡻⣞⣧⢞⣦⡉⢂⠐⠠⠈⢄⠂⡔⡈⢤⠈⠄⠁⠀⠀⠡⠀⢃⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣴⣿⣿⠏⣽⣿⣿⣿⣿⣿⣧⣛⢮⡳⢯⣿⣿⣿⡿⢎⠄⠀⠠⠐⡈⡕⣣⢏⡿⣽⢿⣾⣿⣽⣷⣿⣻⣿⣯⣿⣿⣿⣿⡆⠀⠀⠀⠀⠀]],
                [[⠀⢻⣿⣿⣿⣿⣯⣿⣿⣿⣟⣷⣿⣽⣿⣿⣿⣿⣿⡿⣽⣫⠷⣯⢷⡋⡔⣳⠀⣦⠇⡱⢈⢆⣗⣫⣶⣯⠑⠀⠀⠐⠀⠁⣸⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣰⣿⣿⠟⠁⠀⣿⣿⣿⣿⣿⣿⢶⣫⣞⣽⣿⣿⣿⣿⡻⢌⠀⠀⠀⠡⡒⢥⣋⠾⣽⢯⣿⣯⣿⣿⣾⣿⡿⣿⣽⣷⣿⣻⣿⣿⣆⡀⠀⠀⠀]],
                [[⠀⠀⢻⣿⣷⣟⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣳⣏⢿⡜⣧⢓⠰⣀⣾⢯⠲⣭⢷⡺⣼⣿⣿⣟⣦⠀⠀⠀⠀⠁⠰⡿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⣾⣿⡟⠁⠀⠀⠀⢻⣿⣿⣿⣿⣿⣿⣶⣿⣿⣿⣿⣿⢿⡑⢂⠀⠀⠈⡐⢡⢓⡼⣻⣭⣟⣷⡿⣯⣷⣿⣿⣿⣿⣿⣯⣿⢿⣽⡿⣿⡄⠀⠀⠀]],
                [[⠀⠀⠀⠘⠿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣳⡽⣎⡜⡳⢌⠂⣼⣿⢎⡱⡎⣖⣻⣿⣿⣿⣿⣿⢸⠀⠀⡆⠀⠂⣷⣘⡳⢶⡤⢤⣄⣀⡀⠀⠀⠀⠀⠀⠀⣠⣾⣿⡿⠁⠀⠀⠀⠀⠀⠈⠛⠿⠿⠿⢿⣿⣿⣿⣿⡟⡿⡜⠣⠘⠀⠀⢈⠀⢌⡱⢎⡵⣳⣻⢾⣽⣿⣿⣿⣿⣿⣿⡿⣷⡿⣯⣿⣯⣿⢿⣿⠀⠀⠀]],
                [[⠀⠀⠀⠀⠀⠙⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣻⣟⡾⣱⢎⠵⣹⠀⢼⡗⢪⠱⢹⠹⠿⣿⣿⣿⣿⣿⢿⡀⠀⢄⡀⢄⣸⠷⠯⣷⣽⣧⣶⣤⣘⣍⡑⣲⡄⢀⣾⣿⡿⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⡿⣽⡞⣝⠒⠩⠄⠂⠁⡀⠂⢌⢢⣙⢮⣳⢯⣿⣿⣟⣿⣾⣿⣿⣿⢿⣿⡿⣽⢯⣷⣻⡾⣿⣿⡀⠀⠀]],
                [[⠀⠀⠀⠀⠀⠀⠀⠉⠻⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣻⣿⣝⢮⣒⠹⡀⠋⢌⠐⠡⢂⡙⠒⢡⠘⡽⣿⣻⣿⣵⡠⣸⡇⠀⢼⡀⠀⠀⠀⠀⠉⠉⠛⠟⠓⢻⣿⣿⡿⠃⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣾⡟⡰⠙⡄⢉⠐⡐⡀⢂⠡⣉⠤⣓⢮⣳⢯⣿⣿⣿⣿⣿⣿⣿⣿⢿⡿⣯⣿⢯⣿⢾⣽⣟⣿⣿⣷⠀⠀]],
                [[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⠛⠿⣿⣿⣿⣿⣿⣿⣷⣿⣯⣿⢾⣃⡓⠤⢉⠀⠈⠀⠀⠀⠀⠁⠌⠐⢣⢿⣽⣾⣳⡏⢠⠱⠘⣷⣄⡀⠀⠀⠀⠀⠀⣀⣴⣿⡿⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⢆⠭⢡⠐⡈⡐⢠⠐⣡⠲⣌⠶⣭⢿⣻⣿⣿⣯⣿⣟⣿⣿⣟⣿⡿⣟⣿⡽⣟⣾⣟⣾⣽⣷⣿⣿⡄⠀]],
                [[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⠙⠻⢿⣿⣿⣻⣿⣿⣫⠷⣉⠖⠡⣾⣄⣄⣰⣂⣤⠅⠀⠀⢀⠠⠿⠿⠗⠻⣽⡂⢂⡐⡏⢿⢷⡶⣶⢦⣴⣿⣿⣋⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⡈⢎⢂⠡⠄⡑⠂⠉⠤⡓⢼⣙⣾⣻⢿⣽⣾⢿⣻⡿⣯⢿⡽⣯⣟⡿⣞⣽⣻⢾⣽⣾⣿⣿⣿⣿⡇⠀]],
                [[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠙⢿⣿⣿⣽⣏⠶⡉⣽⠟⠋⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠘⠻⣤⡉⣀⠂⠈⠹⠿⠦⣀⠒⠼⣿⣿⡆⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣻⡐⡀⠢⡐⡀⠂⠉⠄⠃⠜⡱⢺⡜⣯⢻⠷⣯⢿⡝⣿⢽⣫⡝⡧⢏⡷⣫⢾⣽⣻⣾⣿⣿⣿⣿⣿⣧⠀]],
                [[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢹⣿⣿⢺⡏⡔⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠻⢷⣄⣠⠐⢊⠄⣄⡋⢾⣵⠟⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⠁⡄⠡⠐⠡⠀⠁⠀⠂⢈⠒⡡⠞⣥⡛⢿⡸⢣⡛⣬⠓⡶⠹⡜⡭⣞⣽⣻⣾⢿⣿⣿⣿⣿⣿⣿⣿⡄]],
                [[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⣯⢧⣻⠔⣧⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠙⠿⠯⠽⠿⠤⠿⠿⠃⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣾⠀⠄⠡⠈⠄⠡⠈⠀⠀⠂⢌⠰⣉⠖⡙⢎⡱⢃⠱⡂⡝⡰⢩⢳⡹⡼⣞⣷⣿⣿⣿⣿⣿⣿⣿⣿⣿⡇]],
                [[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⣿⣿⣎⠗⣚⡆⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣾⣭⣤⣥⣬⣤⣥⣣⢬⡤⣤⣆⣴⣤⢎⣭⢦⣴⣥⣶⣵⣬⣵⣻⣮⣷⣿⣽⣯⡿⣿⣿⣿⣿⣿⣿⣿⣿⡇]],
                [[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢻⣿⡷⢾⡱⠬⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
            },
            {
                "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠠⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡠⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
                "⠀⠀⠀⠀⠀⠀⠀⠀⠐⠒⠒⠒⠂⠀⠤⠤⠤⣄⣀⡀⠘⢆⠀⠀⠀⠀⠀⠀⠀⣀⣤⣶⡿⠋⣀⣔⣒⣉⣀⠤⠄⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⠎⠀⣀⣀⡤⠤⠤⠄⠀⠒⠒⠒⠒⠀⠀⠀⠀⠀⠀⠀⠀",
                "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⣀⣉⣽⢾⡇⠀⠀⠀⠀⠀⢰⣿⣟⣵⣿⢿⣿⣛⣿⣿⣻⢿⣦⠤⠀⠀⠀⠀⠀⠀⠀⠠⣾⢾⣍⣁⣀⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
                "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣀⣤⡴⠶⠛⠋⠉⠁⠀⢠⡏⠀⠀⠀⠀⠰⣲⡿⡟⠋⢹⣿⠟⠛⠉⠉⠙⢻⣗⢻⣇⠀⠀⠀⠀⠀⠀⠀⠀⠈⣧⠀⠀⠉⠉⠛⠳⠶⣤⣄⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
                "⠀⠀⠀⠀⠀⠀⢀⣤⠶⠟⠋⠉⠀⠀⠀⠀⠀⠀⠀⠀⡾⠀⠀⠀⠀⠀⠀⠀⠁⢀⡴⠋⠀⠀⠀⠀⠀⢀⠿⣿⣸⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠸⡆⠀⠀⠀⠀⠀⠀⠀⠈⠉⠛⠶⢦⣀⠀⠀⠀⠀⠀⠀",
                "⠀⠀⠀⢀⣠⠞⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢰⠇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⣟⣿⡟⣿⠈⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢷⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⠛⢦⡀⠀⠀⠀",
                "⠀⠀⣴⠟⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣾⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡠⣶⣿⣾⣾⣿⣇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣸⡆⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠙⢷⡄⠀",
                "⠀⣼⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣠⠴⠖⠚⠛⣛⠻⢧⣤⣤⣄⣀⡠⣤⣤⣶⣶⣶⣾⣿⣿⣳⣝⣿⡿⣻⣽⢺⣿⣿⣿⣶⣶⣶⡤⣀⣤⣤⣤⠟⢛⡛⠛⠒⠶⢤⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢹⡄",
                "⢰⠃⠀⠀⠀⠀⠀⠀⠀⠀⠀⡴⠋⠀⠀⠀⠀⡴⠁⠀⠀⠀⠉⠉⠛⠛⠾⠯⣟⣻⡿⠿⣟⣯⣿⣿⣷⣿⣿⡇⡏⣻⣿⣟⡿⠯⠗⠛⠋⠉⠁⠀⠀⠀⠱⡄⠀⠀⠀⠈⠳⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀⢧",
                "⢸⠀⠀⠀⠀⠀⠀⠀⠀⠀⡜⠀⠀⠀⠀⠀⢰⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⣤⣾⣯⣹⣷⣝⢿⣿⣿⣻⣵⣏⣿⣧⣤⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢰⠀⠀⠀⠀⠀⠸⡀⠀⠀⠀⠀⠀⠀⠀⠀⢸",
                "⢸⠀⠀⠀⠀⠀⠀⠀⠀⢀⠁⠀⠀⠀⠀⠀⠈⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⠯⣷⣿⣿⣿⣷⣷⣿⣿⣽⣸⡯⠏⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠀⠀⠀⠀⠀⠀⢁⠀⠀⠀⠀⠀⠀⠀⠀⢸",
                "⢸⠀⠀⠀⠀⠀⠀⠀⠀⠘⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⡉⠩⡏⡏⣟⢿⡿⣿⣽⣇⡯⠉⡉⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠘⠀⠀⠀⠀⠀⠀⠀⠀⢸",
                "⢸⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠁⡇⣿⣷⣿⣿⢿⠏⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸",
                "⠀⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⣶⢶⣶⢄⠀⠀⢠⣾⢻⣿⣽⣯⣿⣸⣸⣿⣆⠀⠀⣠⢴⣶⢶⣤⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡆",
                "⠀⢁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⡿⣾⣯⣿⢸⣷⣄⣴⣯⡺⣝⡿⡿⣿⣽⡿⣻⣶⢀⣾⣧⢿⡞⣿⣽⣆⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⠁",
                "⠀⠈⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠘⠀⠟⠈⠇⠀⠙⢿⣯⠟⠀⢏⣿⣿⣿⡟⣇⠹⢿⣿⠟⠁⠸⠃⠸⠃⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠀",
                "⠀⠀⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⠀⠀⠘⣼⣽⣿⣦⣿⠀⠈⠀⠀⠀⣀⣀⣀⣀⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠁⠀",
                "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠨⣟⣿⣯⡼⡧⣴⣶⣿⠿⠿⠿⠿⣿⣿⣿⣷⣦⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
                "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⡜⡿⡿⣫⣻⡝⠒⠉⠉⠈⠈⠉⠉⠘⠙⢿⣿⣏⣦⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
                "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⣤⣶⣿⢿⠟⠘⣿⣿⣗⣻⣦⡀⠀⠀⠀⠀⠀⠀⠀⢸⣿⢧⣿⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
                "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠲⣤⣀⣀⣀⣀⣀⣠⣤⣶⣾⡿⠿⠛⠉⠀⠀⠀⠀⠀⢺⣿⣷⣝⢿⣶⣄⣀⡀⠀⠠⢴⣿⣽⣿⡿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
                "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⠉⠙⠛⠛⠋⠉⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠺⢿⣶⣝⡿⣿⣿⣿⣿⣿⣿⡿⠟⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
            },
        }
        dashboard.section.header.val = ascii_art_list[1]
        alpha.setup(dashboard.opts)
    end,
}
