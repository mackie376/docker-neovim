local fn = vim.fn

local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  BOOTSTRAP = fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
  vim.api.nvim_command('packadd packer.nvim')
end

return require('packer').startup({
  function(use)

    local config = function(name)
      return string.format('require("plugins.%s")', name)
    end

    --
    -- plugin manager
    --

    use({
      'wbthomason/packer.nvim',
      config = function()
        vim.api.nvim_command('autocmd BufWritePost plugins.lua source <afile> | PackerCompile')
      end,
    })

    --
    -- appearance
    --

    use({
      'EdenEast/nightfox.nvim',
      config = function()
        local nightfox = require('nightfox')
        nightfox.setup({
          fox = 'nightfox',
          transparent = true,
        })
        nightfox.load()
      end,
    })

    use({
      'nvim-lualine/lualine.nvim',
      requires = {
        'kyazdani42/nvim-web-devicons',
        'arkav/lualine-lsp-progress',
      },
      config = config('lualine'),
    })

    --
    -- basic
    --

    use('tpope/vim-commentary')
    use('tpope/vim-surround')
    use('machakann/vim-sandwich')
    use('simeji/winresizer')
    use('editorconfig/editorconfig-vim')

    use({
      'cohama/lexima.vim',
      setup = function()
        vim.g.lexima_ctrlh_as_backspace = 1
      end,
    })

    --
    -- move & search
    --

    use({
      'phaazon/hop.nvim',
      config = function()
        require('hop').setup({
          key = 'dhtnsbmwvzfgcrlaoeuipyqjkx'
        })
      end
    })

    use({
      'MattesGroeger/vim-bookmarks',
      setup = function()
        vim.g.bookmark_no_default_key_mappings = 1
      end,
    })

    --
    -- syntax highlighting
    --

    use({
      'nvim-treesitter/nvim-treesitter',
      config = function()
        require('nvim-treesitter.configs').setup({
          highlight = {
            enable = true,
          },
        })
      end,
    })

    --
    -- git
    --

    use('tpope/vim-fugitive')

    use({
      'lewis6991/gitsigns.nvim',
      requires = { 'nvim-lua/plenary.nvim' },
      config = function()
        require('gitsigns').setup()
      end,
    })

    --
    -- tools
    --

    use({ 'akinsho/toggleterm.nvim', config = config('toggleterm') })

    --
    -- auto completion / snippets
    --

    use({
      'hrsh7th/nvim-cmp',
      requires = {
        'hrsh7th/cmp-nvim-lsp',
        'hrsh7th/cmp-buffer',
        'hrsh7th/cmp-path',
        'hrsh7th/cmp-cmdline',
        'onsails/lspkind-nvim',
      },
      config = config('nvim-cmp'),
    })

    use({
      'hrsh7th/vim-vsnip',
      requires = {
        'hrsh7th/vim-vsnip-integ',
        { 'hrsh7th/cmp-vsnip', after = { 'nvim-cmp' } }
      },
      config = config('vsnip-cmp'),
    })

    --
    -- lsp
    --

    use({
      'williamboman/nvim-lsp-installer',
      requires = {
        'neovim/nvim-lspconfig',
      },
      after = {
        'cmp-nvim-lsp',
      },
      config = config('lsp'),
    })

    --
    -- telescope
    --

    use({
      'AckslD/nvim-neoclip.lua',
      config = function()
        require('neoclip').setup()
      end,
    })

    use({
      'nvim-telescope/telescope.nvim',
      requires = {
        'kyazdani42/nvim-web-devicons',
        'nvim-lua/plenary.nvim',
        'tom-anders/telescope-vim-bookmarks.nvim',
        'nvim-telescope/telescope-file-browser.nvim',
        'nvim-telescope/telescope-packer.nvim',
        { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' },
      },
      config = config('telescope'),
    })

    --
    -- bootstrap
    --

    if BOOTSTRAP then
      require('packer').sync()
    end

  end,
})
