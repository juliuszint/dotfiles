﻿let s:fzf_options = { 'options': [
	\'--with-nth=4',
	\'--delimiter=:',
	\'--color=hl:#AFD7AF,hl+:#AFD7AF',
	\'--preview=bat --style=full --color=always --pager=never --highlight-line {2} -- {1}',
	\'--preview-window=~4,+{2}+4/2'
\] }
let s:rg_common_options='--column --vimgrep --line-number --no-heading --smart-case --only-matching '

function! s:get_fzf_opts()
	return copy(s:fzf_options)
endfunction

function! s:get_fzf_opts_with_query()
	let result = copy(s:fzf_options)
	let opts = get(result, 'options')
	let query_opt = "--query=" . expand("<cword>")
	call add(opts, query_opt)
	return result
endfunction

"
" C++ Typen (struct, class, enum)
"
let s:rg_cpp_type_options='--pcre2 --replace ''$3'' -- ''(class|struct|enum)\s+([A-Z_]{2,}\s+)?(\w{4,}+)\s*($|[:{])'''
let s:rg_cpp_type_command='rg ' . s:rg_common_options . s:rg_cpp_type_options

command! CppTypes :call fzf#vim#grep(s:rg_cpp_type_command, 1, copy(s:fzf_options), 0)

"
" C Symbols (functions, structs, enums)
"
let s:rg_c_type_options='--replace ''\$2'' -e ''(enum|struct)\s+(\w{4,})[\s{]*$'''
let s:rg_c_function_options='--pcre2 --replace ''\$2'' -e ''(^|\w+(?<!return)\s+)\*?(\w{3,})\('''
let s:rg_c_type_command_escaped='rg ' . s:rg_common_options . s:rg_c_type_options
let s:rg_c_function_command_escaped='rg ' . s:rg_common_options . s:rg_c_function_options

let s:rg_c_type_command='sh -c "' . s:rg_c_type_command_escaped . '"'
let s:rg_c_function_command='sh -c "' . s:rg_c_function_command_escaped . '"'
let s:rg_c_symbol_command='sh -c "' . s:rg_c_type_command_escaped . ';' . s:rg_c_function_command_escaped . '"'
let s:rg_c_symbol_command_in_file='sh -c "' . s:rg_c_type_command_escaped . ' ''%%'';' . s:rg_c_function_command_escaped . ' ''%%''"'

command! CSymbols :call fzf#vim#grep(s:rg_c_symbol_command, 1, s:get_fzf_opts(), 0)
command! CTypes :call fzf#vim#grep(s:rg_c_type_command, 1, s:get_fzf_opts(), 0)
command! CFunctions :call fzf#vim#grep(s:rg_c_function_command, 1, s:get_fzf_opts(), 0)
command! CSymbolsInFile :call fzf#vim#grep(substitute(s:rg_c_symbol_command_in_file, '%%', expand("%"), "g"), 1, s:get_fzf_opts(), 0)
command! CSymbolsW :call fzf#vim#grep(s:rg_c_symbol_command, 1, s:get_fzf_opts_with_query(), 0)

"
" C# Typen (class, interface, struct)
"
let s:rg_csharp_type_options='--replace ''$2'' -- ''(enum|class|struct|interface) (\w{4,})'''
let s:rg_csharp_type_command='rg ' . s:rg_common_options . s:rg_csharp_type_options
let s:rg_csharp_ios_type_command='rg ' . s:rg_common_options . s:rg_csharp_type_options . ' /Volumes/awin/frameworkSource/Xamarin.iOS'
let s:rg_csharp_macos_type_command='rg ' . s:rg_common_options . s:rg_csharp_type_options . ' /Volumes/awin/frameworkSource/Xamarin.Mac'

command! CSharpTypes :call fzf#vim#grep(s:rg_csharp_type_command, 1, s:get_fzf_opts(), 0)
command! CSharpiOSTypes :call fzf#vim#grep(s:rg_csharp_ios_type_command, 1, s:get_fzf_opts(), 0)
command! CSharpimacOSTypes :call fzf#vim#grep(s:rg_csharp_macos_type_command, 1, s:get_fzf_opts(), 0)
