
" auto download plugin manager
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin()
  Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
  Plug 'nvim-treesitter/playground'

  Plug 'nvim-telescope/telescope.nvim'
  Plug 'nvim-telescope/telescope-fzy-native.nvim'
  Plug 'nvim-telescope/telescope-dap.nvim'
  Plug 'nvim-lua/popup.nvim'
  Plug 'nvim-lua/plenary.nvim'

  Plug 'ThePrimeagen/git-worktree.nvim'
  Plug 'lewis6991/gitsigns.nvim'

  " SLPs
  Plug 'neovim/nvim-lspconfig'
  Plug 'HallerPatrick/py_lsp.nvim'

  Plug 'junegunn/fzf', {'dir': '~/.fzf', 'do': './install -all'}
  Plug 'junegunn/fzf.vim'


  Plug 'folke/trouble.nvim'
call plug#end()
