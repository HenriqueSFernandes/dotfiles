lvim.builtin.lualine.style = "default"
lvim.builtin.nvimtree.active = false

lvim.plugins = {
  { "catppuccin/nvim", name = "catppuccin", priority = 1000, lazy = false },
  { "mhartington/formatter.nvim", name = "formatter", priority = 900},
{
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
  },
},
}

