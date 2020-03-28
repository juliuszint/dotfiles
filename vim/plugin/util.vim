let s:ExitHandlerTransit = {}
let s:ChannelStdOutTransit = {}
let s:JobId = 0

command! CloseAll :call CloseAll()
command! CloseAllButThis :call CloseAllButThis()
command! PrintSynStack :call PrintSynStack()

function! ChannelCloseHandler(channel)
    if ch_canread(a:channel)
        let l:stdout = ch_read(a:channel)
        let s:ChannelStdOutTransit[a:channel] = l:stdout
    else
        let s:ChannelStdOutTransit[a:channel] = ''
    endif
    let l:job = ch_getjob(a:channel)
    let l:jobInfo = job_info(l:job)
    let l:jobId = l:jobInfo['tag']
    if has_key(s:ExitHandlerTransit, l:jobId)
        let l:params = remove(s:ExitHandlerTransit, l:jobId)
        let l:stdout = remove(s:ChannelStdOutTransit, l:channel)
        let l:unused = l:params['exitcb'](l:stdout)
    endif
endfunction

function! JobExitHandler(job, exitstatus)
    let l:jobInfo = job_info(a:job)
    let l:jobId = l:jobInfo['tag']
    let l:params = s:ExitHandlerTransit[l:jobId]
    let l:elapsedTime = split(reltimestr(reltime(l:params['startTime'])))[0]
    let l:channel = job_getchannel(a:job)
    redraw
    if has_key(l:params, 'exitcb')
        if has_key(s:ChannelStdOutTransit, l:channel)
            let l:stdout = remove(s:ChannelStdOutTransit, l:channel)
            let l:unused = l:params['exitcb'](l:stdout)
            call remove(s:ExitHandlerTransit, l:jobId)
        endif
    else
        call remove(s:ExitHandlerTransit, l:jobId)
    endif
    if has_key(l:params, 'exitMessage')
        echo l:params['exitMessage'] . '. Elapsed Time: ' l:elapsedTime 'ms. With status: ' . a:exitstatus
    else
        echo 'Finished job: ' . a:job . ' in: '. l:elapsedTime . 'ms with status: ' . a:exitstatus
    endif
endfunc

function! RunCommandAsJob(command, bufferName, options = {})
    let l:jobid = s:JobId
    let s:JobId = s:JobId + 1
    let l:handlerParams = {}
    let s:ExitHandlerTransit[l:jobid] = l:handlerParams
    let l:bufnr = 0
    if strlen(a:bufferName) > 0
        let l:bufnr = bufadd(a:bufferName)
        call setbufvar(l:bufnr, "&buftype", get(a:options, 'buftype', 'nofile'))
        call setbufvar(l:bufnr, "&ft", get(a:options, 'ft', ''))
        call setbufvar(l:bufnr, "&buflisted", get(a:options, 'buflisted', 1))
        call setbufvar(l:bufnr, "&modifiable", get(a:options, 'modifiable', 1))
        call deletebufline(l:bufnr, 1, '$')
    endif
    redraw
    if has_key(a:options, "exit_msg")
        let l:handlerParams['exitMessage'] = a:options['exit_msg']
    endif
    let l:cwd = getcwd()
    if has_key(a:options, 'cwd')
        let l:cwd = fnamemodify(a:options['cwd'], ':p')
    endif
    echo l:cwd
    let l:startTime = reltime()
    let l:handlerParams['startTime'] = l:startTime
    let jobOpts = {}
    let jobOpts['in_io'] = 'null'
    let jobOpts['out_io'] = "buffer"
    let jobOpts['out_msg'] = 0
    let jobOpts['out_modifiable'] = 0
    let jobOpts['cwd'] = l:cwd
    let jobOpts['tag'] = l:jobid
    let jobOpts['exit_cb'] = 'JobExitHandler'
    if strlen(a:bufferName) > 0
        let jobOpts['out_buf'] = l:bufnr
    endif
    if has_key(a:options, 'exitcb')
        let l:handlerParams['exitcb'] = a:options['exitcb']
        let jobOpts['close_cb'] = 'ChannelCloseHandler'
    endif
    if has_key(a:options, 'out_io')
        let jobOpts['out_io'] = a:options['out_io']
        let jobOpts['out_mode'] = 'raw'
    elseif strlen(a:bufferName) <= 0
        let jobOpts['out_io'] = "null"
    endif
    let jobObject = job_start(a:command, jobOpts)
    if get(a:options, 'bringToFront', 0)
        execute "buffer " . l:bufnr
    endif
    redraw
    echo get(a:options, 'msg', "Starting new job")
endfunction

function! UpdateQuickfix(content)
    echo a:content
    cgete a:content
    if len(getqflist()) > 0
        copen
    else
        cclose
    endif
endfunction

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

function! PrintSynStack()
    if !exists("*synstack")
        return
    endif
    echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc

function! PrintTextProps()
    let l:cursorpos = getcurpos()
    let l:textprops = prop_list(l:cursorpos[1])
    let l:postextprops = []
    let l:curcol = l:cursorpos[2]
    for l:textprop in l:textprops
        let l:propstartcol = l:textprop['col']
        let l:propendcol = l:textprop['col'] + l:textprop['length']
        if l:curcol >= l:propstartcol && l:curcol <= l:propendcol
            call add(l:postextprops, l:textprop['type'])
        endif
    endfor
    echo l:postextprops
endfunc

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
