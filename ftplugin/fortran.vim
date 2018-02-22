" fortran.vim: settings for Fortran files

setlocal nowrap

setlocal tabstop=4
setlocal softtabstop=4
setlocal shiftwidth=4


nnoremap <buffer> <silent> ]]  /\v\c^\s*%(<end)@!(subroutine<bar>((\w+<bar>\w+\s*\(\w+\))\s+)*function)\s+\zs\w+<CR>zt3<C-y>
nnoremap <buffer> <silent> [[  ?\v\c^\s*%(<end)@!(subroutine<bar>((\w+<bar>\w+\s*\(\w+\))\s+)*function)\s+\zs\w+<CR>zt3<C-y>

nnoremap <buffer> <silent> ][  /\v\c^\s*end\s*(subroutine<bar>function)\s+\zs\w+<CR>zt3<C-y>
nnoremap <buffer> <silent> []  ?\v\c^\s*end\s*(subroutine<bar>function)\s+\zs\w+<CR>zt3<C-y>
