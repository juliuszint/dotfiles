command! SearchForWordUnderCursor :call SearchForWordUnderCursor(0)
command! SearchForWordUnderCursorQf :call SearchForWordUnderCursor(1)
command! SearchForImplementation :call SearchForImplementation()
command! -complete=file -nargs=* SearchForRegex :call SearchForRegex(<f-args>)
command! -complete=file -nargs=* SearchForRegexQf :call SearchForRegexQf(<f-args>)

nmap <leader>r :SearchForRegex 

function! SearchForWordUnderCursor(qfTarget)
    let l:wordUnderCursor = expand("<cword>")
    "let l:command = ['rg', '--heading', '--column', '--case-sensitive', '--word-regexp']
    let l:command = ['rg', '--word-regexp', '--vimgrep']
    let l:opts = {}
    let l:opts['msg'] = 'Searching for word under cursor'
    let l:opts['exit_msg'] = 'Finished searching for word under cursor'
    let l:opts['bringToFront'] = 1
    let l:opts['ft'] = 'ag'
    let l:bufferName = '<Searching>'
    if a:qfTarget == 1
        let l:opts['out_io'] = 'pipe'
        let l:opts['exitcb'] = function('UpdateQuickfix')
        let l:command = ['rg', '--word-regexp', '--vimgrep']
        let l:bufferName = ''
        let l:opts['bringToFront'] = 0
    endif
    call add(l:command, l:wordUnderCursor)
    call RunCommandAsJob(l:command, l:bufferName, l:opts)
endfunction

function! SearchForRegex(...)
    let l:args = ['rg', '--heading', '--column', '--smart-case']
    let l:args += a:000
    let l:opts = {}
    let l:opts["ft"] = "ag"
    let l:opts["msg"] = "Searching for regular expression ..."
    let l:opts["bringToFront"] = 1
    call RunCommandAsJob(l:args, "<SearchOutput>", l:opts)
endfunction

function! SearchForRegexQf(...)
    let l:command = ['rg', '--word-regexp', '--vimgrep']
    let l:command += a:000
    let l:opts = {}
    let l:opts["msg"] = "Searching for regular expression ..."
    let l:opts["msg"] = "Finished searching for regular expression"
    let l:opts['out_io'] = 'pipe'
    let l:opts['exitcb'] = function('UpdateQuickfix')
    call RunCommandAsJob(l:command, '', l:opts)
endfunction

function! SearchForImplementation()
    let l:wordUnderCursor = expand("<cword>")
    let l:regex = '(class|interface)\s+(\w+)\s+:\s+(\w+\s*,\s*)*?' . l:wordUnderCursor
    let l:args = ['rg', '--heading', '--column', '--smart-case', '--multiline', l:regex]
    let l:opts = {}
    let l:opts["ft"] = "ag"
    let l:opts["msg"] = "Searching for implementations of: ..." . l:wordUnderCursor
    let l:opts["bringToFront"] = 1
    call RunCommandAsJob(l:args, "<SearchOutput>", l:opts)
endfunction

" AppDelegateMain
