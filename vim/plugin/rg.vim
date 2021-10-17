command! -complete=file -nargs=* Rg :call SearchForRegexQf(<f-args>)

function! SearchForRegexQf(...)
    let l:command = ['rg', '--vimgrep', '--smart-case']
    let l:command += a:000
    let l:opts = {}
    let l:opts["stdout_buffered"] = 1
    let l:opts["stderr_buffered"] = 1
    let l:opts["stdin"] = "null"
    let l:opts["on_stdout"] = function('s:JobEventHandler')
    let l:opts["on_stderr"] = function('s:JobEventHandler')
    let l:opts["on_exit"] = function('s:JobEventHandler')
    call jobstart(l:command, l:opts)
endfunction

function! s:JobEventHandler(job_id, data, event)
	if a:event == 'stdout'
		cgete a:data
		if len(getqflist()) > 0
			copen
		else
			cclose
		endif
	elseif a:event == 'stderr'
		if len(a:data) == 1 && strlen(a:data[0]) == 0
			return
		endif
		echom a:data
	elseif a:event == 'exit'
		echo "Done searching"
	endif
endfunction
