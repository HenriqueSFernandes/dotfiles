return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  opts = {
  },
  keys = {},
  config = function()
    local wk = require("which-key")
    wk.add({
      { "<leader>c",  group = "Copilot" },
      { "<leader>cp", group = "Prompts" },
      { "<leader>x",  group = "Trouble" },
      { "<leader>t",  group = "Test" },
      { "<leader>f",  group = "Flutter" },
      { "<leader>g",  group = "Git" },
    })
  end,
}
