local function lspSymbol(name, icon)
  vim.fn.sign_define('DiagnosticSign' .. name,
    { text = icon, texthl = 'DiagnosticSign' .. name }
  )
end

lspSymbol('Error', '')
lspSymbol('Warn', '')
lspSymbol('Info', '')
lspSymbol('Hint', '')

-- Set up nvim-cmp.
local cmp = require 'cmp'

-- `/` global setup.
cmp.setup({
  snippet = {
    expand = function(args)
      vim.fn["UltiSnips#Anon"](args.body)
    end,
  },
  experimental = {
     ghost_text = { hl_group = 'CmpGhostText' }
  },
  window = {
    completion = {},
    documentation = {}
  },
  formatting = {
    fields = { 'kind', 'abbr', 'menu', },
    format = require("lspkind").cmp_format({
      with_text = false,
    })
  },
  mapping = cmp.mapping.preset.insert({
    ['<tab>'] = cmp.mapping.confirm({ select = true }),
    ['<C-e>'] = cmp.mapping.abort(),
  }),
  sources = {
    { name = 'path' },
    { name = 'ultisnips' },
  }
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources({
    { name = 'path' }
  })
})

-- Set configuration for specific lua.
cmp.setup.filetype('lua', {
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'nvim_lsp_signature_help' },
  })
})

-- Set configuration for specific rust.
cmp.setup.filetype('rust', {
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
  })
})

-- Set configuration for specific textfiles.
cmp.setup.filetype({ 'text', 'rst' }, {
  sources = cmp.config.sources({
    { name = 'buffer' },
  })
})

-- LSP configuration
local on_attach = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
  local bufopts = { noremap = true, silent = true, buffer = bufnr }
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
  vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
  vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
  vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
  vim.keymap.set('n', '<space>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, bufopts)
  vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
  vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
  vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
  vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
  vim.keymap.set('n', '<space>f', function() vim.lsp.buf.format { async = true } end, bufopts)
end

local cap_lsp = require 'cmp_nvim_lsp'.update_capabilities(vim.lsp.protocol.make_client_capabilities())

-- Setup lua LSP
require 'lspconfig'.rust_analyzer.setup {
  capabilities = cap_lsp,
  on_attach = on_attach
}

-- Setup lua LSP
require 'lspconfig'.sumneko_lua.setup {
  on_attach = on_attach,
  capabilities = cap_lsp,
  settings = {
    Lua = {
      runtime = {
        version = 'LuaJIT',
      },
      diagnostics = {
        globals = { 'vim' },
      },
      workspace = {
        library = vim.api.nvim_get_runtime_file("", true),
      },
      telemetry = {
        enable = false,
      },
    },
  },
}
