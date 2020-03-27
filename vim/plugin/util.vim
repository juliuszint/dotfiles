let s:ExitHandlerTransit = {}
let s:JobId = 0

command! PrintSynStack :call PrintSynStack()
command! CloseAll :call CloseAll()
command! CloseAllButThis :call CloseAllButThis()

function! JobExitHandler(job, exitstatus)
    let l:jobInfo = job_info(a:job)
    let l:jobId = l:jobInfo['tag']
    let l:params = remove(s:ExitHandlerTransit, l:jobId)
    let l:elapsedTime = split(reltimestr(reltime(l:params['startTime'])))[0]
    let l:channel = job_getchannel(a:job)
    redraw
    if has_key(l:params, 'exitcb')
        let l:unused = l:params['exitcb']("error")
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
    if strlen(a:bufferName) > 0
        let bufnr = bufadd(a:bufferName)
        call setbufvar(bufnr, "&buftype", get(a:options, 'buftype', 'nofile'))
        call setbufvar(bufnr, "&ft", get(a:options, 'ft', ''))
        call setbufvar(bufnr, "&buflisted", get(a:options, 'buflisted', 1))
        call setbufvar(bufnr, "&modifiable", get(a:options, 'modifiable', 1))
        call deletebufline(bufnr, 1, '$')
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
    let jobOpts['out_buf'] = bufnr
    let jobOpts['out_msg'] = 0
    let jobOpts['out_modifiable'] = 0
    let jobOpts['cwd'] = l:cwd
    let jobOpts['tag'] = l:jobid
    let jobOpts['exit_cb'] = 'JobExitHandler'
    if has_key(a:options, 'exitcb')
        let l:handlerParams['exitcb'] = a:options['exitcb']
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

function! PrintSynStack()
    if !exists("*synstack")
        return
    endif
    echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc
