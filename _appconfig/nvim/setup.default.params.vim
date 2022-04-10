" default options

set completeopt=menu,menuone,noselect " better autocomplete options
set mouse=a " if I accidentally use the mouse
set splitright " splits to the right
set splitbelow " splits below
set expandtab " space characters instead of tab
set tabstop=4 " tab equals 4 spaces
set shiftwidth=4 " indentation
set relativenumber " show relative line numbers
set ignorecase " search case insensitive
set smartcase " search via smartcase
set incsearch " search incremental
set diffopt+=vertical " starts diff mode in vertical split
set hidden " allow hidden buffers
set nobackup " don't create backup files
set nowritebackup " don't create backup files
set cmdheight=1 " only one line for commands
set shortmess+=c " don't need to press enter so often
set signcolumn=yes " add a column for sings (e.g. LSP, ...)
set updatetime=520 " time until update
set undofile " persists undo tree
set cursorline
set encoding=UTF-8
let g:airline_powerline_fonts = 1
set guifont=DroidSansMono\ Nerd\ Font:h11
filetype plugin indent on " enable detection, plugins and indents
if (has("termguicolors"))
  set termguicolors " better colors, but makes it sery slow!
endif
let g:netrw_banner=0 " disable banner in netrw
let g:netrw_liststyle=3 " tree view in netrw
let g:markdown_fenced_languages = ['javascript', 'js=javascript', 'json=javascript'] " syntax highlighting in markdown

" Plug 'windwp/nvim-autopairs'
lua << EOF
  require('nvim-autopairs').setup{}
EOF
