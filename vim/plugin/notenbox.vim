if !filereadable('NotenBoxAcht.sln')
    finish
endif

let g:MakeTarget = "ios"

command! Tests :call ExecuteCommand('./tests.sh')
command! TestFixture :call TestFixture()
command! UpdateText :call ExecuteCommand('../bin/updateText.sh')
command! GenerateCode :call ExecuteCommand('../bin/updateCode.sh')
command! GenerateStoryboardCode :call ExecuteCommand('../bin/updateStoryboardCode.sh')

function! TestFixture()
    " create filter expression
    let filterExpCmd = "rg -oNr'$1' '\\s+class\\s+(\\w+)' " . expand('%:p') . " | sed 's/^/FullyQualifiedName\\~/' | paste -sd '|' -"
    let filterExp = trim(system(filterExpCmd))
    if filterExp == ''
        echo "No Tests found in current file"
        return
    endif

    " look for csproj file
    let findCsProjCmd = "cd " . expand('%:p:h') . ";upfind -name '*.csproj'"
    let csProjFile = trim(system(findCsProjCmd))
    if csProjFile == ''
        echo "No project file found"
        return
    endif

    let job_command = "dotnet test --no-restore --nologo " . csProjFile . " --filter " . filterExp
    call ExecuteCommand(job_command)
endfunction

function! ExecuteCommand(command)
	echo "Executing " . a:command
	let l:job_command = [ a:command ]
	let l:start_time = reltime()
	let l:job_opts = {}
	let l:bufnr = s:get_scratch_buffer("NeovimJobOutput")
	let l:job_opts["stdin"] = "null"
	let l:job_opts["on_stdout"] = function('s:job_cb', [l:start_time, l:bufnr])
	let l:job_opts["on_stderr"] = function('s:job_cb', [l:start_time, l:bufnr])
	let l:job_opts["on_exit"] = function('s:job_cb', [l:start_time, l:bufnr])
	call jobstart(l:job_command, l:job_opts)
endfunction

function! s:get_scratch_buffer(name, options = {})
    if strlen(a:name) <= 0
	    return -1
    endif

    let l:bufnr = bufadd(a:name)
    call bufload(l:bufnr)
    call setbufvar(l:bufnr, "&buftype", get(a:options, 'buftype', 'nofile'))
    call setbufvar(l:bufnr, "&buflisted", get(a:options, 'buflisted', 1))
    call setbufvar(l:bufnr, "&modifiable", get(a:options, 'modifiable', 1))
    call deletebufline(l:bufnr, 1, '$')
    return l:bufnr
endfunction

let s:stdout_line=''
let s:stderr_line=''
function! s:job_cb(start_time, bufnr, job_id, data, event)
	if a:event == 'stdout'
		for d in a:data
			if len(d) == 0
				call appendbufline(a:bufnr, "$", s:stdout_line)
				let s:stdout_line=''
			endif
			let s:stdout_line .= d
		endfor
	elseif a:event == 'stderr'
		for d in a:data
			if len(d) == 0
				call appendbufline(a:bufnr, "$", s:stderr_line)
				let s:stderr_line=''
			endif
			let s:stderr_line .= d
		endfor
	elseif a:event == 'exit'
		let l:elapsed_time = reltimefloat(reltime(a:start_time))
		echo printf('Job completed in %.1fs', l:elapsed_time)
		let s:error_count=0
	endif
endfunction

"                                   Mappings
" =============================================================================
"
nmap gs :CSharpTypes<cr>
nmap <leader>xi :CSharpiOSTypes<cr>
nmap <leader>xm :CSharpmacOSTypes<cr>
nmap ggc :execute "Rx " . '(new\s+'.expand('<cword>').'\|ForPartsOf<'.expand('<cword>').'>)'<cr>
