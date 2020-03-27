nnoremap <buffer> O :call JumpToTarget(0)<cr>
nnoremap <buffer> o :call JumpToTarget(1)<cr>

function! JumpToTarget(inCurrentBuffer)
    let l:columnNr = 0
    let l:rowNr = 0
    let l:lineNumber = line('.')
    let l:lineContent = getline(l:lineNumber)

    " extract row and column information of match
    let l:matchResult = matchlist(l:lineContent, '^\([0-9]*\):\([0-9]*\)\?')
    if len(l:matchResult) > 2
        if strlen(l:matchResult[1])
            let l:rowNr = l:matchResult[1]
        endif
        if strlen(l:matchResult[2])
            let l:columnNr = l:matchResult[2]
        endif
    endif

    " find the name of the file
    while l:lineNumber > 0
        let l:matchResult = match(l:lineContent, '^\D')
        if l:matchResult == -1
            let l:lineNumber -= 1
            let l:lineContent = getline(l:lineNumber)
        else
            break
        endif
    endwhile

    if !a:inCurrentBuffer
        call EnsureTopRowHasTwoColumns()
        let l:inactiveWindowId = GetInactiveTopRowWindow()
        exe l:inactiveWindowId . "wincmd w"
    endif
    execute ':e ' . l:lineContent
    call cursor(l:rowNr, l:columnNr)
endfunction
