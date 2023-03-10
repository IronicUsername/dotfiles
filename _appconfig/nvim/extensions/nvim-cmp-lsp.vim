lua <<EOF
  -- Setup nvim-cmp.
  local cmp = require'cmp'

  -- THE COMPLETION CONFIGURATION
  cmp.setup({
    snippet = {
      -- REQUIRED - you must specify a snippet engine
      expand = function(args)
        vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
        -- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
        -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
        -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
      end,
    },
    mapping = {
      ['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
      ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
      ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
      ['<C-y>'] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
      ['<C-e>'] = cmp.mapping({
        i = cmp.mapping.abort(),
        c = cmp.mapping.close(),
      }),
      ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    },
    sources = cmp.config.sources({
      { name = 'nvim_lsp' },
      { name = 'vsnip' }, -- For vsnip users.
      { name = 'path' },
      { name = 'buffer'},
      -- { name = 'luasnip' }, -- For luasnip users.
      -- { name = 'ultisnips' }, -- For ultisnips users.
      -- { name = 'snippy' }, -- For snippy users.
    }, {
      { name = 'buffer' },
    })
  })

  -- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline('/', {
    sources = {
      { name = 'buffer' }
    }
  })

  -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline(':', {
    sources = cmp.config.sources({
      { name = 'path' }
    }, {
      { name = 'cmdline' }
    })
  })

  -- Setup lspconfig.
  local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
  -- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
  local lspconfig = require('lspconfig')
  lspconfig.tsserver.setup {
    capabilities = capabilities
  }
  lspconfig.pyright.setup {
   capabilities = capabilities,
   handlers = {
       ["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
           signs = true,
           underline = true,
           update_in_insert = true
       })
   },
   settings = {
         python = {
           analysis = {
             typeCheckingMode = "off",
             autoSearchPaths = true,
             useLibraryCodeForTypes = true
           }
         }
       }
  }
  -- lspconfig.vuels.setup {
  --  capabilities = capabilities,
  -- }
  lspconfig.rust_analyzer.setup {
    capabilities=capabilities,
    settings = {
     ["rust-analyzer"] = {
       -- enable clippy diagnostics on save
       checkOnSave = {
         command = "clippy"
       },
     }
    }
  }

    -- local extension_path = '/Users/kirilldogadin/.vscode/extensions/vadimcn.vscode-lldb-1.6.10'
    -- local codelldb_path = extension_path .. 'adapter/codelldb'
    -- local liblldb_path = extension_path .. 'lldb/lib/liblldb.dylib'

require('rust-tools').setup({
    dap = {
        -- adapter = require('rust-tools.dap').get_codelldb_adapter(
        -- codelldb_path, liblldb_path)
    },
    debuggables = {
        -- whether to use telescope for selection menu or not
        use_telescope = true

        -- rest of the opts are forwarded to telescope
    },
    runnables = {
        -- whether to use telescope for selection menu or not
        use_telescope = true

        -- rest of the opts are forwarded to telescope
    },
    server = {
        -- standalone file support
        -- setting it to false may improve startup time
        standalone = true,
    }, -- rust-analyer options
})
EOF
