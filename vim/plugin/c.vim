if !filereadable('Makefile')
    finish
endif

let g:ProjectMakeTarget = ""

nmap gm :call Make()<cr>

function! Make()
    if PromptUserToSaveBuffers() < 0
        return
    endif
    let l:opts = {}
    let l:opts['start_msg'] = 'Building NotenBox. Target=' . g:ProjectMakeTarget . ' ...'
    let l:opts['end_msg'] = 'Finished building NotenBox. Target=' . g:ProjectMakeTarget
    let l:command = ["make", "-s"]
    call JCStartJobInQuickfix(l:command, l:opts)
endfunction
