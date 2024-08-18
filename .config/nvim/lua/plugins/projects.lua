return {
	"coffebar/neovim-project",
	opts = {
		projects = { -- define project roots
			"~/.config/kitty",
			"~/.config/nvim",
			"~/.config/tmux",
			"~/.config/hypr",
			"~/Desktop/Repositories/*",
			"~/Desktop/nodeLearn",
			"~/Desktop/leetcode",
			"~/Desktop/GoX-App",
		},
	},
	init = function()
		-- enable saving the state of plugins in the session
		vim.opt.sessionoptions:append("globals") -- save global variables that start with an uppercase letter and contain at least one lowercase letter.
		vim.keymap.set({ "n", "v" }, "<C-S-l>", "<cmd>:Telescope neovim-project discover<cr>", { desc = "Projects" })
	end,
	dependencies = {
		{ "nvim-lua/plenary.nvim" },
		{ "nvim-telescope/telescope.nvim", tag = "0.1.4" },
		{ "Shatur/neovim-session-manager" },
	},
	lazy = false,
	priority = 100,
}
