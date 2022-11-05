" fortran.vim: settings for Fortran files
"
" SPDX-FileCopyrightText: © 2012 Sebastián Mancilla <smancill@smancill.dev>
"
" SPDX-License-Identifier: MIT-0

setlocal nowrap

setlocal tabstop=4
setlocal softtabstop=4
setlocal shiftwidth=4

if executable('fprettify')
  let s:indent_size = get(g:, 'fortran_indent_size', 4)
  let &l:formatprg = 'fprettify --indent '.s:indent_size.' --silent'
endif

nnoremap <buffer> <silent> ]]  /\v\c^\s*%(<end)@!(subroutine<Bar>((\w+<Bar>\w+\s*\(\w+\))\s+)*function)\s+\zs\w+<CR>zt3<C-Y>
nnoremap <buffer> <silent> [[  ?\v\c^\s*%(<end)@!(subroutine<Bar>((\w+<Bar>\w+\s*\(\w+\))\s+)*function)\s+\zs\w+<CR>zt3<C-Y>

nnoremap <buffer> <silent> ][  /\v\c^\s*end\s*(subroutine<Bar>function)\s+\zs\w+<CR>zt3<C-Y>
nnoremap <buffer> <silent> []  ?\v\c^\s*end\s*(subroutine<Bar>function)\s+\zs\w+<CR>zt3<C-Y>
