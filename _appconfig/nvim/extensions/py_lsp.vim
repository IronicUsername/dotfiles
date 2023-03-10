lua << EOF
require'py_lsp'.setup {
  -- This is optional, but allows to create virtual envs from nvim
  host_python = "/path/to/python/bin"
}
EOF
