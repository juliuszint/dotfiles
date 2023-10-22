--------------------------
-- core NVIM configuration
--------------------------
vim.opt.encoding = "utf8"
vim.opt.number = true
vim.opt.wrap = false
vim.opt.cursorline = true
vim.opt.swapfile = false
vim.opt.clipboard = "unnamedplus"
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.termguicolors = true
vim.opt.completeopt = { "menu", "menuone", "noselect"}
vim.opt.listchars:append({ tab = "» " })
vim.opt.shm:append("I")
vim.opt.cinoptions = "N-s,g0"
vim.opt.title = true
vim.opt.list = true
vim.opt.fillchars:append({diff = " "})
vim.opt.diffopt:append({ algorithm = "histogram" }, { "indent-heuristic" })
vim.opt.mouse = ""
vim.opt.fixendofline = false
vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.g.mapleader = "<space>"
vim.api.nvim_create_user_command('Vb', ':normal! <C-v>', {})

vim.keymap.set('n', '<C-s>', '<cmd>w<cr>')
vim.keymap.set('n', '<Space>s', '<cmd>w<cr>')
vim.keymap.set('n', 'gnh', '<cmd>noh<cr>')
vim.keymap.set('n', '<C-n>', '<cmd>cn<cr>')
vim.keymap.set('n', '<C-p>', '<cmd>cp<cr>')
vim.keymap.set('n', '<Space>v', '<cmd>vsp<cr>')
vim.keymap.set('n', '<Space>a', '<cmd>A<cr>')
vim.keymap.set('n', 'gj', '<C-w>j')
vim.keymap.set('n', 'gk', '<C-w>k')
vim.keymap.set('n', 'gl', '<C-w>l')
vim.keymap.set('n', 'gh', '<C-w>h')
vim.keymap.set('i', '<C-s>', '<esc><cmd>w<cr>')
vim.keymap.set('v', 'p', '"_dP')
vim.keymap.set('v', '<Tab>', '> gv')
vim.keymap.set('v', '<S-Tab>', '< gv')
vim.keymap.set('t', '<Esc>', '<C-\\><C-n>')
vim.keymap.set('t', '<C-v><Esc>', '<Esc>')

vim.api.nvim_create_autocmd({"TermOpen"}, {
  command = "setlocal nonumber",
})
vim.api.nvim_create_autocmd({"VimEnter"}, {
  command = "clearjumps",
})
vim.api.nvim_create_autocmd({"FileType"}, {
  pattern = {"qf"},
  command = "wincmd J|resize 15|setlocal nocursorline",
})

vim.cmd.colorscheme("mine")

-------------
-- plugin FZF
-------------
vim.opt.rtp:append("/usr/local/opt/fzf")
vim.keymap.set('n', '<Space>h', '<cmd>History:<cr>')
vim.keymap.set('n', '<Space>c', '<cmd>Commands<cr>')
vim.keymap.set('n', '<Space>b', '<cmd>Buffers<cr>')
vim.keymap.set('n', '<Space>f', '<cmd>Files<cr>')
vim.keymap.set('n', '<Space>j', '<cmd>Jumps<cr>')

vim.api.nvim_create_autocmd({"FileType"}, {
  pattern = {"fzf"},
  callback = function() vim.keymap.set('t', '<esc>', '<esc>', { buffer = true }) end,
})

------------------
-- plugin devicons
------------------
vim.g.WebDevIconsUnicodeDecorateFolderNodesExactMatches = 0
vim.g.WebDevIconsUnicodeDecorateFolderNodes = 1
vim.g.WebDevIconsUnicodeDecorateFileNodesExtensionSymbols = { cs = '󰌛' }
vim.g.DevIconsEnableFoldersOpenClose = 1
vim.g.DevIconsDefaultFolderOpenSymbol=''
vim.g.WebDevIconsUnicodeDecorateFolderNodesDefaultSymbol=''

-----------------
-- plugin airline
-----------------
vim.g.airline_theme='google_dark'

