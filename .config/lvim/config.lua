-- Read the docs: https://www.lunarvim.org/docs/configuration
-- Video Tutorials: https://www.youtube.com/watch?v=sFA9kX-Ud_c&list=PLhoH5vyxr6QqGu0i7tt_XoVK9v-KvZ3m6
-- Forum: https://www.reddit.com/r/lunarvim/
-- Discord: https://discord.com/invite/Xb9B4Ny
-- install plugins
lvim.plugins = {
  {
    "nvim-neorg/neorg",
    build = ":Neorg sync-parsers",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("neorg").setup {
        load = {
          ["core.defaults"] = {}, -- Loads default behaviour
          ["core.concealer"] = {}, -- Adds pretty icons to your documents
          ["core.dirman"] = { -- Manages Neorg workspaces
            config = {
              workspaces = {
                aed = "~/Desktop/aed/notes",
                bd = "~/Desktop/bd/notes/",
                iadp = "~/Desktop/iadp/notes/",
                so = "~/Desktop/so/notes/",
                ldts = "~/Desktop/ldts/notes/"
              },
            },
          },
        },
      }
    end,
  },
  { "catppuccin/nvim", name = "catppuccin", priority = 1000 },
  { "mhartington/formatter.nvim", name = "formatter", priority = 900},
}

local formatters = require "lvim.lsp.null-ls.formatters"
formatters.setup {
  { name = "black" },
}

local linters = require "lvim.lsp.null-ls.linters"
linters.setup {
  { name = "flake8" },
  {
    name = "shellcheck",
    args = { "--severity", "warning" },
  },
}

lvim.transparent_window = true
