-- Bottom status bar
return {
	{
		"linrongbin16/lsp-progress.nvim",
		config = function()
			require("lsp-progress").setup()
		end,
	},
	{
		"nvim-lualine/lualine.nvim",
		config = function()
			require("lualine").setup({
				options = {
					theme = "catppuccin",
				},
				-- sections = {
				-- 	lualine_c = {
				-- 		function()
				-- 			return require("lsp-progress").progress()
				-- 		end,
				-- 	},
				-- },
			})
		end,
	},
}
