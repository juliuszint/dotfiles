if !filereadable('NotenBoxAcht.sln')
    finish
endif

let g:ProjectMakeTarget = "ios"

command! Build :call Build()
command! UpdateText :call JCStartJobInBuffer('../bin/updateText.sh', '<MiscOutput>', { 'start_msg' : 'Updating text resources ...', 'end_msg' : "Finished updating text resources" })
command! GenerateTags :call GenerateTags()
command! GenerateCode :call JCStartJobInBuffer('../bin/updateCode.sh', '<MiscOutput>', { 'start_msg' : 'Generating code ...', 'end_msg' : "Finished generating code" })
command! GenerateStoryboardCode :call JCStartJobInBuffer('../bin/updateStoryboardCode.sh', '<MiscOutput>', { 'start_msg' : 'Generating code ...', 'end_msg' : "Finished generating code" })
command! Tests :call JCStartJobInBuffer('./tests.sh', '<DotnetTestOutput>', { 'start_msg' : 'Running all tests from Solution ...', 'end_msg' : 'Finished running all tests from Solution', 'ft' : "dnt", 'bringToFront' : 1})

nmap gm :call Build()<cr>

function! Build()
    if PromptUserToSaveBuffers() < 0
        return
    endif
    let l:opts = {}
    let l:opts['start_msg'] = 'Building NotenBox. Target=' . g:ProjectMakeTarget . ' ...'
    let l:opts['end_msg'] = 'Finished building NotenBox. Target=' . g:ProjectMakeTarget
    let l:command = ["make", g:ProjectMakeTarget]
    call JCStartJobInQuickfix(l:command, l:opts)
endfunction

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

let g:rg_command = 'rg --column --line-number --no-heading --smart-case -o -r=foo -r=\$2 -- '
let g:local_csharp_symbol_regex = g:rg_command.shellescape('(enum|class|struct|interface) (\w+)')
let g:xamarin_ios_csharp_symbol_regex = g:rg_command.shellescape('(enum|class|struct|interface) (\w+)').' /Volumes/awin/frameworkSource/Xamarin.iOS'
let g:xamarin_mac_csharp_symbol_regex = g:rg_command.shellescape('(enum|class|struct|interface) (\w+)').' /Volumes/awin/frameworkSource/Xamarin.Mac'
let g:fzf_symbol_options = { 'options': ['--with-nth=4', '--delimiter=:', '--color=hl:#AFD7AF,hl+:#AFD7AF', '--preview=echo {} | cut -d: -f1'] }
nmap <leader>xi :call fzf#vim#grep(g:xamarin_ios_csharp_symbol_regex, 1, copy(g:fzf_symbol_options), 0)<cr>
nmap <leader>xm :call fzf#vim#grep(g:xamarin_mac_csharp_symbol_regex, 1, copy(g:fzf_symbol_options), 0)<cr>
nmap <C-t> :call fzf#vim#grep(g:local_csharp_symbol_regex, 1, copy(g:fzf_symbol_options), 0)<cr>