------------------
-- plugin NERDTree
------------------
vim.g.NERDTreeHijackNetrw = 1
vim.g.NERDTreeDirArrowCollapsible = ''
vim.g.NERDTreeDirArrowExpandable = ''
vim.g.NERDTreeCreatePrefix = 'silent keepalt keepjumps'
vim.g.NERDTreeMinimalUI = 1
vim.g.NERDTreeCascadeSingleChildDir = 0
vim.g.NERDTreeIgnore = { '.*obj$[[dir]]', '.*bin$[[dir]]', '__pycache__$[[dir]]' }
vim.keymap.set('n', '<Space>e', '<cmd>e .<cr>')

vim.api.nvim_create_autocmd({"FileType"}, {
  pattern = {"nerdtree"},
  command = "syntax match NERDTreeDirSlash #/$# containedin=NERDTreeDir conceal contained",
})

local function nerdTreeHighlightSymbol(symbol, highlight, guifg)
  vim.api.nvim_create_autocmd({"FileType"}, {
    pattern = {"nerdtree"},
    command = string.format("highlight %s guifg=%s", highlight, guifg),
  })
  vim.api.nvim_create_autocmd({"FileType"}, {
    pattern = {"nerdtree"},
    command = string.format("syn match %s /%s/ containedin=NERDTreeFlags", highlight, symbol),
  })
end

nerdTreeHighlightSymbol('  ', 'folder_icon_open', '#41a2f1')
nerdTreeHighlightSymbol('  ', 'folder_icon_close', '#41a2f1')
nerdTreeHighlightSymbol('  ', 'script_icon', '#834f79')
nerdTreeHighlightSymbol('  ', 'python_icon', '#f09f17')
nerdTreeHighlightSymbol('  ', 'json_icon', '#f5c06f')
nerdTreeHighlightSymbol('  ', 'cxx_source_icon', '#689fb6')
nerdTreeHighlightSymbol('  ', 'cxx_header_icon', '#ae403f')
nerdTreeHighlightSymbol('  ', 'vim_icon', '#8faa54')
nerdTreeHighlightSymbol('  ', 'rust_icon', '#f16526')
nerdTreeHighlightSymbol('  ', 'solution_icon', '#d294e2')
nerdTreeHighlightSymbol(' 󰌛 ', 'csharp_icon', '#88d184')

-----------------
-- nvim-autopairs
-----------------
require('nvim-autopairs').setup({
  disable_in_visualblock = true,
})

------------------
-- plugin TmuxLine
------------------
vim.g.tmuxline_separators = {
     left = '',
     left_alt = '',
     right = '',
     right_alt = '',
     space = ' '
}

-----------------
-- plugin NeoTerm
-----------------
vim.g.neoterm_automap_keys = '<space>tt'

-------------------
-- plugin UltiSnips
-------------------
vim.g.UltiSnipsJumpForwardTrigger = '<c-n>'
vim.g.UltiSnipsJumpBackwardTrigger = '<c-p>'

---------------------------
-- plugin better-whitespace
---------------------------
vim.g.better_whitespace_filetypes_blacklist = { 'eml', 'mail', 'gitsendemail' }

--------------------
-- plugin cursorword
--------------------
vim.g.cursorword_delay = 800
vim.g.cursorwordu = 0

-----------
-- plugin A
-----------
vim.g.alternateNoDefaultAlternate = 1

----------------------
-- plugin EditorConfig
----------------------
vim.g.EditorConfig_exclude_patterns = { 'fugitive://.*', 'scp://.*' }
vim.api.nvim_create_autocmd({"FileType"}, {
  pattern = {"gitcommit"},
  callback = function() vim.b.EditorConfig_disable = 1 end,
})

------------------
-- plugin nvim-cmp
------------------
local cmp = require('cmp')
local types = require('cmp.types')

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
  },
  formatting = {
    fields = { 'kind', 'abbr', 'menu', },
    format = require("lspkind").cmp_format({
      with_text = false,
    })
  },
  completion = {
    autocomplete = false,
  },
  mapping = cmp.mapping.preset.insert({
    ['<tab>'] = cmp.mapping.confirm({ select = true }),
    ['<C-e>'] = cmp.mapping.abort(),
  }),
  sources = {
    {
      name = 'path',
      option = {
        trailing_slash = true
      },
    },
    { name = 'ultisnips' },
    { name = 'buffer' }
  }
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
  completion = {
    autocomplete = {
      types.cmp.TriggerEvent.TextChanged,
    },
  },
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources({
    {
      name = 'cmdline',
    },
  })
})

