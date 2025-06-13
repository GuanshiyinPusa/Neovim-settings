-- Define options once
local opts = { noremap = true, silent = true }

-- Helper function to set keymaps with combined options
local function map(mode, lhs, rhs, description)
    local options = vim.deepcopy(opts)
    if description then
        options.desc = description
    end
    vim.keymap.set(mode, lhs, rhs, options)
end

-- Basic editor mappings
-- map("n", "p", ":put<CR>")
map("n", ";", ":", "CMD enter command mode") -- Added semicolon mapping
map("i", "jk", "<ESC>") -- Added jk escape mapping

-- Telescope mappings
local builtin = require "telescope.builtin"
local telescope_mappings = {
    -- File operations
    { "<space>ff", builtin.find_files, "Telescope find files" },
    { "<space>fg", builtin.live_grep, "Telescope live grep" },
    { "<space>fb", builtin.buffers, "Telescope buffers" },
    { "<space>fh", builtin.help_tags, "Telescope help tags" },
    { "<space>of", builtin.oldfiles, "Telescope lists previously open files" },

    -- LSP related
    { "<space>td", builtin.lsp_definitions, "Telescope Go to definition" },
    { "<space>ti", builtin.lsp_implementations, "Telescope Go to implementation" },
    { "<space>tt", builtin.lsp_type_definitions, "Telescope Go to type definition" },
    { "<space>tr", builtin.lsp_references, "Telescope Find references" },

    -- Diagnostics
    { "<space>dd", builtin.diagnostics, "Telescope All diagnostics" },

    -- Utilities
    { "<space>ma", builtin.man_pages, "Telescope man page" },
    { "<space>qf", builtin.quickfix, "Telescope lists items in the quickfix list" },
    {
        "<space>sp",
        builtin.spell_suggest,
        "Telescope lists spelling suggestions for the current word under the cursor",
    },
    { "<space>km", builtin.keymaps, "Telescope lists normal mode keymappings" },
}

-- Apply all telescope mappings
for _, mapping in ipairs(telescope_mappings) do
    map("n", mapping[1], mapping[2], mapping[3])
end

-- Function mappings that require special handling
map("n", "<space>dc", function()
    builtin.diagnostics { bufnr = 0 }
end, "Current buffer diagnostics")

-- Neotree
map("n", "<space>n", ":Neotree toggle float<CR>", "Toggle Neotree filesystem")
-- map("n", "<space>s", ":Neotree toggle git_status float<CR>", "Toggle Neotree git-status")

-- LSP mappings
local lsp_mappings = {
    { "n", "<F2>", vim.lsp.buf.hover, "Hover Information" },
    { "n", "gD", vim.lsp.buf.declaration, "Go to Declaration" },
    { "n", "gd", vim.lsp.buf.definition, "Go to Definition" },
    { "n", "gi", vim.lsp.buf.implementation, "Go to Implementation" },
    { "n", "gtr", vim.lsp.buf.references, "Go to References" },
    { "n", "td", vim.lsp.buf.type_definition, "Go to Type Definition" },
    { "n", "<space>rn", vim.lsp.buf.rename, "Rename Symbol" },
    { "n", "<space>e", vim.diagnostic.open_float, "Show Diagnostic" },
    { { "n", "v" }, "<space>ca", vim.lsp.buf.code_action, "Code Action" },
}

-- Apply all LSP mappings
for _, mapping in ipairs(lsp_mappings) do
    local mode = mapping[1]
    vim.keymap.set(mode, mapping[2], mapping[3], { desc = mapping[4] })
end

-- Formatter
map({ "n", "v" }, "fa", function()
    require("conform").format {
        lsp_fallback = true,
        async = false,
    }
end, "Format file or range")

-- Linter
-- map("n", "<space>l", function()
--     require("lint").try_lint()
-- end, "Trigger linting for current file")

-- ZenMode
map("n", "<space>z", function()
    require("zen-mode").toggle()
end, "Toggle Zen Mode")

-- LazyGit
map("n", "<space>lg", "<cmd>LazyGit<cr>", "Open LazyGit")
