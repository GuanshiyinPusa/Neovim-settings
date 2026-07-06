return {
	{
		"saghen/blink.cmp",
		dependencies = {
			"rafamadriz/friendly-snippets", -- Optional: provides snippets
		},
		version = "1.*", -- Use release tag to download pre-built binaries
		---@module 'blink.cmp'
		---@type blink.cmp.Config
		opts = {
			keymap = {
				preset = "enter",
				["<Tab>"] = { "select_next", "fallback" },
				["<S-Tab>"] = { "select_prev", "fallback" },
				["<CR>"] = { "accept", "fallback" },
				["<C-Space>"] = { "show", "show_documentation", "hide_documentation" },
				["<C-e>"] = { "hide", "fallback" },
				-- Better documentation scrolling
				["<C-f>"] = { "scroll_documentation_down", "fallback" },
				["<C-b>"] = { "scroll_documentation_up", "fallback" },
				["<C-u>"] = { "scroll_documentation_up", "fallback" },
				["<C-d>"] = { "scroll_documentation_down", "fallback" },
			},

			appearance = {
				use_nvim_cmp_as_default = true,
				nerd_font_variant = "mono",
				kind_icons = {
					Text = "󰉿",
					Method = "󰊕",
					Function = "󰊕",
					Constructor = "󰒓",
					Field = "󰜢",
					Variable = "󰆦",
					Class = "󰌗",
					Interface = "󰕘",
					Module = "󰦎",
					Property = "󰖷",
					Unit = "󰑭",
					Value = "󰎠",
					Enum = "󰎕",
					Keyword = "󰌋",
					Snippet = "󰩫",
					Color = "󰏘",
					File = "󰈙",
					Reference = "󰈇",
					Folder = "󰉋",
					EnumMember = "󰦨",
					Constant = "󰏿",
					Struct = "󰙅",
					Event = "󰕘",
					Operator = "󰆕",
					TypeParameter = "󰗴",
				},
			},

			sources = {
				default = { "lsp", "path", "snippets", "buffer" },
				-- Enhanced per-filetype configuration
				per_filetype = {
					lua = { "lsp", "path", "snippets", "buffer" },
					python = { "lsp", "path", "snippets", "buffer" },
					rust = { "lsp", "path", "snippets", "buffer" },
					c = { "lsp", "path", "snippets", "buffer" },
					cpp = { "lsp", "path", "snippets", "buffer" },
				},
			},

			-- Command line completion sources
			cmdline = {
				sources = function()
					local type = vim.fn.getcmdtype()
					if type == "/" or type == "?" then
						return { "buffer" }
					end
					if type == ":" then
						return { "cmdline", "path" }
					end
					return {}
				end,
			},

			completion = {
				accept = {
					create_undo_point = true,
					auto_brackets = {
						enabled = true,
						default_brackets = { "(", ")" },
						-- Automatically add brackets for functions/methods
						semantic_token_resolution = {
							enabled = true,
						},
					},
				},

				menu = {
					max_height = 15,
					min_width = 15,
					border = "rounded",
					winblend = 0,
					scrollbar = true,
					draw = {
						treesitter = { "lsp" },
						columns = {
							{ "kind_icon", "label", "label_description", gap = 1 },
							{ "source_name" },
						},
						-- Enhanced components for better information display
						components = {
							kind_icon = {
								ellipsis = false,
								text = function(ctx)
									return ctx.kind_icon .. ctx.icon_gap
								end,
								highlight = function(ctx)
									return ctx.kind_hl
								end,
							},

							label = {
								width = { fill = true, max = 60 },
								text = function(ctx)
									return ctx.label .. ctx.label_detail
								end,
								highlight = function(ctx)
									if ctx.deprecated then
										return "BlinkCmpLabelDeprecated"
									end
									return "BlinkCmpLabel"
								end,
							},

							label_description = {
								width = { max = 30 },
								text = function(ctx)
									return ctx.label_description
								end,
								highlight = function(ctx)
									return "BlinkCmpLabelDescription"
								end,
							},

							source_name = {
								width = { max = 8 },
								text = function(ctx)
									return "[" .. ctx.source_name .. "]"
								end,
								highlight = function(ctx)
									return "BlinkCmpSource"
								end,
							},
						},
					},
				},

				-- Enhanced documentation window
				documentation = {
					auto_show = true,
					auto_show_delay_ms = 100,
					treesitter_highlighting = true,
					window = {
						min_width = 15,
						max_width = 80,
						max_height = 20,
						border = "rounded",
						winblend = 0,
						scrollbar = true,
					},
				},

				ghost_text = {
					enabled = true,
				},

				list = {
					selection = {
						preselect = function(ctx)
							return ctx.mode ~= "cmdline" and not require("blink.cmp").snippet_active({ direction = 1 })
						end,
						auto_insert = function(ctx)
							return ctx.mode == "cmdline"
						end,
					},
				},
			},
			-- Enhanced signature help for function parameters
			signature = {
				enabled = true,
				trigger = {
					enabled = true,
					show_on_keyword = true,
					show_on_trigger_character = true,
					show_on_insert = true,
					show_on_insert_on_trigger_character = true,
				},
				window = {
					min_width = 20,
					max_width = 100,
					max_height = 10,
					border = "rounded",
					winblend = 0,
					scrollbar = true,
					treesitter_highlighting = true,
				},
			},
		},
		-- Allow override of opts
		opts_extend = { "sources.default" },
	},
}
