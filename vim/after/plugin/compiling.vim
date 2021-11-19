if !exists('g:MakeTarget')
	let g:MakeTarget=''
endif
if !exists('g:MakeDir')
	let s:MakeDir='./'
endif

function! Compile()
	while !filereadable(s:MakeDir . "Makefile")
		let s:MakeDir = input("Makefile Directory: ", "./", "dir")
		if len(s:MakeDir) == 0
			echom "Makefile is required. Quitting"
			return
		endif
	endwhile

	if PromptUserToSaveBuffers() < 0
		return
	endif

	echo "Making target " . g:MakeTarget
	let l:make_command = ["make", "-s"]
	if len(g:MakeTarget) > 0
		call append(l:make_command, g:MakeTarget)
	endif
	let l:start_time = reltime()
	let l:job_opts = {}
	let l:job_opts["stdin"] = "null"
	let l:job_opts["stdout_buffered"] = 1
	let l:job_opts["stderr_buffered"] = 1
	let l:job_opts["on_stdout"] = function('s:job_cb', [l:start_time])
	let l:job_opts["on_stderr"] = function('s:job_cb', [l:start_time])
	let l:job_opts["on_exit"] = function('s:job_cb', [l:start_time])
	if len(s:MakeDir) > 0
		let l:job_opts["cwd"] = s:MakeDir
	endif
	call jobstart(l:make_command, l:job_opts)
endfunction

function! s:job_cb(start_time, job_id, data, event)
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
		echo printf('Make completed in %.1fs', l:elapsed_time)
		let s:error_count=0
	endif
endfunction

function! s:display_errors_in_quickfix(errors)
	let l:efm_bak = &errorformat
	let &errorformat = s:guess_errorformat()
	cgete a:errors
	let s:error_count=len(getqflist())
	if s:error_count > 0
		copen
	else
		cclose
	endif
	let &errorformat = l:efm_bak
endfunction

function! s:guess_errorformat()
	if filereadable('*.sln')
		return '%f(%l\,%c): %m'
	endif
	if filereadable('*.csproj')
		return '%f(%l\,%c): %m'
	endif
	if filereadable('Cargo.toml')
		"set errorformat^=
		"            \%-G,
		"            \%-Gerror:\ aborting\ %.%#,
		"            \%-Gerror:\ Could\ not\ compile\ %.%#,
		"            \%-G%\\s%#To\ learn\ more\\,%.%#,
		"            \%Eerror:\ %m,
		"            \%Eerror[E%n]:\ %m,
		"            \%Wwarning:\ %m,
		"            \%Inote:\ %m,
		"            \%C\ %#-->\ %f:%l:%c,
		"            \%E\ \ left:%m,%C\ right:%m\ %f:%l:%c,%Z
	endif
	return &errorformat
endfunction

"                                   Mappings
" =============================================================================
"
nmap gm :call Compile()<cr>
