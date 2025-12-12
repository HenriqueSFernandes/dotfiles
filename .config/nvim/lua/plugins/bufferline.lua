-- Tabs
return {
	"akinsho/bufferline.nvim",
	after = "catppuccin",
	config = function()
		require("bufferline").setup({
			highlights = require("catppuccin.special.bufferline").get_theme(),
			options = {
				hover = {
					enabled = true,
					delay = 0,
					reveal = { "close" },
				},
			},
		})
		vim.keymap.set({ "n", "v" }, "<Tab>", ":BufferLineCycleNext<CR>")
		vim.keymap.set({ "n", "v" }, "<S-Tab>", ":BufferLineCyclePrev<CR>")
		-- vim.keymap.set({ "n", "v" }, "<leader>b", ":BufferLinePick<CR>")
		vim.keymap.set({ "n", "v" }, "<leader>w", ":bd<CR>", { desc = "Close Buffer" })
	end,
}
