return {
	"tlj/api-browser.nvim",
	dependencies = {
		"kkharji/sqlite.lua",
		"nvim-lua/plenary.nvim",
		"nvim-telescope/telescope.nvim",
	},
	config = function()
		require("api-browser").setup()
	end,
	keys = {
		{ "<leader>sa", "<cmd>ApiBrowser open<cr>", desc = "Select an API." },
		{ "<leader>sd", "<cmd>ApiBrowser select_local_server<cr>", desc = "Select environment." },
		{ "<leader>sx", "<cmd>ApiBrowser select_remote_server<cr>", desc = "Select remote environment." },
		{ "<leader>se", "<cmd>ApiBrowser endpoints<cr>", desc = "Open list of endpoints for current API." },
		{
			"<leader>sr",
			"<cmd>ApiBrowser recents<cr>",
			desc = "Open list of recently opened API endpoints.",
		},
		{
			"<leader>sg",
			"<cmd>ApiBrowser endpoints_with_param<cr>",
			desc = "Open API endpoints valid for replacement text on cursor.",
		},
	},
}
