vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.cmd("set number")
vim.cmd("set rnu")
vim.cmd("autocmd InsertEnter * :set nornu")
vim.cmd("autocmd InsertLeave * :set rnu")

vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

