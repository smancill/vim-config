" go.vim: settings for Go files

setlocal textwidth=78
setlocal nowrap

setlocal tabstop=8
setlocal softtabstop=8
setlocal shiftwidth=8

" always open a block
inoremap  <buffer>  {<CR>    {<CR>}<C-c>O
vnoremap  <buffer>  {<CR>   S{<CR>}<C-c>Pk=iB
