return {
	"NachoNievaG/atac.nvim",
	dependencies = { "akinsho/toggleterm.nvim" },
	config = function()
		require("atac").setup({
			dir = "/home/ricky/.config/atac", -- By default, the dir will be set as /tmp/atac
		})
			vim.keymap.set(
				"n",
				"<leader>ga",
				"<cmd>Atac<cr>",
				{ desc = "Toggle Atac" }
			)
	end,
}
