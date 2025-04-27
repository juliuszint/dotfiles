local function grep_for_symbols (opts)
  if opts.cword then
    opts.query = vim.fn.expand("<cword>")
  end
  local rg_prefix = "rg --column --vimgrep --line-number --no-heading --smart-case --only-matching --max-columns=4096"
  local expressions = ""
  local replace = ""
  for i, v in pairs(opts.regex) do
    replace = string.format("%s$%d", replace, i)
    expressions = expressions .. string.format(" --regexp=%q", v)
  end
  local cmd = string.format("%s --replace '%s' %s %s", rg_prefix, replace, opts.rg_opts, expressions)
  require('fzf-lua').grep({
    raw_cmd  = cmd,
    query    = opts.query,
    prompt   = 'Symbols❯ ',
    fzf_opts = {
      ["--with-nth"] = 4,
      ["--delimiter"] = ":",
    }
  })
end

local function python_symbols(opts)
  opts.rg_opts = ""
  opts.regex =  { [[\b(?:class|def)\s+(\w{4,})]] }
  grep_for_symbols(opts)
end

local function csharp_symbols(opts)
  opts.rg_opts = ""
  opts.regex = { [[\b(?:class|struct|interface|enum)\s+(\w{4,})]] }
  grep_for_symbols(opts)
end

local function rust_symbols(opts)
  opts.rg_opts = ""
  opts.regex = { [[\b(?:struct|enum|fn|trait)\s+(\w{4,})]] }
  grep_for_symbols(opts)
end

local function c_symbols(opts)
  opts.rg_opts = [[--pcre2]]
  opts.regex = {
    [[\b(?:enum|struct)\s+(\w{4,})[\s{]*$]],
    [[(?:^|\w+(?<!:return)\s+)\*?(\w{3,})\(]],
    [[#define\s+(\w{4,})]]
  }
  grep_for_symbols(opts)
end

local function cpp_symbols(opts)
  opts.rg_opts = [[--pcre2]]
  opts.regex = {
    [[(?:class|struct|enum)\s+(?:[A-Z_]{2,}\s+)?(\w{4,}+)\s*($|[:{])]],
    [[(?:^|\w+(?<!:return)\s+)\*?(\w{3,})\(]],
    [[#define\s+(\w{4,})]]
  }
  grep_for_symbols(opts)
end

-- user commands

vim.api.nvim_create_user_command("PythonSymbols", python_symbols, {})
vim.api.nvim_create_user_command("CSharpSymbols", csharp_symbols, {})
vim.api.nvim_create_user_command("CSymbols", c_symbols, {})
vim.api.nvim_create_user_command("CppSymbols", cpp_symbols, {})
vim.api.nvim_create_user_command("RustSymbols", rust_symbols, {})

-- mappings

local id = vim.api.nvim_create_augroup("symbols-auto", {})
vim.api.nvim_create_autocmd({"FileType"}, {
  pattern = { "*" },
  group = id,
  callback = function(ev)
    local symbol_fn_lookup = {
      c = c_symbols,
      h = c_symbols,
      py = python_symbols,
      cpp = cpp_symbols,
      hpp = cpp_symbols,
      rust = rust_symbols
    }
    local symbol_fn = symbol_fn_lookup[ev.match]
    if symbol_fn ~= nil then
      vim.keymap.set('n', '<Space>ss', function() symbol_fn({}) end, { buffer = true })
      vim.keymap.set('n', '<Space>sw', function() symbol_fn({cword=true}) end, { buffer = true })
    end
  end
})
