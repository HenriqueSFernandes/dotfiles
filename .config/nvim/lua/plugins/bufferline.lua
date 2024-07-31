return {
  "akinsho/bufferline.nvim",
  after = "catppuccin",
  config = function()
    require("bufferline").setup({
      highlights = require("catppuccin.groups.integrations.bufferline").get(),
      options = {
        hover = {
          enabled = true,
          delay = 0,
          reveal = { "close" },
        },
      },
    })
    vim.keymap.set({"n", "v", "i"}, "<Tab>", ":BufferLineCycleNext<CR>")
    vim.keymap.set({"n", "v", "i"}, "<S-Tab>", ":BufferLineCyclePrev<CR>")
  end,
}
