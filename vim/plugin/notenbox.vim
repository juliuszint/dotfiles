let g:ProjectMakeTarget = "ios"

command! Build :call Build()
command! UpdateText :call JCStartJobInBuffer('../bin/updateText.sh', '<MiscOutput>', { 'start_msg' : 'Updating text resources ...', 'end_msg' : "Finished updating text resources" })
command! GenerateTags :call GenerateTags()
command! GenerateCode :call JCStartJobInBuffer('../bin/updateCode.sh', '<MiscOutput>', { 'start_msg' : 'Generating code ...', 'end_msg' : "Finished generating code" })
command! GenerateStoryboardCode :call JCStartJobInBuffer('../bin/updateStoryboardCode.sh', '<MiscOutput>', { 'start_msg' : 'Generating code ...', 'end_msg' : "Finished generating code" })

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
