return require('packer').startup(function()
  -- Packer can manage itself
    use 'wbthomason/packer.nvim'
    use "lukas-reineke/indent-blankline.nvim"
    use {
        'folke/tokyonight.nvim',
        config = function() require'tokyonight'.setup {
            style = 'night'
        } end
    }
    use {
      'nvim-lualine/lualine.nvim',
      requires = { 'kyazdani42/nvim-web-devicons', opt = true }
    }
    use {"L3MON4D3/LuaSnip", tag = "v1.*"}
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-cmdline'
    use 'hrsh7th/nvim-cmp'

    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate',
        config = function() require'nvim-treesitter.configs'.setup {
            ensure_installed = {
                "python",
                "rust",
                "cpp",
                "javascript",
                "typescript",
                "css",
                "html",
                "bash",
                "c",
            },
            sync_install = false,
        }
        end
    }
    use 'windwp/nvim-ts-autotag'
    use {
      'nvim-telescope/telescope.nvim', tag = '0.1.0',
    -- or                            , branch = '0.1.x',
      requires = { {'nvim-lua/plenary.nvim'} }
    }
    use {
        'nvim-telescope/telescope-fzf-native.nvim',
        run = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build'
    }

    use {
        'folke/which-key.nvim',
        config = function() require'which-key'.setup{} end
    }

    use 'mattn/emmet-vim'
    use {
		'akinsho/bufferline.nvim', tag = 'v2.*',
		requires = 'kyazdani42/nvim-web-devicons',
		config = function () require'bufferline'.setup{} end
	}
    use 'machakann/vim-sandwich'
    use 'rafamadriz/friendly-snippets'
    use 'jiangmiao/auto-pairs'
    use 'saadparwaiz1/cmp_luasnip'
	use {
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		"neovim/nvim-lspconfig",
		'mhartington/formatter.nvim'
	}
end)

-- Plug 'neovim/nvim-lspconfig'
-- Plug('dense-analysis/ale')
-- Plug('j-hui/fidget.nvim')
-- Plug('nvim-treesitter/nvim-treesitter', {['do'] = vim.fn['TSUpdate']})
-- Plug('ojroques/nvim-hardline')
-- Plug('jiangmiao/auto-pairs')
-- Plug('machakann/vim-sandwich')
-- Plug('simrat39/symbols-outline.nvim')
-- Plug('mattn/emmet-vim')
-- Plug('tpope/vim-vinegar')
-- Plug('nvim-lua/plenary.nvim')
-- Plug('kyazdani42/nvim-web-devicons')
-- Plug('nvim-telescope/telescope.nvim', {['tag'] = '0.1.0' })
-- Plug('nvim-telescope/telescope-fzf-native.nvim', {['do'] = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build' })
-- Plug('kyazdani42/nvim-web-devicons')
-- Plug('akinsho/bufferline.nvim', {['tag'] = 'v2.*' })
-- Plug('folke/tokyonight.nvim', {['branch'] = 'main' })
-- Plug('folke/which-key.nvim')
