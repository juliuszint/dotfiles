local function grep_for_symbols (opts, regex)
  local rg_prefix = "rg --column --vimgrep --line-number --no-heading --smart-case --only-matching --max-columns=4096"
    local cmd = string.format("%s %s -- %q", rg_prefix, opts, regex)
    require('fzf-lua').grep({
      raw_cmd = cmd,
      fzf_opts = {
        ["--with-nth"] = 4,
        ["--delimiter"] = ":",
      }
    })
end

vim.api.nvim_create_user_command("PythonSymbols",
  function()
    local opts = [[--replace '$2']]
    local regex = [[\b(class|def)\s+(\w{4,})]]
    grep_for_symbols(opts, regex)
  end,
  {}
)

vim.api.nvim_create_user_command("CSharpSymbols",
  function()
    local opts = [[--replace '$2']]
    local regex = [[\b(class|struct|interface|enum)\s+(\w{4,})]]
    grep_for_symbols(opts, regex)
  end,
  {}
)

vim.api.nvim_create_user_command("CTypeSymbols",
  function()
    local opts = [[--replace '$2']]
    local regex = [[\b(enum|struct)\s+(\w{4,})[\s{]*$]]
    grep_for_symbols(opts, regex)
  end,
  {}
)

vim.api.nvim_create_user_command("CppTypeSymbols",
  function()
    local opts = [[--pcre2 --replace '$3']]
    local regex = [[(class|struct|enum)\s+([A-Z_]{2,}\s+)?(\w{4,}+)\s*($|[:{])]]
    grep_for_symbols(opts, regex)
  end,
  {}
)

vim.api.nvim_create_user_command("CFunctionSymbols",
  function()
    local opts = [[--pcre2 --replace '$2']]
    local regex = [[(^|\w+(?<!return)\s+)\*?(\w{3,})\(]]
    grep_for_symbols(opts, regex)
  end,
  {}
)
