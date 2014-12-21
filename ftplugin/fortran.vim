" fortran.vim: settings for Fortran files

setlocal tabstop=3
setlocal shiftwidth=3
setlocal formatoptions=cqro
setlocal nospell
setlocal nowrap


nnoremap <buffer> <silent> [[  ?^\s\+\(SUBROUTINE\<bar>FUNCTION\<bar>subroutine\<bar>function\)<CR>zt4<C-y>
nnoremap <buffer> <silent> ]]  /^\s\+\(SUBROUTINE\<bar>FUNCTION\<bar>subroutine\<bar>function\)<CR>zt4<C-y>
