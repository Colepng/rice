vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- Post-install/update hook with neovim command
  use {
      'nvim-treesitter/nvim-treesitter',
      run = function()
          local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
          ts_update()
      end,}

  use 'github/copilot.vim'

  use 'Mofiqul/vscode.nvim'

  use {
      'nvim-telescope/telescope.nvim', tag = '0.1.1',
      -- or                            , branch = '0.1.x',
      requires = { {'nvim-lua/plenary.nvim'} }
  }
  use {'kyazdani42/nvim-tree.lua', require = {'nvim-tree/nvim-web-devicons'}}

  use "terrortylor/nvim-comment"
  use("mbbill/undotree")

  use({
      "iamcco/markdown-preview.nvim",
      run = function() vim.fn["mkdp#util#install"]() end,
  })
  
  use { 'AlphaTechnolog/pywal.nvim', as = 'pywal' }
  use {
      'VonHeikemen/lsp-zero.nvim',
      branch = 'v1.x',
      requires = {
          -- LSP Support
          {'neovim/nvim-lspconfig'},
          {'williamboman/mason.nvim'},
          {'williamboman/mason-lspconfig.nvim'},

          -- Autocompletion
          {'hrsh7th/nvim-cmp'},
          {'hrsh7th/cmp-buffer'},
          {'hrsh7th/cmp-path'},
          {'hrsh7th/cmp-cmdline'},
          {'saadparwaiz1/cmp_luasnip'},
          {'hrsh7th/cmp-nvim-lsp'},
          {'hrsh7th/cmp-nvim-lua'},

          -- Snippets
          {'L3MON4D3/LuaSnip'},
          {'rafamadriz/friendly-snippets'},
      }
  }

  use {'romgrk/barbar.nvim', requires = {
      'lewis6991/gitsigns.nvim', -- OPTIONAL: for git status
      'nvim-tree/nvim-web-devicons', -- OPTIONAL: for file icons
  }}

  -- use 'elkowar/yuck.vim'

  use 'lervag/vimtex'

  -- dashboard
  use {
      'glepnir/dashboard-nvim',
      event = 'VimEnter',
      config = function()
	      require('dashboard').setup {
		      theme = 'hyper',
		      config = {
			      -- week_header = {
			      -- 				      enable = true,
			      -- },
			      shortcut = {
				      -- { desc = '󰊳 Update', group = '@property', action = 'Lazy update', key = 'u' },
				      {
					      icon = ' ',
					      icon_hl = '@variable',
					      desc = 'Files',
					      group = 'Label',
					      action = 'Telescope find_files',
					      key = 'f',
				      },
                      {
                          icon = '',
					      icon_hl = '@variable',
					      group = 'Label',
                          desc = 'Find word',
                          action = 'Telescope live_grep',
                          key = 'g',
                      },
				      -- {
				      -- 					      desc = ' Apps',
				      -- 					      group = 'DiagnosticHint',
				      -- 					      action = 'Telescope app',
				      -- 					      key = 'a',
				      -- },
				      -- {
				      -- 					      desc = ' dotfiles',
				      -- 					      group = 'Number',
				      -- 					      action = 'Telescope dotfiles',
				      -- 					      key = 'd',
				      -- },
			      },
                  footer = { '', 'Blazing Fast' }
		      },
	      }
      end,
      requires = {'nvim-tree/nvim-web-devicons'}
  }
end)

