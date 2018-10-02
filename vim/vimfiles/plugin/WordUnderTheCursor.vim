" WordUnderTheCursor plugin
"
" Provides highlighting the word under the cursor after a certain amount of
" time and does not interfere with searching
" The initial source was copied from https://www.vim.org/scripts/script.php?script_id=4306
" but this code was not clean enough.


if !exists('g:WordUnderTheCursor')
    let g:WordUnderTheCursorDelay = 1000
    let w:CurrentBufferTypeWantsMatch = 0
    let w:ActiveWindow = 0
endif

augroup WordUnderTheCursorAutoCommands
    autocmd!
    autocmd CursorMoved  *  call s:CursorMoved()
    autocmd BufEnter * call s:BufferOrFileTypeChanged()
    autocmd FileType * call s:BufferOrFileTypeChanged()
    autocmd WinLeave * call s:WinLeave()
    autocmd WinEnter * call s:WinEnter()
augroup END

function! s:WinEnter()
    let w:ActiveWindow = 1
endfunction

function! s:WinLeave()
    call s:StopTimer()
    call s:RemoveWordUnderTheCursorMatch()
    let w:ActiveWindow = 0
endfunction

function! s:BufferOrFileTypeChanged()
    let w:CurrentBufferTypeWantsMatch = 0
    let currentBufferNumber = bufnr("%")
    let bufFiletype = getbufvar(currentBufferNumber, '&filetype')
    if bufFiletype == 'cs'
        let w:CurrentBufferTypeWantsMatch = 1
    endif
endfunction

function! s:CursorMoved()
    if w:CurrentBufferTypeWantsMatch == 0
        return
    endif
    if w:ActiveWindow == 0
        return
    endif

    call s:RemoveWordUnderTheCursorMatch()
    call s:RescheduleTimer()
endfunction

function! s:RemoveWordUnderTheCursorMatch()
    if exists('w:MatchId')
        call matchdelete(w:MatchId)
        unlet w:MatchId
    endif
endfunction

function! s:RescheduleTimer()
    call s:StopTimer()
    let w:TimerId = timer_start(g:WordUnderTheCursorDelay, 'WordUnderTheCursorTimerElapsed')
endfunction

function! s:StopTimer()
    if exists('w:TimerId')
        call timer_stop(w:TimerId)
        unlet w:TimerId
    endif
endfunction

function! WordUnderTheCursorTimerElapsed(...)
    let wordUnderCursor = s:GetWordUnderTheCursor()
    if strlen(wordUnderCursor) == 0
        return
    endif
    let matchWord = '\C\V\<' . wordUnderCursor . '\>'
    let w:MatchId = matchadd('WordUnderTheCursor', wordUnderCursor)
endfunction

function! s:GetWordUnderTheCursor()
    let result = matchstr(getline('.'), '\k*\%' . col('.') . 'c\k\+')
    return result
endfunction
