vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2

require("luasnip.loaders.from_vscode").lazy_load({ paths = { "./freezed" } })
