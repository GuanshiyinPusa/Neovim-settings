-- =============================================================================
-- Telescope — fuzzy finder
-- =============================================================================

local telescope = require "telescope"

telescope.setup {
    defaults = {
        prompt_prefix = "   ",
        selection_caret = "  ",
        sorting_strategy = "ascending",
        layout_strategy = "horizontal",
        layout_config = {
            horizontal = {
                prompt_position = "top",
                preview_width = 0.55,
                results_width = 0.45,
            },
            width = 0.90,
            height = 0.80,
            preview_cutoff = 80, -- hide preview if terminal is narrower than this
        },
    },
    extensions = {
        file_browser = {
            hijack_netrw = true,
        },
        ["ui-select"] = {
            require("telescope.themes").get_dropdown(),
        },
    },
}

-- Load extensions
telescope.load_extension "file_browser"
telescope.load_extension "ui-select"
