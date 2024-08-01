reload("user.options")
reload("user.plugins")
reload("user.keybinds")

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


