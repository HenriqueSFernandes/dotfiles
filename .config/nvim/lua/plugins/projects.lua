-- Projects picker
return {
	"coffebar/neovim-project",
	opts = {
		projects = { -- define project roots
			"~/Desktop/ARMIS/virtual-test-set/*",
			"~/Desktop/ARMIS/TTC/*",
		},
	},
	init = function()
		-- enable saving the state of plugins in the session
		vim.opt.sessionoptions:append("globals") -- save global variables that start with an uppercase letter and contain at least one lowercase letter.
		vim.keymap.set({ "n", "v" }, "<leader>p", "<cmd>:Telescope neovim-project discover<cr>", { desc = "Projects" })
	end,
	dependencies = {
		{ "nvim-lua/plenary.nvim" },
		{ "nvim-telescope/telescope.nvim", tag = "0.1.4" },
		{ "Shatur/neovim-session-manager" },
	},
	lazy = false,
	priority = 100,
}
