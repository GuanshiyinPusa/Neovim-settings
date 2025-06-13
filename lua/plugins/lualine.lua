return {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    config = function()
        -- Custom word count component
        local function word_count()
            local ft = vim.bo.filetype
            if ft ~= "markdown" and ft ~= "txt" then
                return ""
            end

            local wc = vim.fn.wordcount()

            if wc.visual_words then
                return " " .. wc.visual_words .. " selected"
            end

            return " " .. wc.words .. " words"
        end

        require("lualine").setup {
            options = {
                theme = "auto",
            },
            sections = {
                lualine_a = { "mode" },
                lualine_b = { "branch" },
                lualine_c = { "filename" },
                lualine_x = { word_count, "encoding", "fileformat", "filetype" },
                lualine_y = { "progress" },
                lualine_z = { "location" },
            },
        }
    end,
}
