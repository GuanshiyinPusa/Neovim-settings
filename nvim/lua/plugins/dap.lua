-- Debugging: nvim-dap + UI + adapters.
-- codelldb drives C/C++ (best-in-class LLDB adapter, handles stdio), debugpy
-- drives Python. Both are installed through Mason via mason-nvim-dap.
-- Keys live under <leader>b ("debug") because <leader>d is the diagnostics
-- group; F5/F9-F12 mirror the usual VSCode-style debug controls.
return {
	{
		"mfussenegger/nvim-dap",
		dependencies = {
			"rcarriga/nvim-dap-ui",
			"nvim-neotest/nvim-nio",
			"theHamsta/nvim-dap-virtual-text",
			"jay-babu/mason-nvim-dap.nvim",
			"williamboman/mason.nvim",
		},
		-- Keymaps live in lua/keymap.lua. These cmd stubs give lazy a load
		-- trigger (the keymap callbacks also require("dap"), which loads it too).
		cmd = { "DapContinue", "DapToggleBreakpoint", "DapStepOver", "DapStepInto", "DapStepOut", "DapTerminate", "DapNew" },
		config = function()
			local dap = require("dap")
			local dapui = require("dapui")

			require("mason-nvim-dap").setup({
				ensure_installed = { "codelldb", "python" },
				automatic_installation = true,
				-- Let mason-nvim-dap wire up default adapters/configs (codelldb
				-- provides c/cpp/rust; python provides debugpy configurations).
				handlers = {
					function(config)
						require("mason-nvim-dap").default_setup(config)
					end,
				},
			})

			-- One-key build+debug for a single C/C++ file: compile the current
			-- buffer with debug info, then launch codelldb on the binary. Press
			-- F5 in a .c/.cpp file and pick this entry (it's listed first).
			local function build_and_debug(compiler)
				return {
					name = "▶ Build & debug this file (" .. compiler .. " -g)",
					type = "codelldb",
					request = "launch",
					program = function()
						local src = vim.fn.expand("%:p")
						local out = vim.fn.fnamemodify(src, ":r")
						vim.cmd("silent! write")
						local result = vim.fn.system({ compiler, "-g", "-O0", "-Wall", src, "-o", out })
						if vim.v.shell_error ~= 0 then
							vim.notify("Compilation failed:\n" .. result, vim.log.levels.ERROR)
							return dap.ABORT
						end
						return out
					end,
					cwd = "${fileDirname}",
					-- Stop at main so the UI stays open instead of the program
					-- running to completion and the panels flashing shut.
					stopOnEntry = true,
					args = {},
					terminal = "integrated", -- so program stdin/stdout work
				}
			end

			-- Make this the ONLY C/C++ configuration so F5 launches straight
			-- away with no selection prompt (the built-in picker flickers under
			-- noice.nvim). Add breakpoints with F9, then F5.
			dap.configurations.c = { build_and_debug("gcc") }
			dap.configurations.cpp = { build_and_debug("g++") }

			dapui.setup()
			require("nvim-dap-virtual-text").setup({})

			-- Open the UI automatically on a session, close it when done.
			dap.listeners.before.attach.dapui_config = function() dapui.open() end
			dap.listeners.before.launch.dapui_config = function() dapui.open() end
			dap.listeners.before.event_terminated.dapui_config = function() dapui.close() end
			dap.listeners.before.event_exited.dapui_config = function() dapui.close() end

			vim.fn.sign_define("DapBreakpoint", { text = "●", texthl = "DiagnosticError" })
			vim.fn.sign_define("DapBreakpointCondition", { text = "◆", texthl = "DiagnosticWarn" })
			vim.fn.sign_define("DapStopped", { text = "▶", texthl = "DiagnosticWarn", linehl = "Visual" })
		end,
	},
	{
		"mfussenegger/nvim-dap-python",
		ft = "python",
		dependencies = { "mfussenegger/nvim-dap" },
		config = function()
			-- Prefer the debugpy that Mason installs; fall back to system python.
			local mason_py = vim.fn.stdpath("data") .. "/mason/packages/debugpy/venv/bin/python"
			local py = (vim.uv or vim.loop).fs_stat(mason_py) and mason_py or "python3"
			require("dap-python").setup(py)
		end,
	},
}
