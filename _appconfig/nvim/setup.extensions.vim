" auto download plugin manager
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin()
  Plug 'HallerPatrick/py_lsp.nvim'
  "Plug 'neoclide/coc.nvim', {'branch': 'release'}
  Plug 'szw/vim-maximizer'
  Plug 'kassio/neoterm'
  Plug 'tpope/vim-commentary'
  Plug 'sbdchd/neoformat'
  Plug 'tpope/vim-fugitive'
  Plug 'airblade/vim-gitgutter'
  Plug 'neovim/nvim-lspconfig'

  Plug 'hrsh7th/cmp-nvim-lsp'
  Plug 'hrsh7th/cmp-buffer'
  Plug 'hrsh7th/cmp-path'
  Plug 'hrsh7th/cmp-cmdline'
  Plug 'hrsh7th/cmp-vsnip'
  Plug 'hrsh7th/nvim-cmp'
  Plug 'hrsh7th/vim-vsnip'
  Plug 'hrsh7th/vim-vsnip-integ'
  Plug 'hrsh7th/vim-vsnip'

  Plug 'vimwiki/vimwiki'
  Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
  Plug 'nvim-telescope/telescope.nvim'
  Plug 'nvim-telescope/telescope-fzy-native.nvim'
  Plug 'nvim-lua/popup.nvim'
  Plug 'nvim-lua/plenary.nvim'
  Plug 'heavenshell/vim-jsdoc', {
    \ 'for': ['javascript', 'javascript.jsx','typescript'],
    \ 'do': 'make install'
  \}
  Plug 'alaviss/nim.nvim'
  Plug 'lewis6991/gitsigns.nvim'
  Plug 'folke/tokyonight.nvim', {'branch': 'main'}
  Plug 'mfussenegger/nvim-dap'
  " Plug 'rcarriga/nvim-dap-ui'
  Plug 'nvim-telescope/telescope-dap.nvim'
  Plug 'theHamsta/nvim-dap-virtual-text'
  Plug 'Mofiqul/vscode.nvim'
  Plug 'hoob3rt/lualine.nvim'
  Plug 'TimUntersberger/neogit'
  Plug 'sindrets/diffview.nvim'
  Plug 'projekt0n/github-nvim-theme'
  Plug 'David-Kunz/jester'
  Plug 'vhyrro/neorg'
  Plug 'folke/zen-mode.nvim'
  Plug 'Mofiqul/dracula.nvim'
  Plug 'morhetz/gruvbox'
  Plug 'junegunn/fzf', {'dir': '~/.fzf', 'do': './install -all'}
  Plug 'junegunn/fzf.vim'
  Plug 'kyazdani42/nvim-web-devicons'
  Plug 'ryanoasis/vim-devicons'
  Plug 'romgrk/barbar.nvim'
  Plug 'tpope/vim-surround'
  Plug 'kyazdani42/nvim-web-devicons' " for file icons
  Plug 'kyazdani42/nvim-tree.lua'
  Plug 'smithbm2316/centerpad.nvim'
  Plug 'ayu-theme/ayu-vim'
  Plug 'lifepillar/vim-solarized8'
  Plug 'ianks/vim-tsx'
  Plug 'ThePrimeagen/git-worktree.nvim'
  Plug 'simrat39/rust-tools.nvim'
  Plug 'simrat39/symbols-outline.nvim'
  Plug 'ThePrimeagen/harpoon'
  Plug 'windwp/nvim-autopairs'
"  Plug 'yamatsum/nvim-cursorline'
  Plug 'folke/trouble.nvim'
  Plug 'cliuj/vim-dark-meadow'
  Plug 'lukas-reineke/indent-blankline.nvim'
call plug#end()
