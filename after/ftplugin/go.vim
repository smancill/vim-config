" go.vim: settings for Go files
"
" SPDX-FileCopyrightText: © 2019 Sebastián Mancilla <smancill@smancill.dev>
"
" SPDX-License-Identifier: MIT-0

setlocal textwidth=78
setlocal nowrap

setlocal tabstop=8
setlocal softtabstop=8
setlocal shiftwidth=8

" always open a block
inoremap  <buffer>  {<CR>    {<CR>}<C-c>O
vnoremap  <buffer>  {<CR>   S{<CR>}<C-c>Pk=iB
