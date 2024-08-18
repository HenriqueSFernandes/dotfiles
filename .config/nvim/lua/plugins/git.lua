-- Git plugins
return {
	{
		"kdheepak/lazygit.nvim",
		cmd = {
			"LazyGit",
			"LazyGitConfig",
			"LazyGitCurrentFile",
			"LazyGitFilter",
			"LazyGitFilterCurrentFile",
		},
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
		keys = {
			{ "<leader>gg", "<cmd>LazyGit<cr>", desc = "LazyGit" },
		},
	},
	{
		"lewis6991/gitsigns.nvim",
		config = function()
			require("gitsigns").setup({})
			vim.keymap.set("n", "<leader>gp", "<cmd>Gitsigns preview_hunk<cr>", { desc = "Preview Hunk" })
			vim.keymap.set(
				"n",
				"<leader>gb",
				"<cmd>Gitsigns toggle_current_line_blame<cr>",
				{ desc = "Toggle Line Blame" }
			)
		end,
	},
	{
		"tpope/vim-fugitive",
	},
}
