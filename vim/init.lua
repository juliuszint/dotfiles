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
vim.opt.listchars = { tab = "» " }
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
vim.api.nvim_create_user_command('LspDisable', ':lua vim.api.nvim_clear_autocmds({ group = "lspconfig" })', {})

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

vim.keymap.set('n', 'gm', '<cmd>FzfLua command_history<cr>')

vim.cmd.colorscheme("mine")

-----------------
-- lazy.nvim
-----------------
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  { "windwp/nvim-autopairs" },
  {
    "sirver/ultisnips",
    init = function()
      vim.g.UltiSnipsJumpForwardTrigger = '<c-n>'
      vim.g.UltiSnipsJumpBackwardTrigger = '<c-p>'
    end,
  },
  { "tpope/vim-fugitive" },
  { "mbbill/undotree" },
  { "tpope/vim-commentary" },
  { "cespare/vim-toml" },
  { "peterhoeg/vim-qml" },
  { "itchyny/vim-cursorword" },
  {
    "kassio/neoterm",
    init = function()
      vim.g.neoterm_automap_keys = '<space>tt'
    end,
  },
  -- -- Disabled until I figure out why < in insert is screwed up by this plugin
  -- {
  --   "vim-scripts/a.vim",
  --   init = function()
  --     vim.g.alternateNoDefaultAlternate = 1
  --   end,
  -- },
  { "nvim-treesitter/nvim-treesitter" },
  {
    "ntpeters/vim-better-whitespace",
    init = function()
      vim.g.better_whitespace_operator = ''
    end,
  },
  { "GutenYe/json5.vim" },
  { "editorconfig/editorconfig-vim" },
  { "rust-lang/rust.vim" },
  { "neovim/nvim-lspconfig" },
  { "onsails/lspkind-nvim" },
  {
    "ibhagwan/fzf-lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      local rg_opts = ""
      local config_dir = vim.fn.stdpath("config")
      rg_opts = rg_opts .. " --vimgrep --column --line-number --no-heading"
      rg_opts = rg_opts .. " --color=always --smart-case --max-columns=4096"
      rg_opts = rg_opts .. " --vim-esc"
      local rg_cmd = string.format('%s/vrg rg%s', config_dir, rg_opts)
      require("fzf-lua").setup({
        grep = {
          cmd = rg_cmd,
          rg_glob = false,
        },
        nbsp = '\xc2\xa0',
        file_icon_padding = ' ',
      })

      vim.keymap.set("n", "<space>f", "<cmd>lua require('fzf-lua').files({ cmd = 'rg --files' })<CR>", { silent = true })
      vim.keymap.set("n", "<space>h", "<cmd>lua require('fzf-lua').command_history()<CR>", { silent = true })
      vim.keymap.set("n", "<space>c", "<cmd>lua require('fzf-lua').commands()<CR>", { silent = true })
      vim.keymap.set("n", "<space>b", "<cmd>lua require('fzf-lua').buffers()<CR>", { silent = true })
      vim.keymap.set("n", "<space>j", "<cmd>lua require('fzf-lua').jumps()<CR>", { silent = true })
      vim.keymap.set("n", "<space>rb", "<cmd>lua require('fzf-lua').lgrep_curbuf()<CR>", { silent = true })
      vim.keymap.set("n", "<space>rr", "<cmd>lua require('fzf-lua').live_grep()<CR>", { silent = true })
      vim.keymap.set("n", "<space>rw", "<cmd>lua require('fzf-lua').live_grep({ search = vim.fn.expand('<cword>') })<CR>", { silent = true })
      vim.keymap.set("n", "<space>rp", "<cmd>lua require('fzf-lua').live_grep_resume()<CR>", { silent = true })

      vim.keymap.set('n', '<Space>a', function()
        local fn = vim.fn.expand('%:t:r')
        local ext = vim.fn.expand('%:t:e')
        local query = string.format("\"%s !.%s$\"", fn, ext)
        require'fzf-lua'.files({fzf_opts = {['--exact -1 --query'] = query}, cmd="rg --files"})
      end)
    end
  },
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
    }
  },
  {
    "vim-airline/vim-airline",
    dependencies = {
      "vim-airline/vim-airline-themes",
      "edkolev/tmuxline.vim",
    },
    init = function()
      vim.g.airline_theme='google_dark'
    end,
  },
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-cmdline",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-nvim-lsp-signature-help",
      "quangnguyen30192/cmp-nvim-ultisnips",
    }
  },
})

