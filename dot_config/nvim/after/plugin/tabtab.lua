require("bufferline").setup {
    animation = true,
    auto_hide = false,
    closeable = false,
}

local map = vim.keymap.set
local opts = { noremap = true, silent = true }
map("n", '<A-h>', '<Cmd>BufferPrevious<CR>', opts)
map("n", '<A-l>', '<Cmd>BufferNext<CR>', opts)
map("n", '<A-1>', '<Cmd>BufferGoto 1<CR>', opts)
map("n", '<A-2>', '<Cmd>BufferGoto 2<CR>', opts)
map("n", '<A-3>', '<Cmd>BufferGoto 3<CR>', opts)
map("n", '<A-4>', '<Cmd>BufferGoto 4<CR>', opts)
map("n", '<A-5>', '<Cmd>BufferGoto 5<CR>', opts)
map("n", '<A-c>', '<Cmd>BufferClose<CR>', opts)
