" fortran.vim: settings for Fortran files

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" OPTIONS                               {{{1
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

setlocal tabstop=3                          " Tabs use 3 spaces
setlocal shiftwidth=3                       " Indent using 3 spaces
setlocal formatoptions=cqro                 " Format text
setlocal nospell                            " Do not use spell
setlocal nowrap                             " Do not wrap long lines


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" MAPPINGS                             {{{1
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

nnoremap <buffer> <silent> [[  ?^\s\+\(SUBROUTINE\<bar>FUNCTION\<bar>subroutine\<bar>function\)<CR>zt4<C-y>
nnoremap <buffer> <silent> ]]  /^\s\+\(SUBROUTINE\<bar>FUNCTION\<bar>subroutine\<bar>function\)<CR>zt4<C-y>

"}}}
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim: foldmethod=marker
