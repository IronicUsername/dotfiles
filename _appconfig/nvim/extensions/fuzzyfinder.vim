" FZF
"
nnoremap <leader><space> :Telescope find_files<CR>
vnoremap <leader>fs "zy:Telescope live_grep default_text=<C-r>z<cr>
"nnoremap <leader>ff :Rg<CR>
nnoremap <leader>ff :Telescope live_grep<CR>
inoremap <expr> <c-x><c-f> fzf#vim#complete#path(
      \ "find . -path '*/\.*' -prune -o print \| sed '1d;s:^..::'",
      \ fzf#wrap({'dir': expand('%:p:h')}))
if has('nvim')
  au! TermOpen * tnoremap <buffer> <Esc> <c-\><c-n>
  au! FileType fzf tunmap <buffer> <Esc>
endif

autocmd BufWritePre * :%s/\s\+$//e

lua << EOF
    local telescope_import = require("telescope")
    telescope_import.load_extension("git_worktree")


    local telescope_actions = require("telescope.actions.set")

    local fixfolds = {
        hidden = true,
        theme="ivy",
        attach_mappings = function(_)
            telescope_actions.select:enhance({
                post = function()
                    vim.cmd(":normal! zx")
                end,
            })
            return true
        end,
    }
    -- local fb_actions = require "telescope".extensions.file_browser.actions
    -- mappings in file_browser extension of telescope.setup

    local actions = require("telescope.actions")
    local trouble = require("trouble.providers.telescope")

    telescope_import.setup {
        pickers = {
            buffers = fixfolds,
            find_files = fixfolds,
            git_files = fixfolds,
            grep_string = fixfolds,
            live_grep = fixfolds,
            oldfiles = fixfolds,
        },
        defaults = {
          mappings = {
            i = { ["<c-t>"] = trouble.open_with_trouble },
            n = { ["<c-t>"] = trouble.open_with_trouble },
          },
        },
        extensions = {
            media_files = {
                -- filetypes whitelist
                -- defaults to {"png", "jpg", "mp4", "webm", "pdf"}
                filetypes = {"png", "webp", "jpg", "jpeg"},
                find_cmd = "rg" -- find command (defaults to `fd`)
            }

       --  file_browser = {
       --    mappings = {
       --      ["n"] = {
       --        h = fb_actions.goto_parent_dir,
       --        l = actions.select_default
       --      }
       --    }
       --  }
        }
    }
EOF

fun! LspLocationList()
    "lua vim.lsp.diagnostic.setloclist({open_loclist = false})
endfun
augroup KIRILL_LSP
    autocmd!
    autocmd! BufWrite,BufEnter,InsertLeave * :call LspLocationList()
augroup END
