if !filereadable('NotenBoxAcht.sln')
    finish
endif

let g:MakeTarget = "ios"

command! Tests :call JCStartJobInBuffer('./tests.sh', '<DotnetTestOutput>', { 'start_msg' : 'Running all tests from Solution ...', 'end_msg' : 'Finished running all tests from Solution', 'ft' : "dnt", 'bringToFront' : 1})
command! UpdateText :call JCStartJobInBuffer('../bin/updateText.sh', '<MiscOutput>', { 'start_msg' : 'Updating text resources ...', 'end_msg' : "Finished updating text resources" })
command! GenerateCode :call JCStartJobInBuffer('../bin/updateCode.sh', '<MiscOutput>', { 'start_msg' : 'Generating code ...', 'end_msg' : "Finished generating code" })
command! GenerateStoryboardCode :call JCStartJobInBuffer('../bin/updateStoryboardCode.sh', '<MiscOutput>', { 'start_msg' : 'Generating code ...', 'end_msg' : "Finished generating code" })

command! TestFixture :call TestFixture()
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
    let options['start_msg'] = "Running tests matching filter: " . filterExp
    let options['end_msg'] = "Dotnet test job finished"
    let jobCommand = "dotnet test --no-restore --nologo " . csProjFile . " --filter " . filterExp
    call JCStartJobInBuffer(jobCommand, '<DotnetTestOutput>', options)
endfunction

nmap gs :CSharpTypes<cr>
nmap <leader>xi :CSharpiOSTypes<cr>
nmap <leader>xm :CSharpmacOSTypes<cr>
nmap ggc :execute "Rx " . '(new\s+'.expand('<cword>').'\|ForPartsOf<'.expand('<cword>').'>)'<cr>
