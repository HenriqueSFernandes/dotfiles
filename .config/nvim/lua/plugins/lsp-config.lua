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
	-- {
	-- 	"nvim-java/nvim-java",
	-- 	config = function()
	-- 		require("java").setup()
	-- 	end,
	-- },
	{
		"ray-x/go.nvim",
		dependencies = { -- optional packages
			"ray-x/guihua.lua",
			"neovim/nvim-lspconfig",
			"nvim-treesitter/nvim-treesitter",
		},
		opts = {
			-- lsp_keymaps = false,
			-- other options
		},
		config = function(lp, opts)
			require("go").setup(opts)
			local format_sync_grp = vim.api.nvim_create_augroup("GoFormat", {})
			vim.api.nvim_create_autocmd("BufWritePre", {
				pattern = "*.go",
				callback = function()
					require("go.format").goimports()
				end,
				group = format_sync_grp,
			})
		end,
		event = { "CmdlineEnter" },
		ft = { "go", "gomod" },
		build = ':lua require("go.install").update_all_sync()', -- if you need to install/update all binaries
	},
	{
		"mason-org/mason-lspconfig.nvim",
		opts = {},
		dependencies = {
			{ "mason-org/mason.nvim", opts = {} },
			"neovim/nvim-lspconfig",
		},
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
		dependencies = {
			{ "folke/neoconf.nvim", cmd = "Neoconf", config = true },
		},
		config = function()
			local capabilities = require("cmp_nvim_lsp").default_capabilities()
			-- local lspconfig = require("lspconfig")

			-- require("lspconfig").jdtls.setup({})
			--
			vim.lsp.config("jdtls", {})
			vim.lsp.enable("jdtls")
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
			vim.lsp.config("emmet_language_server", {
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
