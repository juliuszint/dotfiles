call NERDTreeAddKeyMap({
\                       'key': 'l',
\                       'callback': 'NERDTreeActivateHandler',
\                       'override': '1',
\                       'scope' : 'Node',
\                      })
function! NERDTreeActivateHandler(node)
    if a:node.path.isDirectory && !a:node.isOpen
        call a:node.activate()
    else
        call a:node.activate({'reuse': 'all', 'where': 'p'})
    endif
endfunction

call NERDTreeAddKeyMap({
\                       'key': 'h',
\                       'callback': 'NERDTreeMapCloseHandler',
\                       'override': '1',
\                       'scope' : 'Node',
\                      })
function! NERDTreeMapCloseHandler(node)
    if a:node.path.isDirectory && a:node.isOpen
        call a:node.close()
        call b:NERDTree.render()
        return
    endif

    " copied from https://github.com/scrooloose/nerdtree/blob/master/autoload/nerdtree/ui_glue.vim
    " s:closeDirNode
    if a:node.isRoot()
        call nerdtree#echo('cannot close parent of tree root')
        return
    endif

    let l:parent = a:node.parent

    while l:parent.isCascadable()
        let l:parent = l:parent.parent
    endwhile

    if l:parent.isRoot()
        call nerdtree#echo('cannot close tree root')
        return
    endif

    call l:parent.close()
    call b:NERDTree.render()
    call l:parent.putCursorHere(0, 0)
endfunction