-----------
-- tmuxline
-----------
vim.g.tmuxline_preset = {
  a = "#S",
  b = '#(python3 -c "import psutil;print(f\'MEM \' + f\'{psutil.virtual_memory().percent}%\'.rjust(5))")',
  c = '#(python3 -c "import psutil;print(f\'CPU \' + f\'{psutil.cpu_percent(1)}%\'.rjust(5))")',
  win = '#I #W#{?window_zoomed_flag, [Z],}',
  cwin = '#I #W#{?window_zoomed_flag, [Z],}',
  x = '%R',
  y = '%d.%m.%Y',
  z = '#H',
  options = { [ "status-justify" ] = "centre"}
}

vim.g.tmuxline_separators = {
     left = '',
     left_alt = '',
     right = '',
     right_alt = '',
     space = ' '
}

-----------------
-- nvim-autopairs
-----------------
require('nvim-autopairs').setup({
  disable_in_visualblock = true,
})

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

----------
-- NeoTree
----------
require("neo-tree").setup({
  close_if_last_window = true,
  enable_diagnostics = false,
  enable_git_status = true,
  popup_border_style = "rounded",
  default_component_configs = {
    container = {
      enable_character_fade = true
    },
    indent = {
      indent_size = 2,
      padding = 1, -- extra padding on left hand side
      -- indent guides
      with_markers = true,
      indent_marker = "│",
      last_indent_marker = "└",
      highlight = "NeoTreeIndentMarker",
      -- expander config, needed for nesting files
      with_expanders = nil, -- if nil and file nesting is enabled, will enable expanders
      expander_collapsed = "",
      expander_expanded = "",
      expander_highlight = "NeoTreeExpander",
    },
    icon = {
      folder_closed = "",
      folder_open = "",
      folder_empty = "󰜌",
      default = "",
      highlight = "NeoTreeFileIcon"
    },
  },
  window = {
    position = "current",
    mappings = {
      ["/"] = "noop",
      ["y"] = "noop",
      ["x"] = "close_node",
      ["<space>"] = "noop",
      ["z"] = "noop",
      ["l"] = "noop",
      ["o"] = "open",
      ["oc"] = "noop",
      ["od"] = "noop",
      ["og"] = "noop",
      ["om"] = "noop",
      ["on"] = "noop",
      ["os"] = "noop",
      ["ot"] = "noop",
      ["yn"] = {
        function(state)
          vim.cmd(string.format("let @+='%s'", state.tree:get_node().name))
          print(string.format("Copied %s to clipboard", state.tree:get_node().name))
        end,
        desc = "yank_file_name",
      },
      ["yp"] = {
        function(state)
          vim.cmd(string.format("let @+='%s'", state.tree:get_node().path))
          print(string.format("Copied %s to clipboard", state.tree:get_node().path))
        end,
        desc = "yank_file_path",
      },
    }
  },
  filesystem = {
    use_libuv_file_watcher = true,
    filtered_items = {
      always_show = {
        ".gitignore",
        ".gitlab-ci.yml",
        ".gitattributes",
      },
      hide_by_name = {
        "__init__.py",
        "__pycache__",
      },
    }
  }
})

vim.keymap.set('n', '<Space>e', '<cmd>Neotree<cr>')
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
        globals = { 'vim', 'string' },
      },
      workspace = {
        library = vim.api.nvim_get_runtime_file("", true),
        checkThirdParty = false,
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

vim.api.nvim_set_hl(0, "@lsp.type.namespace.rust", { link = "Default" })
vim.api.nvim_set_hl(0, "@lsp.type.interface.rust", { link = "csClass" })
vim.api.nvim_set_hl(0, "@lsp.type.struct.rust", { link = "csClass" })
vim.api.nvim_set_hl(0, "@lsp.type.enum.rust", { link = "csInterface" })
vim.api.nvim_set_hl(0, "@lsp.type.enumMember.rust", { link = "csEnumMemberName" })

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
  ["rst"] = true,
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
vim.api.nvim_set_hl(0, "@variable.builtin.cpp", { link = "Type" })

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


vim.api.nvim_set_hl(0, "@punctuation.special.md", { link = "rustAttribute" })
vim.api.nvim_set_hl(0, "@text.literal.md", { link = "markdownCodeBlock" })
vim.api.nvim_set_hl(0, "@text.title.md", { link = "Comment" })
