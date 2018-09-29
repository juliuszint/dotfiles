" WordUnderTheCursor plugin
"
" Provides highlighting the word under the cursor after a certain amount of
" time and does not interfere with searching
" The initial source was copied from https://www.vim.org/scripts/script.php?script_id=4306
" but this code was not clean enough.



if !exists('g:WordUnderTheCursor')
    let g:WordUnderTheCursorDelay = 700
    let g:CurrentBufferTypeWantsMatch = 0
endif

augroup WordUnderTheCursorAutoCommands
    autocmd!
    autocmd CursorMoved  *  call s:CursorMoved()
    autocmd BufEnter * call s:BufferOrFileTypeChanged()
    autocmd FileType * call s:BufferOrFileTypeChanged()
augroup END

function! s:BufferOrFileTypeChanged()
    let g:CurrentBufferTypeWantsMatch = 0
    let currentBufferNumber = bufnr("%")
    let bufFiletype = getbufvar(currentBufferNumber, '&filetype')
    if bufFiletype == 'cs'
        let g:CurrentBufferTypeWantsMatch = 1
    endif
endfunction

function! s:CursorMoved()
    if g:CurrentBufferTypeWantsMatch == 0
        return
    endif

    call s:RemoveWordUnderTheCursorMatch()
    call s:RescheduleTimer()
endfunction

function! s:RemoveWordUnderTheCursorMatch()
    if exists('b:MatchId')
        call matchdelete(b:MatchId)
        unlet b:MatchId
    endif
endfunction

function! s:RescheduleTimer()
    if exists('b:TimerId')
        call timer_stop(b:TimerId)
        unlet b:TimerId
    endif
    let b:TimerId = timer_start(g:WordUnderTheCursorDelay, 'WordUnderTheCursorTimerElapsed')
endfunction

function! WordUnderTheCursorTimerElapsed(...)
    let wordUnderCursor = expand("<cword>")
    if strlen(wordUnderCursor) != 0
        let b:MatchId = matchadd('WordUnderTheCursor', wordUnderCursor)
    endif
endfunction
