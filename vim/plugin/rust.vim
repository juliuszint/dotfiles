if !filereadable('Cargo.toml')
    finish
endif

nmap gm :call StartCargoBuildJob()<cr>

function! StartCargoBuildJob()
    call PromptUserToSaveBuffers({ 'only_in_wd':1 })
    let l:opts = {}
    let l:opts['start_msg'] = 'Running cargo build ...'
    let l:command = ['cargo', 'build', '--quiet']
    call JCStartJobInQuickfix(l:command, l:opts)
endfunction

" cargo error format
set errorformat^=
            \%-G,
            \%-Gerror:\ aborting\ %.%#,
            \%-Gerror:\ Could\ not\ compile\ %.%#,
            \%-G%\\s%#To\ learn\ more\\,%.%#,
            \%Eerror:\ %m,
            \%Eerror[E%n]:\ %m,
            \%Wwarning:\ %m,
            \%Inote:\ %m,
            \%C\ %#-->\ %f:%l:%c,
            \%E\ \ left:%m,%C\ right:%m\ %f:%l:%c,%Z
