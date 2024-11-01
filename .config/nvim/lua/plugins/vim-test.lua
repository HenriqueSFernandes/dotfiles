-- Plugins to run tests
return {
	"nvim-neotest/neotest",
	dependencies = {
		"nvim-neotest/nvim-nio",
		"nvim-lua/plenary.nvim",
		"antoinemadec/FixCursorHold.nvim",
		"nvim-treesitter/nvim-treesitter",
		"mrcjkb/neotest-haskell",
	},
	config = function ()
		require("neotest").setup({
			adapters = {
				require("neotest-haskell") {
					frameworks = {"hspec"}
				}
			}
		})
	end
}
