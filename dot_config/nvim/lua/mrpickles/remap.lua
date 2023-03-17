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
