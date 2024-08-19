-- vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.cmd("set number")
vim.cmd("set rnu")
vim.cmd("autocmd InsertEnter * :set nornu")
vim.cmd("autocmd InsertLeave * :set rnu")
vim.cmd("set mousemoveevent")
vim.cmd("set whichwrap+=<,>,[,]")

vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

vim.keymap.set("i", "<M-CR>", "<Esc>A;<Esc>o")
vim.keymap.set("i", "<S-CR>", "<Esc>A;<Esc>a")
vim.keymap.set("n", "<M-CR>", "<Esc>A;<Esc>j")
vim.keymap.set("n", "<S-CR>", "<Esc>A;<Esc>")
vim.keymap.set("n", "<leader>n", "<cmd>nohls<cr>", { desc = "Hide search results" })

vim.cmd("autocmd BufNewFile,BufRead *.ejs set filetype=html")
