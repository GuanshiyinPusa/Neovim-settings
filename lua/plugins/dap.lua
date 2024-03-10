return {
	{
		"jay-babu/mason-nvim-dap.nvim",
		opts = {
			handlers = {},
			ensure_installed = { "codelldb", "cpptools" },
		},
	},
	{
		"rcarriga/nvim-dap-ui",
		config = function()
			local dap = require("dap")
			local dapui = require("dapui")
			dapui.setup()
			dap.listeners.after.event_initialized["dapui_config"] = function()
				dapui.open()
			end
			dap.listeners.before.event_terminated["dapui_config"] = function()
				dapui.close()
			end
			dap.listeners.before.event_exited["dapui_config"] = function()
				dapui.close()
			end
		end,
	},
	{
		"mfussenegger/nvim-dap",
		config = function()
			local dap = require("dap")

			-- GDB
			dap.adapters.gdb = {
				type = "executable",
				command = "gdb",
				args = { "-i", "dap" },
			}

			-- LLDB
			dap.adapters.lldb_code = {
				type = "executable",
				command = "/usr/bin/lldb-vscode", -- adjust as needed, must be absolute path
				name = "lldb_code",
			}

			-- cpptools
			dap.adapters.cppdbg = {
				id = "cppdbg",
				type = "executable",
				command = "OpenDebugAD7",
				options = {
					detached = false,
				},
			}

			dap.configurations.cpp = {
				-- GDB
				{
					name = "Launch GDB",
					type = "gdb",
					request = "launch",
					program = function()
						return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
					end,
					cwd = "${workspaceFolder}",
					stopOnEntry = false,
				},

				-- LLDB
				{
					name = "Launch LLDB",
					type = "lldb_code",
					request = "launch",
					program = function()
						return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
					end,
					cwd = "${workspaceFolder}",
					stopOnEntry = false,
					runInTerminal = false,
				},

				-- cpptools
				{
					name = "Launch cpptools",
					type = "cppdbg",
					request = "launch",
					program = function()
						return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
					end,
					cwd = "${workspaceFolder}",
					stopOnEntry = false,
				},
			}
			dap.configurations.c = dap.configurations.cpp
		end,
	},
	{
		"theHamsta/nvim-dap-virtual-text",
		config = function()
			require("nvim-dap-virtual-text").setup({})
		end,
	},
	{
		"nvim-telescope/telescope-dap.nvim",
		requires = { "nvim-telescope/telescope.nvim" },
	},
}