-- Set configuration for lsp languages.
cmp.setup.filetype({'lua', 'rust', 'python', 'cpp'}, {
  autocomplete = {
    types.cmp.TriggerEvent.TextChanged,
  },
  completion = {
    autocomplete = {
      types.cmp.TriggerEvent.TextChanged,
    },
  },
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'nvim_lsp_signature_help' },
    { name = 'ultisnips' },
    { name = 'path' },
  })
})

-- LSP configuration
local function lspSymbol(name, icon)
  vim.fn.sign_define('DiagnosticSign' .. name,
    { text = icon, texthl = 'DiagnosticSign' .. name }
  )
end

lspSymbol('Error', '')
lspSymbol('Warn', '')
lspSymbol('Info', '')
lspSymbol('Hint', '')

local on_attach = function(_, bufnr)
  local bufopts = { noremap = true, silent = true, buffer = bufnr }
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
  vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
  vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
  vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
  -- vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
end

local cap_lsp = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())

require('lspconfig').rust_analyzer.setup {
  capabilities = cap_lsp,
  on_attach = on_attach
}

require('lspconfig').clangd.setup {
  capabilities = cap_lsp,
  on_attach = on_attach
}

require('lspconfig').lua_ls.setup {
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

require('lspconfig')['pyright'].setup {
  capabilities = cap_lsp,
  on_attach = on_attach
}

-------------------------
-- plugin nvim-treesitter
-------------------------
local ts_enabled_for = {
  ["c"] = true,
  ["cpp"] = true,
  ["python"] = true,
  ["devicetree" ] = true,
  ["json5"] = true,
  ["json"] = true,
  ["yaml"] = true,
  ["xml"] = true,
  ["rst"] = true,
  ["cmake"] = true,
  ["lua"] = true,
}

require('nvim-treesitter.configs').setup {
  -- silence lua language server warnings
  ensure_installed = { },
  ignore_install = { },
  modules = {},

  sync_install = false,
  auto_install = false,
  highlight = {
    enable = true,

    disable = function(lang, _)
      return not ts_enabled_for[lang]
    end,

    additional_vim_regex_highlighting = false,
  },
  indent = {
    enable = true,
    disable = function(lang, _)
      return not ts_enabled_for[lang]
    end,
  }
}

vim.api.nvim_set_hl(0, "@include", { link = "PreProc" })
vim.api.nvim_set_hl(0, "@repeat", { link = "cConditional" })
vim.api.nvim_set_hl(0, "@conditional", { link = "cConditional" })
vim.api.nvim_set_hl(0, "@punctuation.delimiter", { link = "Normal" })
vim.api.nvim_set_hl(0, "@punctuation.bracket", { link = "Normal" })
vim.api.nvim_set_hl(0, "@keyword.operator.c", { link = "Type" })

vim.api.nvim_set_hl(0, "@constant.builtin", { link = "Type" })
vim.api.nvim_set_hl(0, "@type.builtin", { link = "csClass" })

vim.api.nvim_set_hl(0, "@exception", { link = "Type" })
vim.api.nvim_set_hl(0, "@keyword", { link = "Type" })
vim.api.nvim_set_hl(0, "@type.python", { link = "csClass" })
vim.api.nvim_set_hl(0, "@variable.builtin.python", { link = "Type" })
vim.api.nvim_set_hl(0, "@constructor.python", { link = "csClass" })
vim.api.nvim_set_hl(0, "@constructor.python", { link = "csClass" })

vim.api.nvim_set_hl(0, "@type.builtin.cpp", { link = "Type" })
vim.api.nvim_set_hl(0, "@type.cpp", { link = "csClass" })

vim.api.nvim_set_hl(0, "@constant.devicetree", { link = "PreProc" })
vim.api.nvim_set_hl(0, "@namespace.devicetree", { link = "rustAttribute" })
vim.api.nvim_set_hl(0, "@property.devicetree", { link = "vimHiKeyList" })
vim.api.nvim_set_hl(0, "@label.devicetree", { link = "PreProc" })

vim.api.nvim_set_hl(0, "@keyword.json5", { link = "yamlField" })
vim.api.nvim_set_hl(0, "@string.json5", { link = "yamlString" })
vim.api.nvim_set_hl(0, "@number.json5", { link = "yamlInteger" })
vim.api.nvim_set_hl(0, "@boolean.json5", { link = "yamlBool" })

vim.api.nvim_set_hl(0, "@label.json", { link = "yamlField" })
vim.api.nvim_set_hl(0, "@string.json", { link = "yamlString" })
vim.api.nvim_set_hl(0, "@number.json", { link = "yamlInteger" })
vim.api.nvim_set_hl(0, "@boolean.json", { link = "yamlBool" })

vim.api.nvim_set_hl(0, "@field.yaml", { link = "yamlField" })
vim.api.nvim_set_hl(0, "@string.yaml", { link = "yamlString" })
vim.api.nvim_set_hl(0, "@number.yaml", { link = "yamlInteger" })
vim.api.nvim_set_hl(0, "@comment.yaml", { link = "yamlComment" })
vim.api.nvim_set_hl(0, "@boolean.yaml", { link = "yamlBool" })

vim.api.nvim_set_hl(0, "@tag.xml", { link = "yamlField" })
vim.api.nvim_set_hl(0, "@string.xml", { link = "yamlString" })
vim.api.nvim_set_hl(0, "@constant.xml", { link = "rustAttribute" })
vim.api.nvim_set_hl(0, "@tag.attribute.xml", { link = "yamlInteger" })
vim.api.nvim_set_hl(0, "@tag.delimiter.xml", { link = "yamlField" })

vim.api.nvim_set_hl(0, "@punctuation.special.rst", { link = "rustAttribute" })
vim.api.nvim_set_hl(0, "@text.literal.rst", { link = "markdownCodeBlock" })
vim.api.nvim_set_hl(0, "@text.title.rst", { link = "Comment" })

vim.api.nvim_set_hl(0, "@variable.cmake", { link = "rustAttribute" })

vim.api.nvim_set_hl(0, "@type.c", { link = "csClass" })
vim.api.nvim_set_hl(0, "@type.builtin.c", { link = "Type" })
vim.api.nvim_set_hl(0, "@label.c", { link = "cConditional" })
vim.api.nvim_set_hl(0, "@constant.c", { link = "rustAttribute" })
vim.api.nvim_set_hl(0, "@character.c", { link = "String" })

---------
-- minpac
---------
vim.cmd('packadd minpac')
vim.call('minpac#init')
local minpac_add = vim.fn['minpac#add']
minpac_add('k-takata/minpac', {type = 'opt'})
minpac_add('windwp/nvim-autopairs')
minpac_add('junegunn/fzf.vim')
minpac_add('sirver/ultisnips')
minpac_add('scrooloose/nerdtree')
minpac_add('ryanoasis/vim-devicons')
minpac_add('rust-lang/rust.vim')
minpac_add('tpope/vim-fugitive')
minpac_add('mbbill/undotree')
minpac_add('tpope/vim-commentary')
minpac_add('cespare/vim-toml')
minpac_add('peterhoeg/vim-qml')
minpac_add('itchyny/vim-cursorword')
minpac_add('kassio/neoterm')
minpac_add('neovim/nvim-lspconfig')
minpac_add('vim-scripts/a.vim')
minpac_add('editorconfig/editorconfig-vim')
minpac_add('vim-airline/vim-airline')
minpac_add('vim-airline/vim-airline-themes')
minpac_add('ntpeters/vim-better-whitespace')
minpac_add('edkolev/tmuxline.vim')
minpac_add('hrsh7th/nvim-cmp')
minpac_add('hrsh7th/cmp-path')
minpac_add('hrsh7th/cmp-buffer')
minpac_add('hrsh7th/cmp-cmdline')
minpac_add('hrsh7th/cmp-nvim-lsp')
minpac_add('hrsh7th/cmp-nvim-lsp-signature-help')
minpac_add('quangnguyen30192/cmp-nvim-ultisnips')
minpac_add('onsails/lspkind-nvim')
minpac_add('GutenYe/json5.vim')
minpac_add('nvim-treesitter/nvim-treesitter')
vim.api.nvim_create_user_command('PackUpdate', 'call minpac#update()', {})
vim.api.nvim_create_user_command('PackClean', 'call minpac#clean()', {})
