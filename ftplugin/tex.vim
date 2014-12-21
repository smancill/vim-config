" tex.vim: settings for LaTeX files

setlocal textwidth=78
setlocal spell

setlocal tabstop=2
setlocal softtabstop=2
setlocal shiftwidth=2


function! Jump2LaTeXSection(cnt, dir)
    let i = 0
    let pat = '^\\\(part\|chapter\|\(sub\)*section\|paragraph\)\>\|\%$\|\%^'
    let flags = 'W' . a:dir
    while i < a:cnt && search( pat, flags ) > 0
        let i = i+1
    endwhile
    let @/ = pat
endfunction

nnoremap <buffer> <silent>  ]]      :<C-U>call Jump2LaTeXSection(v:count1, '')<CR>
nnoremap <buffer> <silent>  [[      :<C-U>call Jump2LaTeXSection(v:count1, 'b')<CR>


let g:tagbar_type_tex = {
    \ 'ctagstype' : 'latex',
    \ 'kinds'     : [
        \ 's:sections',
        \ 'g:graphics',
        \ 'l:labels',
        \ 'r:refs:1',
        \ 'p:pagerefs:1'
    \ ],
    \ 'sort'    : 0,
    \ 'deffile' : expand('~/.vim/ftplugin/latex-suite/latex.cnf')
\ }
