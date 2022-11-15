vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function()
	use 'wbthomason/packer.nvim'
  use 'folke/tokyonight.nvim'
  use 'williamboman/mason.nvim'
end)
