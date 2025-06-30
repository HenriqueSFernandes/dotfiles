-- Bottom status bar
return {
	{
		"linrongbin16/lsp-progress.nvim",
		config = function()
			require("lsp-progress").setup()
		end,
	},
	{
		"nvim-lualine/lualine.nvim",
		config = function()
			-- Define the function to get the current YAML schema
			local function get_schema()
				local schema = require("yaml-companion").get_buf_schema(0)
				if schema.result[1].name == "none" then
					return ""
				end
				return schema.result[1].name
			end

			require("lualine").setup({
				options = {
					theme = "catppuccin",
				},
				sections = {
					-- Add the YAML schema name to lualine_x
					lualine_x = {
						{
							require("noice").api.statusline.mode.get,
							cond = require("noice").api.statusline.mode.has,
							color = { fg = "#ff9e64" },
						},
						{
							get_schema,
							color = { fg = "#89b4fa" }, -- Adjust color as needed
						},
					},
				},
			})
		end,
	},
}
