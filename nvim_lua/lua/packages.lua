require('packer').startup(function()
    use 'wbthomason/packer.nvim'

    -- LSP servers 
    use 'neovim/nvim-lspconfig'
    use 'williamboman/nvim-lsp-installer'

    -- Auto complition
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-cmdline'
    use 'hrsh7th/nvim-cmp'

    -- powerline 
    use 'glepnir/galaxyline.nvim'

    -- to comment out code 
    use 'tpope/vim-commentary'

    -- telescope
    use {
    'nvim-telescope/telescope.nvim', tag = '0.1.0',
    requires = { {'nvim-lua/plenary.nvim'} }
    }
    use 'BurntSushi/ripgrep'

    -- Color code more beatifuly
    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate'
    }
    -- colorschemes
    use 'morhetz/gruvbox'
    use 'projekt0n/github-nvim-theme'

    -- icons
    use 'ryanoasis/vim-devicons'

    -- todo syntax
    use {
        "folke/todo-comments.nvim",
        requires = "nvim-lua/plenary.nvim",
        config = function()
        require("todo-comments").setup {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
        }
    end
    }

    -- tree
    use {
        'kyazdani42/nvim-tree.lua',
        requires = {
        'kyazdani42/nvim-web-devicons', -- optional, for file icons
        },
        tag = 'nightly' -- optional, updated every week. (see issue #1193)
    }


end)

