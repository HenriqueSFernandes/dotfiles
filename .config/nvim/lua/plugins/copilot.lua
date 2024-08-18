-- Github Copilot
return {
	{
		"CopilotC-Nvim/CopilotChat.nvim",
		branch = "canary",
		dependencies = {
			{ "github/copilot.vim" },
			{ "nvim-lua/plenary.nvim" },
		},
		config = function()
			local chat = require("CopilotChat")
			chat.setup({
				window = {
					layout = "vertical",
					width = 0.3,
				},
			})
			vim.cmd("Copilot disable")
			vim.keymap.set("n", "<leader>cc", chat.toggle, { desc = "Toggle Chat Window" })
			vim.keymap.set("n", "<leader>ce", ":Copilot enable<CR>", { desc = "Enable Copilot" })
			vim.keymap.set("n", "<leader>cd", ":Copilot disable<CR>", { desc = "Disable Copilot" })
			vim.keymap.set("n", "<leader>cpe", ":CopilotChatExplain<CR>", { desc = "Explain Code" })
			vim.keymap.set("n", "<leader>cpr", ":CopilotChatReview<CR>", { desc = "Review Code" })
			vim.keymap.set("n", "<leader>cpf", ":CopilotChatFix<CR>", { desc = "Fix Code" })
			vim.keymap.set("n", "<leader>cpo", ":CopilotChatOptimize<CR>", { desc = "Optimize Code" })
			vim.keymap.set("n", "<leader>cpd", ":CopilotChatDocs<CR>", { desc = "Generate Documentation" })
			vim.keymap.set("n", "<leader>cpt", ":CopilotChatTests<CR>", { desc = "Generate Tests" })
			vim.keymap.set("n", "<leader>cpD", ":CopilotChatTests<CR>", { desc = "Generate Tests" })
			vim.keymap.set("n", "<leader>cpc", ":CopilotChatCommit<CR>", { desc = "Generate Commit Message" })
			vim.keymap.set(
				"n",
				"<leader>cpC",
				":CopilotChatCommitStaged<CR>",
				{ desc = "Generate Staged Commit Message" }
			)
		end,
	},
}
