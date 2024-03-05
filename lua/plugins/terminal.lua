return {
	{
		"akinsho/toggleterm.nvim",
		config = function()
			require("toggleterm").setup({
				size = 20, -- Set the height of the terminal window in lines
				open_mapping = [[<leader>t]], -- Key mapping to toggle the terminal, set to Space + t
				autochdir = true,
				hide_numbers = true, -- Hide the number column in toggleterm buffers
				shade_terminals = true, -- Shade the terminal window to differentiate it from other windows
				start_in_insert = true, -- Start in insert mode when the terminal opens
				direction = "float", -- Set the terminal to open in floating window mode
				auto_scroll = true,
				close_on_exit = true, -- Close the terminal window when the process exits
				float_opts = {
					border = "curved", -- Use a curved border for the floating window
					winblend = 0, -- Transparency of the window; 0 is fully opaque, 100 is fully transparent
				},
			})
		end,
	},
}
