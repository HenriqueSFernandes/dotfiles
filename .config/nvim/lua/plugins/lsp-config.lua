-- Lsp stuff
return {
	{
		"nikvdp/ejs-syntax",
	},
	{
		"williamboman/mason.nvim",
		lazy = false,
		config = function()
			require("mason").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		lazy = false,
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = { "lua_ls" },
			})
			require("mason-lspconfig").setup_handlers({
				function(server_name)
					require("lspconfig")[server_name].setup({})
				end,
			})
		end,
	},
	{
		"akinsho/flutter-tools.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"stevearc/dressing.nvim", -- optional for vim.ui.select
		},
		config = function()
			local flutter = require("flutter-tools")
			flutter.setup({})
			vim.keymap.set("n", "<leader>fd", "<cmd>FlutterDevices<cr>", { desc = "Devices" })
			vim.keymap.set("n", "<leader>fe", "<cmd>FlutterEmulators<cr>", { desc = "Emulators" })
			vim.keymap.set("n", "<leader>fr", "<cmd>FlutterReload<cr>", { desc = "Reload" })
			vim.keymap.set("n", "<leader>fR", "<cmd>FlutterRestart<cr>", { desc = "Restart" })
			vim.keymap.set("n", "<leader>fq", "<cmd>FlutterQuit<cr>", { desc = "Quit" })
			vim.keymap.set("n", "<leader>fD", "<cmd>FlutterDetach<cr>", { desc = "Detach" })
			vim.keymap.set("n", "<leader>fD", "<cmd>FlutterDetach<cr>", { desc = "Detach" })
			vim.keymap.set("n", "<leader>fo", "<cmd>FlutterOutlineToggle<cr>", { desc = "Widget Tree" })
			vim.keymap.set("n", "<leader>ft", "<cmd>FlutterDevTools<cr>", { desc = "Dev Tools" })
			vim.keymap.set("n", "<leader>fs", "<cmd>FlutterRun<cr>", { desc = "Run" })
		end,
	},
	{
		"neovim/nvim-lspconfig",
		lazy = false,
		config = function()
			local capabilities = require("cmp_nvim_lsp").default_capabilities()
			local lspconfig = require("lspconfig")
			-- lspconfig.lua_ls.setup({
			-- 	capabilities = capabilities,
			-- })
			-- lspconfig.tsserver.setup({
			-- 	capabilities = capabilities,
			-- })
			-- lspconfig.sqls.setup({
			-- 	capabilities = capabilities,
			-- 	on_attach = function(client, bufnr)
			-- 		require("sqls").on_attach(client, bufnr)
			-- 	end,
			-- })
			-- lspconfig.clangd.setup({
			--      capabilities = capabilities,
			--    })
			lspconfig.emmet_language_server.setup({
				filetypes = {
					"css",
					"eruby",
					"html",
					"javascript",
					"javascriptreact",
					"less",
					"sass",
					"scss",
					"pug",
					"typescriptreact",
					"php",
				},
			})
			vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
			vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
			vim.keymap.set({ "n", "v" }, "<leader>v", vim.lsp.buf.code_action, { desc = "Code Action" })
		end,
	},
}
