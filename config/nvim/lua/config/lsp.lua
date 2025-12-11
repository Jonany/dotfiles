-- this prevents warnings about global vim usage
--{
--  'folke/lazydev.nvim',
--  ft = 'lua', -- only load on lua files
--  opts = {
--    library = {
--      -- See the configuration section for more details
--      -- Load luvit types when the `vim.uv` word is found
--      { path = '${3rd}/luv/library', words = { 'vim%.uv' } },
--    },
--  },
--},

vim.lsp.config['clangd'] = {
  cmd = { 'clangd', '--clang-tidy', '--enable-config', '--fallback-style=WebKit' },
  filetypes = { 'c', 'cpp', 'objc', 'objcpp', 'cuda' },
  root_markers = {
    '.clangd',
    '.clang-tidy',
    '.clang-format',
    'compile_commands.json',
    'compile_flags.txt',
    'configure.ac', -- AutoTools
    '.git',
  },
  capabilities = {
    textDocument = {
      completion = {
        editsNearCursor = true,
      },
    },
    offsetEncoding = { 'utf-8', 'utf-16' },
  },
}
vim.lsp.config['lua_ls'] = {
  cmd = { 'lua-language-server' },
  filetypes = { 'lua' },
  root_markers = { { '.luarc.json', '.luarc.jsonc' }, '.git' },
  settings = {
    Lua = {
      runtime = {
        version = 'LuaJIT',
      }
    }
  },
}
vim.lsp.config['tinymist'] = {
  cmd = { 'tinymist' },
  filetypes = { 'typst' },
  root_markers = { '.git' },
  settings = {
    formatterMode = 'typstyle',
    exportPdf = 'onType',
    semanticTokens = 'disable'
  }
}

vim.lsp.enable('clangd')
vim.lsp.enable('lua_ls')
vim.lsp.enable('tinymist')

vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(args)
    local client = assert(vim.lsp.get_client_by_id(args.data.client_id))
    -- Enable auto-completion. Note: Use CTRL-Y to select an item. |complete_CTRL-Y|
    vim.cmd [[set completeopt+=menuone,noselect,popup]]
    if client:supports_method('textDocument/completion') then
      vim.lsp.completion.enable(true, client.id, args.buf, { autotrigger = false })
    end

    -- Auto-format ('lint') on save.
    -- Usually not needed if server supports 'textDocument/willSaveWaitUntil'.
    if not client:supports_method('textDocument/willSaveWaitUntil')
        and client:supports_method('textDocument/formatting') then
      vim.api.nvim_create_autocmd('BufWritePre', {
        buffer = args.buf,
        callback = function()
          vim.lsp.buf.format({ bufnr = args.buf, id = client.id, timeout_ms = 1000 })
        end,
      })
    end
  end,
})
