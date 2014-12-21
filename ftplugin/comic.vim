" comic.vim: settings for my custom comic scripts

setlocal textwidth=78
setlocal spell

setlocal tabstop=8
setlocal softtabstop=8
setlocal shiftwidth=8


iabbr pg PÁGINA


nnoremap <buffer> <silent>  [[    ?^PÁGINA \d\+$<CR>
nnoremap <buffer> <silent>  ]]    /^PÁGINA \d\+$<CR>


let g:tagbar_type_comic = {
	\ 'ctagstype' : 'comic',
	\ 'kinds' : [
		\ 'p:Páginas'
	\ ],
  \ 'sort'    : 0,
  \ 'deffile' : expand('~/.vim/ftplugin/comic/comic.cnf')
\ }
