" WordUnderTheCursor plugin
"
" Provides highlighting the word under the cursor after a certain amount of
" time and does not interfere with searching
" The initial source was copied from https://www.vim.org/scripts/script.php?script_id=4306

if !exists('g:WordUnderTheCursor')
    let g:WordUnderTheCursorDelay = 250
    let s:ActiveWindowWantsWordUnderCursor = 0
    let s:ActiveWindowId = -1
    let s:TimerId = -1
    let s:MatchId = -1
endif

augroup WordUnderTheCursorAutoCommands
    autocmd!
    autocmd CursorMoved  * call s:CursorMoved()
    autocmd FileType     * call s:EvaluateActiveWindowWantsWordUnderCursor()
    autocmd WinLeave     * call s:WinLeave()
    autocmd WinEnter     * call s:WinEnter()
augroup END

function! s:WinEnter()
    let s:ActiveWindowId = win_getid()
    call s:EvaluateActiveWindowWantsWordUnderCursor()
endfunction

function! s:WinLeave()
    if s:ActiveWindowId < 0
        return
    endif

    call s:StopTimer()
    call s:RemoveWordUnderTheCursorMatch()
    let s:ActiveWindowId = -1
endfunction

function! s:CursorMoved()
    if s:ActiveWindowId < 0
        return
    endif
    if s:ActiveWindowWantsWordUnderCursor == 0
        return
    endif

    call s:RemoveWordUnderTheCursorMatch()
    call s:ResetTimer()
endfunction

function! s:EvaluateActiveWindowWantsWordUnderCursor()
    let s:ActiveWindowWantsWordUnderCursor = 0
    let currentBufferNumber = bufnr("%")
    let bufFiletype = getbufvar(currentBufferNumber, '&filetype')
    if bufFiletype == 'cs'
        let s:ActiveWindowWantsWordUnderCursor = 1
    endif
endfunction

function! s:RemoveWordUnderTheCursorMatch()
    if s:MatchId < 0
        return
    endif
    " it is possible that a match gets removed automatically when for example
    " clearallmatches gets called
    try
        call matchdelete(s:MatchId)
    catch /./
    endtry
    let s:MatchId = -1
endfunction

function! WordUnderTheCursorTimerElapsed(...)
    call s:RemoveWordUnderTheCursorMatch()
    let wordUnderCursor = s:GetWordUnderTheCursor()
    if strlen(wordUnderCursor) == 0
        return
    endif
    let matchWord = '\C\V\<' . wordUnderCursor . '\>'
    let s:MatchId = matchadd('WordUnderTheCursor', matchWord, -1, -1, { 'window': s:ActiveWindowId })
endfunction

function! s:GetWordUnderTheCursor()
    let result = matchstr(getline('.'), '\k*\%' . col('.') . 'c\k\+')
    return result
endfunction

function! s:ResetTimer()
    call s:StopTimer()
    call s:StartTimer()
endfunction

function! s:StartTimer()
    if s:TimerId < 0
        let s:TimerId = timer_start(g:WordUnderTheCursorDelay, 'WordUnderTheCursorTimerElapsed')
    endif
endfunction

function! s:StopTimer()
    if s:TimerId > 0
        call timer_stop(s:TimerId)
        let s:TimerId = -1
    endif
endfunction
