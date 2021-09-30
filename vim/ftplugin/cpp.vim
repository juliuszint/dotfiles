setlocal colorcolumn=110
setlocal expandtab
setlocal shiftwidth=4
setlocal softtabstop=4

let g:cpp_class_regex='rg --column --line-number --no-heading --smart-case --only-matching --pcre2 --replace ''$2'' -- ''(class|struct)\s+(\w{4,}+)\s*($|[^;])'''
let g:cpp_class_regex_fzf_opts = { 'options': ['--with-nth=4', '--delimiter=:', '--color=hl:#AFD7AF,hl+:#AFD7AF'] }
nmap <C-t> :call fzf#vim#grep(g:cpp_class_regex, 1, copy(g:cpp_class_regex_fzf_opts), 0)<cr>
