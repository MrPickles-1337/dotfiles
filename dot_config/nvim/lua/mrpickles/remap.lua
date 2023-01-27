local map = vim.keymap.set
vim.g.mapleader = " "
map("n", "<leader>e", vim.cmd.Ex)

map("v", "K", ":m '<-2<CR>gv=gv")
map("v", "J", ":m '>+1<CR>gv=gv")

map("x", "<leader>p", "\"_dP")
map("n", "<leader>d", "\"_dP")
map("v", "<leader>d", "\"_dP")

map("n", "<leader>y", "\"+y")
map("v", "<leader>y", "\"+y")
map("n", "<leader>Y", "\"+y")

map("n", "<C-s>", ":w<CR>")

map("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

local opts = { noremap = true, silent = true }
map("n", '<A-,>', '<Cmd>BufferPrevious<CR>', opts)
map("n", '<A-.>', '<Cmd>BufferNext<CR>', opts)
map("n", '<A-1>', '<Cmd>BufferGoto 1<CR>', opts)
map("n", '<A-2>', '<Cmd>BufferGoto 2<CR>', opts)
map("n", '<A-3>', '<Cmd>BufferGoto 3<CR>', opts)
map("n", '<A-4>', '<Cmd>BufferGoto 4<CR>', opts)
map("n", '<A-5>', '<Cmd>BufferGoto 5<CR>', opts)
map("n", '<A-c>', '<Cmd>BufferClose<CR>', opts)
