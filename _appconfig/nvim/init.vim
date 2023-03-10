set autoread

source $XDG_CONFIG_HOME/nvim/setup.extensions.vim

source $HOME/.config/nvim/extensions/treesitter.config.vim
source $HOME/.config/nvim/extensions/gitsigns.vim
source $HOME/.config/nvim/extensions/fuzzyfinder.vim
source $HOME/.config/nvim/extensions/trouble.vim


nnoremap <silent> gH    <cmd>:Telescope lsp_code_actions<CR>
nnoremap <silent> gW    <cmd>lua require('telescope').extensions.git_worktree.git_worktrees()<CR>
nnoremap <silent> <leader><c-w>    <cmd>lua require('telescope').extensions.git_worktree.create_git_worktree()<CR>
