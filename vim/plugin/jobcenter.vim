" ===============================================================================
"                               Job Center Plugin
" 
" JobCenter is a simple wrapper around Vim 8 Job API. It offers:
"   1. An easy way to run a simple command as job and have its output:
"       - Update the quickfix window
"       - Update the contents of a buffer
"   4. AutoCommand jc_jobs_changed to be notified when:
"       - A job is started
"       - A job completed
"   2. Time tracking for jobs
"   3. Customizable start and end messages
"
" Usage
"   JCStartJobInBuffer('ls -la', '<LsOutput>')
"       Supported optional keys in dictionary
"       - buftype      (see help: buftype)     default: nofile
"       - ft           (see help: filetype)    default: empty
"       - buflisted    (see help: buflisted)   default: 1
"       - modifiable   (see help: modifiable)  default: 0
"       - bringToFront make the buffer visible default: 0
"       - cwd          working directory of the job
"       - start_msg    echoed when the job starts
"       - end_msg      echoed when the job is done
"
"   JCStartJobInQuickfix(['rg', '--vimgrep', '--smartcase', 'MyRegEx'])
"       Supported optional keys in dictionary
"       - start_msg   echoed when the job starts
"       - end_msg     echoed when the job is done
"   
" ===============================================================================

let g:JCRunningJobs = 0

function! JCStartJobInBuffer(command, bufferName, options = {})
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
    let l:vim_job_opts = s:get_common_vim_job_opts(a:options)
    let l:vim_job_opts['out_io'] = "buffer"
    let l:vim_job_opts['out_buf'] = l:bufnr

    let l:start_message = get(a:options, 'start_msg', "Starting new job")
    call s:start_vim_job(a:command, l:vim_job_opts, l:start_message)

    if get(a:options, 'bringToFront', 0)
        execute "buffer " . l:bufnr
    endif
    redraw
endfunction

function! JCStartJobInQuickfix(command, options = {})
    let a:options['completed_cb'] = function('s:show_in_quickfix')
    let l:vim_job_opts = s:get_common_vim_job_opts(a:options)
    let l:vim_job_opts['out_io'] = "pipe"
    let l:vim_job_opts['out_mode'] = 'raw'
    let l:start_message = get(a:options, 'start_msg', "Starting new job")
    call s:start_vim_job(a:command, l:vim_job_opts, l:start_message)
endfunction

function! s:start_vim_job(command, vim_job_opts, start_msg)
    call s:update_jc_running_jobs(1)
    call job_start(a:command, a:vim_job_opts)
    redraw
    echo a:start_msg
endfunction

function! s:get_common_vim_job_opts(jc_options)
    let l:callback_info = {}
    let l:callback_info['start_time'] = reltime()
    let l:cwd = getcwd()
    if has_key(a:jc_options, "end_msg")
        let l:callback_info['end_message'] = a:jc_options['end_msg']
    endif
    if has_key(a:jc_options, 'cwd')
        let l:cwd = fnamemodify(a:jc_options['cwd'], ':p')
    endif
    if has_key(a:jc_options, 'completed_cb')
        let l:callback_info['completed_cb'] = a:jc_options['completed_cb']
    endif
    let vim_job_opts = {}
    let vim_job_opts['in_io'] = 'null'
    let vim_job_opts['out_msg'] = 0
    let vim_job_opts['cwd'] = l:cwd
    let vim_job_opts['exit_cb'] = function('s:vim_job_exit_cb', [ l:callback_info ]) 
    let vim_job_opts['close_cb'] = function('s:vim_channel_close_cb', [ l:callback_info ])
    return vim_job_opts
endfunction

" The order in which the exit_cb and close_cb of a vim job are called does
" appear to be random.
function! s:vim_job_exit_cb(callback_info, job, exitstatus)
    let a:callback_info['exit_cb_called'] = 1
    let a:callback_info['job_exit_status'] = a:exitstatus
    let a:callback_info['job'] = a:job
    call s:vim_job_completed(a:callback_info)
endfunc

function! s:vim_channel_close_cb(callback_info, channel)
    let a:callback_info['close_cb_called'] = 1
    let a:callback_info['job_output'] = ''
    let l:channel_info = ch_info(a:channel)
    if l:channel_info['out_status'] == "buffered"
        let a:callback_info['job_output'] = ch_read(a:channel)
    endif
    call s:vim_job_completed(a:callback_info)
endfunction

function! s:vim_job_completed(callback_info)
    if !has_key(a:callback_info, 'exit_cb_called')
        return
    endif
    if has_key(a:callback_info, 'completed_cb') && !has_key(a:callback_info, 'close_cb_called')
        return
    endif

    let l:elapsed_time = reltimefloat(reltime(a:callback_info['start_time']))
    if has_key(a:callback_info, 'completed_cb') && has_key(a:callback_info, 'job_output')
        let l:stdout = a:callback_info['job_output'] 
        let l:unused = a:callback_info['completed_cb'](l:stdout)
    endif
    call s:update_jc_running_jobs(-1)
    redraw!
    let l:end_message = ''
    let l:exit_status = a:callback_info['job_exit_status']
    if has_key(a:callback_info, 'end_message')
        let l:usr_exit_message = a:callback_info['end_message']
        let l:end_message = printf('%s. Elapsed Time: %.1fs. With status: %d', l:usr_exit_message, l:elapsed_time, l:exit_status)
    else
        let l:job = a:callback_info['job']
        let l:end_message = printf('Finished job %s in: %.1fs with status: %d', l:job, l:elapsed_time, l:exit_status)
    endif
    echo l:end_message
endfunction

function! s:update_jc_running_jobs(summand)
    let g:JCRunningJobs = g:JCRunningJobs + a:summand
    silent doautocmd User jc_jobs_changed
endfunction

function! s:show_in_quickfix(content)
    cgete a:content
    if len(getqflist()) > 0
        copen
    else
        cclose
    endif
endfunction
