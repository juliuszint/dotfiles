nnoremap <buffer> o :call Msbuild#JumpToLocation(0)<cr>
nnoremap <buffer> O :call Msbuild#JumpToLocation(1)<cr>

function! Msbuild#JumpToLocation(inCurrentBuffer)
    let l:columnNr = 0
    let l:rowNr = 0
    let l:lineNumber = line('.')
    let l:lineContent = getline(l:lineNumber)
    let l:fileName = ''

    " extract row and column information of match
    let l:matchResult = matchlist(l:lineContent, '^\([^:]*\)(\(\d*\),\(\d*\)')
    if len(l:matchResult) > 2
        if strlen(l:matchResult[1])
            let l:fileName = l:matchResult[1]
        endif
        if strlen(l:matchResult[2])
            let l:rowNr = l:matchResult[2]
        endif
        if strlen(l:matchResult[3])
            let l:columnNr = l:matchResult[3]
        endif
    endif

    if !a:inCurrentBuffer
        call EnsureTopRowHasTwoColumns()
        let l:inactiveWindowId = GetInactiveTopRowWindow()
        exe l:inactiveWindowId . "wincmd w"
    endif
    execute ':e ' . l:fileName
    call cursor(l:rowNr, l:columnNr)
endfunction
