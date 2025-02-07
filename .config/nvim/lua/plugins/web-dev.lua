return {
	-- Laravel
	{
		"adalessa/laravel.nvim",
		dependencies = {
			"nvim-telescope/telescope.nvim",
			"tpope/vim-dotenv",
			"MunifTanjim/nui.nvim",
			"nvimtools/none-ls.nvim",
			"kevinhwang91/promise-async",
		},
		cmd = { "Sail", "Artisan", "Composer", "Npm", "Yarn", "Laravel" },
		keys = {
			{ "<leader>la", ":Laravel artisan<cr>" },
			{ "<leader>lr", ":Laravel routes<cr>" },
			{ "<leader>lm", ":Laravel related<cr>" },
		},
		event = { "VeryLazy" },
		opts = {
			features = {
				null_ls = {
					enable = true,
				},
				route_info = {
					enable = true, --- to enable the laravel.nvim virtual text
					position = "right", --- where to show the info (available options 'right', 'top')
					middlewares = true, --- wheather to show the middlewares section in the info
					method = true, --- wheather to show the method section in the info
					uri = true, --- wheather to show the uri section in the info
				},
			},
		},
		config = true,
	},
	{
		"EmranMR/tree-sitter-blade",
	},

	-- Tailwind
	{
		"luckasRanarison/tailwind-tools.nvim",
		name = "tailwind-tools",
		build = ":UpdateRemotePlugins",
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
			"nvim-telescope/telescope.nvim", -- optional
			"neovim/nvim-lspconfig", -- optional
		},
		config = function()
			require("tailwind-tools").setup({})
		end,
	},
}
