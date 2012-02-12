setlocal nospell                            " Do not use spell


" Better navigation in help files
nnoremap <buffer> <silent>  <CR>    <C-]>
nnoremap <buffer> <silent>  <BS>    <C-T>

nnoremap <buffer> <silent>  o       /'[a-z]\{2,\}'<CR>l
nnoremap <buffer> <silent>  O       h?'[a-z]\{2,\}'<CR>l

nnoremap <buffer> <silent>  s       /\|\S\+\|<CR>l
nnoremap <buffer> <silent>  S       h?\|\S\+\|<CR>l
