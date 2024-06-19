let g:RunningJobs = 0

command! CloseAll :call CloseAll()
command! CloseAllButThis :call CloseAllButThis()

function! PromptUserToSaveBuffers(options = {})
    let l:only_in_wd = get(a:options, 'only_in_wd', 1)
    let l:buffers = getbufinfo()
    let l:cur_buffer = bufnr('%')
    for l:buffer in l:buffers
        if l:buffer['changed']
            if l:only_in_wd && !l:buffer['name'] =~ getcwd()
                continue
            endif
            echo l:buffer['name'] . " has unwritten changes\n\n(s)ave\nsave (a)ll\n(r)eload\n(c)ancel"
            let l:choice = nr2char(getchar())
            echo l:choice
            if l:choice ==# 's'
                execute 'buffer' . l:buffer['bufnr']
                write
            elseif l:choice ==# 'a'
                wall
                break
            elseif l:choice ==# 'r'
                execute 'buffer' . l:buffer['bufnr']
                edit!
            elseif l:choice ==# 'c'
                return -1
            endif
        endif
    endfor
    execute 'buffer' . l:cur_buffer
    redraw
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
