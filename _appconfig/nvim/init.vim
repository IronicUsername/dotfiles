set autoread


source $XDG_CONFIG_HOME/nvim/setup.extensions.vim
source $XDG_CONFIG_HOME/nvim/setup.default.params.vim

" hotkeys casual
nnoremap <leader>v :e $MYVIMRC<CR>
noremap <leader>fd "*y<CR>

" select and search
vnoremap // y/\V<C-R>=escape(@",'/\')<CR><CR>

let g:neovide_cursor_vfx_mode = "railgun"

" COLOR SCHEME
set termguicolors     " enable true colors support

" let ayucolor="mirage"   " can do `mirage`, `light`, `dark`
" colorscheme ayu
"
" colorscheme gruvbox
"
" colorscheme dracula
"
" set background=light  " can do `dark` or `light`
" colorscheme solarized8
" colorscheme solarized8_high
" colorscheme solarized8_low
" colorscheme solarized8_flat
lua << EOF
    -- The theme comes in three styles, `storm`, a darker variant `night` and `day`.
    vim.g.tokyonight_style = "night"
EOF
colorscheme tokyonight
"
" HIGHLIGHT YANK
augroup highlight_yank
    autocmd!
    au TextYankPost * silent! lua vim.highlight.on_yank { higroup='IncSearch', timeout=200 }
augroup END
" Plug 'yamatsum/nvim-cursorline'
lua << EOF
    -- vim.g.cursorline_timeout = "0"
    -- vim.g.cursorword_highlight = false
EOF

source $XDG_CONFIG_HOME/nvim/extensions/gitsigns.vim
source $XDG_CONFIG_HOME/nvim/extensions/lualine.vim
source $XDG_CONFIG_HOME/nvim/extensions/vim-maximizer.vim
source $XDG_CONFIG_HOME/nvim/extensions/neoterm.vim

nnoremap <c-q> :Ttoggle<CR>
inoremap <c-q> <Esc>:Ttoggle<CR>
tnoremap <c-q> <c-\><c-n>:Ttoggle<CR>
nnoremap <leader>x :TREPLSendLine<CR>
vnoremap <leader>x :TREPLSendSelection<CR>
nnoremap <leader>gd :Gvdiff<CR>
nnoremap <leader>ah :diffget //2<CR>
nnoremap <leader>al :diffget //3<CR>
if has('nvim')
  au! TermOpen * tnoremap <buffer> <Esc> <c-\><c-n>
endif
nnoremap <leader>p :Neoformat<CR>
nnoremap <leader>j :Neoformat prettier<CR>

source $XDG_CONFIG_HOME/nvim/extensions/fuzzyfinder.vim
source $XDG_CONFIG_HOME/nvim/extensions/nvim-cmp-lsp.vim
source $XDG_CONFIG_HOME/nvim/extensions/volar-lsp.vim

nnoremap <silent> gd <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> gh     <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> gH    <cmd>:Telescope lsp_code_actions<CR>
nnoremap <silent> gD    <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> <c-k> <cmd>lua vim.lsp.buf.signature_help()<CR>
nnoremap <silent> gr    <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> gR    <cmd>lua vim.lsp.buf.rename()<CR>
" List worktrees:
nnoremap <silent> gW    <cmd>lua require('telescope').extensions.git_worktree.git_worktrees()<CR>
nnoremap <silent> <leader><c-w>    <cmd>lua require('telescope').extensions.git_worktree.create_git_worktree()<CR>

source $XDG_CONFIG_HOME/nvim/extensions/tabs.shortcut.vim
source $XDG_CONFIG_HOME/nvim/extensions/nvimtree.config.vim

nnoremap <leader>q :NvimTreeToggle<CR>
nnoremap <leader>ft :NvimTreeFindFile<CR>
nnoremap <silent><leader>z <cmd>Centerpad<cr>

source $XDG_CONFIG_HOME/nvim/extensions/config.tsx.vim

source $XDG_CONFIG_HOME/nvim/extensions/treesitter.config.vim
source $XDG_CONFIG_HOME/nvim/extensions/symbol.tree.config.vim
source $XDG_CONFIG_HOME/nvim/extensions/harpoon.vim
source $XDG_CONFIG_HOME/nvim/extensions/trouble.vim
source $XDG_CONFIG_HOME/nvim/extensions/indent_blankline.vim


vnoremap <silent> <Space>cc "+y <CR>
vnoremap <silent> <Space>cv "0y <CR>
nnoremap <silent> <Space>p "0p <CR>

nnoremap <silent> <Space>u <cmd>:lnext<CR>
nnoremap <silent> <Space>i <cmd>:lprev<CR>
nnoremap <silent> <Space>n <cmd>:cnext<CR>
nnoremap <silent> <Space>m <cmd>:cprev<CR>
