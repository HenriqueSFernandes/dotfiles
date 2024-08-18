-- Formatters
return {
	"nvimtools/none-ls.nvim",
	config = function()
		local null_ls = require("null-ls")
		null_ls.setup({
			sources = {
				null_ls.builtins.formatting.stylua,
				null_ls.builtins.formatting.prettierd.with({ extra_filetypes = { "ejs" } }),
				null_ls.builtins.formatting.black,
				null_ls.builtins.formatting.pretty_php,
				null_ls.builtins.formatting.sql_formatter,
				null_ls.builtins.formatting.clang_format,
				null_ls.builtins.formatting.shellharden,
				null_ls.builtins.formatting.djlint,
			},
		})
		vim.keymap.set({ "n", "i", "v" }, "<A-S-f>", vim.lsp.buf.format, {})
	end,
}
