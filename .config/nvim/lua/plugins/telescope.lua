-- Ui used for other plugins
return {
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.8",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			local builtin = require("telescope.builtin")
			vim.keymap.set({ "n", "v" }, "<C-p>", builtin.find_files, {})
			vim.keymap.set({ "n", "v" }, "<C-f>", builtin.live_grep, {})
			vim.keymap.set({ "n", "v" }, "gu", builtin.lsp_references, { desc = "Find Usages" })
		end,
	},
	{
		"nvim-telescope/telescope-ui-select.nvim",
		config = function()
			require("telescope").setup({
				extensions = {
					["ui-select"] = {
						require("telescope.themes").get_dropdown({}),
					},
				},
				-- pickers = {
				-- 	find_files = {
				-- 		hidden = true,
				-- 	},
				-- },
			})
			require("telescope").load_extension("ui-select")
			require("telescope").load_extension("flutter")
		end,
	},
}
