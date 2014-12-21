" fortran.vim: settings for Fortran files

setlocal nowrap

setlocal tabstop=3
setlocal softtabstop=3
setlocal shiftwidth=3


nnoremap <buffer> <silent> [[  ?^\s\+\(SUBROUTINE\<bar>FUNCTION\<bar>subroutine\<bar>function\)<CR>zt4<C-y>
nnoremap <buffer> <silent> ]]  /^\s\+\(SUBROUTINE\<bar>FUNCTION\<bar>subroutine\<bar>function\)<CR>zt4<C-y>
