command! PrintSynStack :call PrintSynStack()
command! PrintTextProps :call PrintTextProps()

function! PrintSynStack()
    if !exists("*synstack")
        return
    endif
    echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc

function! PrintTextProps()
    let l:cursorpos = getcurpos()
    let l:textprops = prop_list(l:cursorpos[1])
    let l:postextprops = []
    let l:curcol = l:cursorpos[2]
    for l:textprop in l:textprops
        let l:propstartcol = l:textprop['col']
        let l:propendcol = l:textprop['col'] + l:textprop['length']
        if l:curcol >= l:propstartcol && l:curcol <= l:propendcol
            let l:prop_type = prop_type_get(l:textprop.type)
            echo l:prop_type
            echo l:textprop
        endif
    endfor
endfunc
