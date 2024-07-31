return {
  "akinsho/toggleterm.nvim",
  version = "*",
  opts = {},
  config = function()
    local toggleterm = require("toggleterm")

    toggleterm.setup({
      shade_filetypes = false,
    })

    function _G.toggle_terminal()
      if vim.api.nvim_get_mode().mode == "t" then
        vim.api.nvim_input("<C-\\><C-n>:ToggleTerm<CR>")
      else
        vim.api.nvim_command("ToggleTerm")
      end
    end

    vim.keymap.set("n", "<leader>t", ":lua toggle_terminal()<CR>", { noremap = true, silent = true })

    vim.keymap.set("t", "<leader>t", "<C-\\><C-n>:lua toggle_terminal()<CR>", { noremap = true, silent = true })
  end,
}
