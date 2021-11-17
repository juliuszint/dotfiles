command! -complete=file -nargs=* Rg :call SearchForRegexQf(<f-args>)

function! SearchForRegexQf(...)
    let l:command = ['rg', '--vimgrep', '--smart-case']
    let l:command += a:000
    let l:search_result = system(l:command)
    cgete l:search_result
    let l:match_count = len(getqflist())
    if l:match_count > 0
	    copen
    else
	    cclose
    endif
    echo "Done searching: " . l:match_count . " matches"
endfunction

"                                   Mappings
" =============================================================================
nmap gr :Rg 
nmap gw :execute "Rg " . expand('<cword>')<cr>
