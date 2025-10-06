-- Color Scheme
return {
	"catppuccin/nvim",
	name = "catppuccin",
	priority = 1000,
	config = function()
		require("catppuccin").setup({
			flavour = "mocha",
			-- transparent_background = true,
			integrations = {
				alpha = true,
				beacon = true,
				cmp = true,
				copilot_vim = false,
				harpoon = true,
				markdown = true,
				mason = false,
				neotree = true,
				notify = true,
				nvim_surround = true,
				which_key = true,
			},
		})
		vim.cmd.colorscheme("catppuccin")
	end,
}
