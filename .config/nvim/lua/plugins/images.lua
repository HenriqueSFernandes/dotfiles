-- Plugins for displaying images inside neovim
return {
	"3rd/image.nvim",
	config = function()
		require("image").setup()
	end,
}
