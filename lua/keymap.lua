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

-- LSP keymap setup function (called from lspconfig on_attach)
local function setup_lsp_keymaps(client, bufnr)
    local bufopts = { noremap = true, silent = true, buffer = bufnr }

    -- Definition and references
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufopts)
    vim.keymap.set("n", "gD", vim.lsp.buf.declaration, bufopts)
    vim.keymap.set("n", "gr", vim.lsp.buf.references, bufopts)
    vim.keymap.set("n", "gi", vim.lsp.buf.implementation, bufopts)
    vim.keymap.set("n", "gt", vim.lsp.buf.type_definition, bufopts)

    -- Diagnostics
    vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, bufopts)
    vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, bufopts)
    vim.keymap.set("n", "]d", vim.diagnostic.goto_next, bufopts)

    -- Code actions and hover
    vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, bufopts)
    vim.keymap.set("n", "K", vim.lsp.buf.hover, bufopts)
    vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, bufopts)
    vim.keymap.set("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, bufopts)
    vim.keymap.set("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, bufopts)
    vim.keymap.set("n", "<leader>wl", function()
        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, bufopts)
end

-- Basic editor mappings
map("n", ";", ":", "CMD enter command mode")
map("i", "jk", "<ESC>", "Exit insert mode")

-- Formatting (conform.nvim)
map({ "n", "v" }, "<leader>gf", function()
    require("conform").format { async = true, lsp_format = "fallback" }
end, "Format code")

-- Linting (nvim-lint)
map("n", "<leader>gl", function()
    require("lint").try_lint()
end, "Trigger linting")

-- Treesitter incremental selection
map("n", "<C-space>", function()
    require("nvim-treesitter.incremental_selection").init_selection_repeatable()
end, "Initialize treesitter selection")
map("n", "<C-s>", function()
    require("nvim-treesitter.incremental_selection").scope_incremental()
end, "Scope incremental selection")
map("n", "<C-BS>", function()
    require("nvim-treesitter.incremental_selection").node_decremental()
end, "Node decremental selection")


-- Telescope mappings
local builtin = require "telescope.builtin"
local telescope_mappings = {
    -- File operations
    { "<space>ff", builtin.find_files,           "Telescope find files" },
    { "<space>fg", builtin.live_grep,            "Telescope live grep" },
    { "<space>fb", builtin.buffers,              "Telescope buffers" },
    { "<space>fh", builtin.help_tags,            "Telescope help tags" },
    { "<space>of", builtin.oldfiles,             "Telescope lists previously open files" },

    -- LSP related
    { "<space>td", builtin.lsp_definitions,      "Telescope Go to definition" },
    { "<space>ti", builtin.lsp_implementations,  "Telescope Go to implementation" },
    { "<space>tt", builtin.lsp_type_definitions, "Telescope Go to type definition" },
    { "<space>tr", builtin.lsp_references,       "Telescope Find references" },

    -- Diagnostics
    { "<space>dd", builtin.diagnostics,          "Telescope All diagnostics" },

    -- Utilities
    { "<space>ma", builtin.man_pages,            "Telescope man page" },
    { "<space>qf", builtin.quickfix,             "Telescope lists items in the quickfix list" },
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

-- Formatting (conform.nvim)
map({ "n", "v" }, "<leader>mp", function()
    require("conform").format {
        lsp_format = "fallback",
        async = false,
        timeout_ms = 500,
    }
end, "Format file or range")

map({ "n", "v" }, "fa", function()
    require("conform").format {
        lsp_format = "fallback",
        async = false,
        timeout_ms = 500,
    }
end, "Format file or range")

-- Linting: avoid prefix collision with <space>lg (LazyGit)
map("n", "<space>ll", function()
    require("lint").try_lint()
end, "Trigger linting for current file")

-- LazyGit
map("n", "<space>lg", "<cmd>LazyGit<cr>", "Open LazyGit")

-- Comment toggles: map a non-conflicting key to line-toggle
-- Many comment plugins provide a `gcc` mapping; call that to toggle line comment.
map("n", "<leader>c", "<cmd>normal! gcc<CR>", "Toggle line comment")

-- Quick fix list navigation
map("n", "[q", ":cprev<CR>", "Previous quickfix item")
map("n", "]q", ":cnext<CR>", "Next quickfix item")

-- Export setup function
return {
    setup_lsp_keymaps = setup_lsp_keymaps,
}
