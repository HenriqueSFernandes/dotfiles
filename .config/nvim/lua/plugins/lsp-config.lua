return {
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = { "lua_ls", "tsserver" },
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
		lazy = false,
		dependencies = {
			"nvim-lua/plenary.nvim",
			"stevearc/dressing.nvim", -- optional for vim.ui.select
		},
		config = true,
	},
	{
		"neovim/nvim-lspconfig",
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
			-- lspconfig.emmet_language_server.setup({
			--      capabilities = capabilities,
			--    })
			vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
			vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
			vim.keymap.set({ "n", "v" }, "<C-.>", vim.lsp.buf.code_action, {})
		end,
	},
}
