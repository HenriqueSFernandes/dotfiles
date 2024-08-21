-- Adds semicolon to end of lines

return {
	"celediel/poiekolon.nvim",
	config = function()
		require("poiekolon").setup({})
		vim.keymap.set({ "n", "i" }, "<S-CR>", "<cmd>Poiekolon add_newline ;<cr>", { desc = "Adds semicolon" })
	end,
}
