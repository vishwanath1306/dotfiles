return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    -- Mason for managing LSP servers
    use 'williamboman/mason.nvim'
    use 'williamboman/mason-lspconfig.nvim'

    -- LSP
    use 'neovim/nvim-lspconfig'

    -- Rustaceanvim (modern replacement for rust-tools.nvim)
    use {
        'mrcjkb/rustaceanvim',
        version = '^5',
        ft = { 'rust' },
    }

    -- Completion framework
    use 'hrsh7th/nvim-cmp'

    -- LSP completion source
    use 'hrsh7th/cmp-nvim-lsp'

    -- Useful completion sources
    use 'hrsh7th/cmp-nvim-lua'
    use 'hrsh7th/cmp-nvim-lsp-signature-help'
    use 'hrsh7th/cmp-vsnip'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/vim-vsnip'

    -- Treesitter
    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate'
    }

    -- Debugging (nvim-dap instead of vimspector)
    use 'mfussenegger/nvim-dap'
    use 'rcarriga/nvim-dap-ui'
    use 'nvim-neotest/nvim-nio'

    -- Floating terminal
    use 'voldikss/vim-floaterm'

    -- Telescope (fuzzy finder)
    use {
        'nvim-telescope/telescope.nvim',
        requires = { {'nvim-lua/plenary.nvim'} }
    }

    -- Flash (modern replacement for hop.nvim)
    use 'folke/flash.nvim'

    -- File explorer
    use {
        'nvim-tree/nvim-tree.lua',
        requires = { 'nvim-tree/nvim-web-devicons' },
    }

    -- Todo comments
    use {
        'folke/todo-comments.nvim',
        requires = 'nvim-lua/plenary.nvim',
    }

    -- Trouble (diagnostics)
    use {
        'folke/trouble.nvim',
        requires = 'nvim-tree/nvim-web-devicons',
    }

    -- Indent guides
    use 'lukas-reineke/indent-blankline.nvim'

    -- Autopairs
    use 'windwp/nvim-autopairs'

    -- Surround
    use 'tpope/vim-surround'

    -- Illuminate (highlight word under cursor)
    use 'RRethy/vim-illuminate'

    -- Comment
    use 'numToStr/Comment.nvim'

    -- Themes
    use 'navarasu/onedark.nvim'

    -- Icons
    use 'nvim-tree/nvim-web-devicons'
end)
