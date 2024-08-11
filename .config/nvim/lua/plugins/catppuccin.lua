return {
  "catppuccin/nvim",
  name = "catppuccin",
  priority = 1000,
  config = function()
    require("catppuccin").setup({
      flavour = "mocha",
      transparent_background = true,
      integrations = {
        markdown = true,
        mason = false,
        neotree = true,
        harpoon = true,
        alpha = true,
        cmp = true,
        nvim_surround = true,
        which_key = true,
      },
    })
    vim.cmd.colorscheme("catppuccin")
  end,
}
