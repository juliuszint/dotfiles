if !exists('g:TrailingWhitespaces')
    let g:TrailingWhitespaces = 1
    let g:TrailingWhitespacesBufferFileTypes = ["cs", "cpp", "c", "xaml", "dcg", "vim"]
    highlight ExtraWhitespace ctermbg=red guibg=red
endif

augroup TrailingWhitespacesAutoCmdGroup
    autocmd!
    autocmd BufWinEnter * call s:bufWinEnterCallback()
    autocmd InsertEnter * call s:insertEnterCallback()
    autocmd InsertLeave * call s:insertLeaveCallback()
    autocmd BufWinLeave * call s:bufWinLeaveCallback()
augroup END

function! s:bufWinEnterCallback()
    if s:bufferShouldHighlight()
        match ExtraWhitespace /\s\+$/
    endif
endfunction

function! s:insertEnterCallback()
    if s:bufferShouldHighlight()
        match ExtraWhitespace /\s\+\%#\@<!$/
    endif
endfunction

function! s:insertLeaveCallback()
    if s:bufferShouldHighlight()
        match ExtraWhitespace /\s\+$/
    endif
endfunction

function! s:bufWinLeaveCallback()
    if s:bufferShouldHighlight()
        call clearmatches()
    endif
endfunction

function! s:bufferShouldHighlight()
    let l:currentBufferNumber = bufnr("%")
    let l:bufFiletype = getbufvar(currentBufferNumber, '&filetype')
    let l:result = v:false
    for l:ft in g:TrailingWhitespacesBufferFileTypes
        if l:ft ==# l:bufFiletype
            let l:result = v:true
            break
        endif
    endfor
    return l:result
endfunction
