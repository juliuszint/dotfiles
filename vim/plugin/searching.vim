command! -complete=file -nargs=* SearchForRegex :call SearchForRegex(<f-args>)
command! -complete=file -nargs=* SearchForRegexQf :call SearchForRegexQf(<f-args>)

function! SearchForRegex(...)
    let l:args = ['rg', '--heading', '--column', '--smart-case']
    let l:args += a:000
    let l:opts = {}
    let l:opts["start_msg"] = "Searching for regular expression ..."
    let l:opts["bringToFront"] = 1
    call JCStartJobInBuffer(l:args, "<SearchOutput>", l:opts)
endfunction

function! SearchForRegexQf(...)
    let l:command = ['rg', '--vimgrep', '--smart-case']
    let l:command += a:000
    let l:opts = {}
    let l:opts["start_msg"] = "Searching for regular expression ..."
    let l:opts["end_msg"] = "Finished searching for regular expression"
    call JCStartJobInQuickfix(l:command, l:opts)
endfunction
