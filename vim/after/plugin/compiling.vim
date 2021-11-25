if !exists('g:MakeTarget')
	let g:MakeTarget=''
endif
if !exists('s:MakeDir')
	let s:MakeDir='./'
endif

let s:make_counter=0
let s:error_count=0

function! Compile()
	while !filereadable(s:MakeDir . "Makefile")
		let s:MakeDir = input("Makefile Directory: ", "./", "dir")
		if strlen(s:MakeDir) == 0
			echom "Makefile is required. Quitting"
			return
		endif
	endwhile

	if PromptUserToSaveBuffers() < 0
		return
	endif

	let l:job_num = s:make_counter
	let s:make_counter += 1
	echom "Making target " . g:MakeTarget . " - " . l:job_num . " ..."
	let l:make_command = ["make", "-s"]
	if strlen(g:MakeTarget) > 0
		call add(l:make_command, g:MakeTarget)
	endif
	let l:start_time = reltime()
	let l:job_opts = {}
	let l:job_opts["stdin"] = "null"
	let l:job_opts["stdout_buffered"] = 1
	let l:job_opts["stderr_buffered"] = 1
	let l:job_opts["on_stdout"] = function('s:job_cb', [l:job_num, l:start_time])
	let l:job_opts["on_stderr"] = function('s:job_cb', [l:job_num, l:start_time])
	let l:job_opts["on_exit"] = function('s:job_cb', [l:job_num, l:start_time])
	if strlen(s:MakeDir) > 0
		let l:job_opts["cwd"] = s:MakeDir
	endif
	call jobstart(l:make_command, l:job_opts)
endfunction

function! s:job_cb(job_num, start_time, job_id, data, event)
	if a:event == 'stdout'
		if len(a:data) == 1 && strlen(a:data[0]) == 0
			cclose
			return
		endif
		call s:display_errors_in_quickfix(a:data)
	elseif a:event == 'stderr'
		if len(a:data) == 1 && strlen(a:data[0]) == 0
			cclose
			return
		endif
		call s:display_errors_in_quickfix(a:data)
	elseif a:event == 'exit'
		let l:elapsed_time = reltimefloat(reltime(a:start_time))
		if s:error_count > 0
			echohl EchoError
		else
			echohl EchoSuccess
		endif
		echom printf('Make completed in %.1fs - %d', l:elapsed_time, a:job_num)
		echohl None
		let s:error_count=0
	endif
endfunction

function! s:display_errors_in_quickfix(errors)
	let l:efm_bak = &errorformat
	let &errorformat = s:guess_errorformat()
	cgete a:errors
	let s:error_count = 0
	for e in getqflist()
		if e.valid
			let s:error_count += 1
		endif
	endfor
	if s:error_count > 0
		copen
	else
		cclose
	endif
	let &errorformat = l:efm_bak
endfunction

function! s:guess_errorformat()
	if len(glob('*.sln')) > 0 || len(glob('*.csproj')) > 0
		return
			\ '%-G,' .
			\ '%-Gtime\ elapsed\ %.%#,' .
			\ '%-G\ \ \ \ %.%#,' .
			\ '%-Gmake:\ *** %.%#,' .
			\ '%-GBuild\ %.%#,' .
			\ '%f(%l\,%c): %m'
	endif
	return &errorformat
endfunction

"                                   Mappings
" =============================================================================
"
nmap gm :call Compile()<cr>
