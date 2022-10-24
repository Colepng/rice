vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- Post-install/update hook with neovim command
  use 'nvim-treesitter/nvim-treesitter'

  use 'github/copilot.vim'

  use {'hrsh7th/nvim-cmp','hrsh7th/cmp-buffer','hrsh7th/cmp-path','hrsh7th/cmp-cmdline','saadparwaiz1/cmp_luasnip',}   
	
  use {'L3MON4D3/LuaSnip', 'rafamadriz/friendly-snippets'}

  use 'Mofiqul/vscode.nvim'

  use 'nvim-telescope/telescope.nvim'

  use {'kyazdani42/nvim-tree.lua', require = {'nvim-tree/nvim-web-devicons'}}

end)

