return {
	"mfussenegger/nvim-dap",
	dependencies = {
		"rcarriga/nvim-dap-ui",
		"nvim-neotest/nvim-nio",
		"mfussenegger/nvim-dap-python",
		"mxsdev/nvim-dap-vscode-js",
	},
	config = function()
		local dap, dapui = require("dap"), require("dapui")
		dapui.setup({})
		dap.listeners.before.attach.dapui_config = function()
			dapui.open()
		end
		dap.listeners.before.launch.dapui_config = function()
			dapui.open()
		end
		dap.listeners.before.event_terminated.dapui_config = function()
			dapui.close()
		end
		dap.listeners.before.event_exited.dapui_config = function()
			dapui.close()
		end

		-- C++ Debugger
		dap.adapters.cppdbg = {
			id = "cppdbg",
			type = "executable",
			command = "/home/ricky/.config/nvim/debuggers/OpenDebugAD7",
		}
		dap.configurations.cpp = {
			{
				name = "Launch file",
				type = "cppdbg",
				request = "launch",
				program = function()
					return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
				end,
				cwd = "${workspaceFolder}",
				stopAtEntry = true,
			},
			{
				name = "Attach to gdbserver :1234",
				type = "cppdbg",
				request = "launch",
				MIMode = "gdb",
				miDebuggerServerAddress = "localhost:1234",
				miDebuggerPath = "/usr/bin/gdb",
				cwd = "${workspaceFolder}",
				program = function()
					return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
				end,
			},
		}

		-- Python Debugger
		require("dap-python").setup("python")

		vim.keymap.set("n", "<F5>", dap.continue, {})
		vim.keymap.set("n", "<F10>", dap.step_over, {})
		vim.keymap.set("n", "<F11>", dap.step_into, {})
		vim.keymap.set("n", "<F12>", dap.step_out, {})
		vim.keymap.set("n", "<F9>", dap.toggle_breakpoint, {})

		-- Node Debugger
		dap.adapters.node2 = {
			type = "executable",
			command = "node",
			args = { os.getenv("HOME") .. "/dev/microsoft/vscode-node-debug2/out/src/nodeDebug.js" },
		}
		dap.configurations.javascript = {
			{
				name = "Launch",
				type = "node2",
				request = "launch",
				program = "${file}",
				cwd = vim.fn.getcwd(),
				sourceMaps = true,
				protocol = "inspector",
				console = "integratedTerminal",
			},
			{
				name = "Launch with auto reload",
				type = "node2",
				request = "launch",
				program = "${file}",
				cwd = vim.fn.getcwd(),
				sourceMaps = true,
				protocol = "inspector",
				console = "integratedTerminal",
				restart = true,
				runtimeExecutable = "nodemon",
			},
			{
				-- For this to work you need to make sure the node process is started with the `--inspect` flag.
				name = "Attach to process",
				type = "node2",
				request = "attach",
				processId = require("dap.utils").pick_process,
			},
		}

		-- Flutter Debugger
		dap.configurations.dart = {
			{
				type = "dart",
				request = "launch",
				name = "Launch dart",
				dartSdkPath = "/usr/bin/flutter/bin/cache/dart-sdk/bin/dart",
				flutterSdkPath = "/usr/bin/flutter/bin/flutter",
				program = "${workspaceFolder}/lib/main.dart", -- ensure this is correct
				cwd = "${workspaceFolder}",
			},
			{
				type = "flutter",
				request = "launch",
				name = "Launch flutter",
				dartSdkPath = "/usr/bin/flutter/bin/cache/dart-sdk/bin/dart",
				flutterSdkPath = "/usr/bin/flutter/bin/flutter",
				program = "${workspaceFolder}/lib/main.dart", -- ensure this is correct
				cwd = "${workspaceFolder}",
			},
		}
		dap.adapters.dart = {
			type = "executable",
			command = "dart", -- if you're using fvm, you'll need to provide the full path to dart (dart.exe for windows users), or you could prepend the fvm command
			args = { "debug_adapter" },
			-- windows users will need to set 'detached' to false
			options = {
				detached = false,
			},
		}
		dap.adapters.flutter = {
			type = "executable",
			command = "flutter", -- if you're using fvm, you'll need to provide the full path to flutter (flutter.bat for windows users), or you could prepend the fvm command
			args = { "debug_adapter" },
			-- windows users will need to set 'detached' to false
			options = {
				detached = false,
			},
		}

		vim.keymap.set("n", "<leader>d", dapui.toggle, { desc = "Toggle Debugger UI" })
	end,
}
