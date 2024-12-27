local function grep_for_symbols (opts)
  if opts.cword then
    opts.query = vim.fn.expand("<cword>")
  end
  local rg_prefix = "rg --column --vimgrep --line-number --no-heading --smart-case --only-matching --max-columns=4096"
  local cmd = string.format("%s %s -- %q", rg_prefix, opts.rg_opts, opts.regex)
  require('fzf-lua').grep({
    raw_cmd = cmd,
    query = opts.query,
    fzf_opts = {
      ["--with-nth"] = 4,
      ["--delimiter"] = ":",
    }
  })
end

local function python_symbols(opts)
  opts.rg_opts = [[--replace '$2']]
  opts.regex = [[\b(class|def)\s+(\w{4,})]]
  grep_for_symbols(opts)
end

local function csharp_symbols(opts)
  opts.rg_opts = [[--replace '$2']]
  opts.regex = [[\b(class|struct|interface|enum)\s+(\w{4,})]]
  grep_for_symbols(opts)
end

local function c_types_symbols(opts)
  opts.rg_opts = [[--replace '$2']]
  opts.regex = [[\b(enum|struct)\s+(\w{4,})[\s{]*$]]
  grep_for_symbols(opts)
end

local function c_function_symbols(opts)
  opts.rg_opts = [[--pcre2 --replace '$2']]
  opts.regex = [[(^|\w+(?<!return)\s+)\*?(\w{3,})\(]]
  grep_for_symbols(opts)
end

local function cpp_types_symbols(opts)
  opts.rg_opts = [[--pcre2 --replace '$3']]
  opts.regex = [[(class|struct|enum)\s+([A-Z_]{2,}\s+)?(\w{4,}+)\s*($|[:{])]]
  grep_for_symbols(opts)
end

local function rust_symbols(opts)
  opts.rg_opts = [[--replace '$2']]
  opts.regex = [[\b(struct|enum|fn|trait)\s+(\w{4,})]]
  grep_for_symbols(opts)
end

vim.api.nvim_create_user_command("PythonSymbols", python_symbols, {})
vim.api.nvim_create_user_command("CSharpSymbols", csharp_symbols, {})
vim.api.nvim_create_user_command("CTypeSymbols", c_types_symbols, {})
vim.api.nvim_create_user_command("CFunctionSymbols", c_function_symbols, {})
vim.api.nvim_create_user_command("CppTypeSymbols", cpp_types_symbols, {})
vim.api.nvim_create_user_command("RustSymbols", rust_symbols, {})

local id = vim.api.nvim_create_augroup("symbols-auto", {})
vim.api.nvim_create_autocmd({"FileType"}, {
  pattern = { "*" },
  group = id,
  callback = function(ev)
    if ev.match == "c" or ev.match == "h" then
      vim.keymap.set('n', '<Space>st', function() c_types_symbols({}) end, { buffer = true })
      vim.keymap.set('n', '<Space>sf', function() c_function_symbols({}) end, { buffer = true })
      vim.keymap.set('n', '<Space>swt', function() c_types_symbols({cword=true}) end, { buffer = true })
      vim.keymap.set('n', '<Space>swf', function() c_function_symbols({cword=true}) end, { buffer = true })
    end
    if ev.match == "py" then
      vim.keymap.set('n', '<Space>s', function() python_symbols({}) end, { buffer = true })
    end
    if ev.match == "cpp" or ev.FileType == "hpp" then
      vim.keymap.set('n', '<Space>sf', function() c_function_symbols({}) end, { buffer = true })
      vim.keymap.set('n', '<Space>st', function() cpp_types_symbols({}) end, { buffer = true })
    end
    if ev.match == "rust" then
      vim.keymap.set('n', '<Space>s', function() rust_symbols({}) end, { buffer = true })
      vim.keymap.set('n', '<Space>ws', function() rust_symbols({cword=true}) end, { buffer = true })
    end
  end
})
