command! Tests :call RunCommandAsJob('./tests.sh', '<DotnetTestOutput>', { 'msg' : 'Running all tests from Solution ...', 'exit_msg' : 'Finished running all tests from Solution', 'ft' : "dnt", 'bringToFront' : 1})
command! TestFixture :call TestFixture()
command! ImportSymbolUnderCursor :call ImportSymbolUnderCursor()

nmap <leader>i :ImportSymbolUnderCursor<cr>

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
    
    " run job
    let options = {}
    let options['ft'] = 'dnt'
    let options['msg'] = "Running tests matching filter: " . filterExp
    let options['exit_msg'] = "Dotnet test job finished"
    let jobCommand = "dotnet test --no-build --no-restore --nologo " . csProjFile . " --filter " . filterExp
    call RunCommandAsJob(jobCommand, '<DotnetTestOutput>', options)
endfunction

function! ImportSymbolUnderCursor()
    let command = "rg -l '(interface|class|struct|enum) " . expand("<cword>") . "\\b' | head -n 1 | xargs rg -o 'namespace\\s+([a-zA-Z.]+)' | awk '{print $2}'"
    let residingNamespace = system(command)
    let residingNamespace = trim(residingNamespace)
    let usingDirective = 'using ' . residingNamespace . ';'
    let save_pos = getpos(".")
    call setpos('.', [0, 0, 0, 0])
    let usingDirectivePattern = '\V\C' . usingDirective
    let existingUsingLn = search(usingDirectivePattern, 'n')
    if(existingUsingLn != 0)
        echo "Bereits importiert in Zeile:" . existingUsingLn
    else
        let lastLineNr = line('$')
        call setpos('.', [0, lastLineNr, 0, 0])
        let lastUsingLn = search('^using ', 'nb')
        if(lastUsingLn == 0)
            let lastUsingLn = 4
        endif
        let save_pos[1] += 1
        call append(lastUsingLn, usingDirective)
    endif
    call setpos('.', save_pos)
endfunction
