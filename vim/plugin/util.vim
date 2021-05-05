let g:RunningJobs = 0

command! CloseAll :call CloseAll()
command! CloseAllButThis :call CloseAllButThis()

function! PromptUserToSaveBuffers()
    let l:buffers = getbufinfo()
    let l:changedbuffers = []
    for l:buffer in l:buffers
        if l:buffer['changed']
            call add(l:changedbuffers, l:buffer)
        endif
    endfor
    if len(l:changedbuffers) > 0
        echo 'The following buffers contain unwritten changes'
        echo " "
        for l:buffer in l:changedbuffers
            echo l:buffer['name']
        endfor
        echo " "
        let l:choice = input("Save all and continue? Yes(y)/No(n): ")
        if l:choice == 'y'
            execute 'wa'
        else
            return -1
        endif
    endif
    return 0
endfunction

function! CloseAll()
    if PromptUserToSaveBuffers() < 0
        return
    endif
    execute '%bd'
    redraw!
endfunction

function! CloseAllButThis()
    if PromptUserToSaveBuffers() < 0
        return
    endif
    let l:currentbuf = bufnr('%')
    let l:buffers = getbufinfo({'bufloaded':1})
    for l:buffer in l:buffers
        if l:buffer['bufnr'] != l:currentbuf
            execute l:buffer['bufnr'] . 'bd '
        endif
    endfor
    redraw!
endfunction
