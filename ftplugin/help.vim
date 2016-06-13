" help.vim: settings for Vim help files

setlocal nospell

" better navigation
nnoremap <buffer> <silent>  <CR>    <C-]>
nnoremap <buffer> <silent>  <BS>    <C-T>

" disable custom maps set on vimrc or by plugins
nnoremap <buffer> <silent>  <C-J>   <C-J>
nnoremap <buffer> <silent>  <C-K>   <C-K>
nnoremap <buffer> <silent>  <C-N>   <C-N>
nnoremap <buffer> <silent>  <C-P>   <C-P>
nnoremap <buffer> <silent>  <C-]>   <C-]>
nnoremap <buffer> <silent>  -       -
