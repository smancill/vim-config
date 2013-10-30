" text.vim: settings for plain text files

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" OPTIONS                               {{{1
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

setlocal textwidth=78                       " Use 78 columns for text width
setlocal linebreak                          " Smart breaking of long lines
setlocal spell                              " Use spell
setlocal ts=8
setlocal sw=8

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ABBREVIATIONS                         {{{1
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

iabbr pg PÁGINA


" MAPPINGS                              {{{1
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

nnoremap <buffer> <silent>  [[    ?^PÁGINA \d\+$<CR>
nnoremap <buffer> <silent>  ]]    /^PÁGINA \d\+$<CR>


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" TAGBAR SUPPORT                        {{{1
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:tagbar_type_comic = {
	\ 'ctagstype' : 'comic',
	\ 'kinds' : [
		\ 'p:Páginas'
	\ ],
  \ 'sort'    : 0,
  \ 'deffile' : expand('~/.vim/ftplugin/comic/comic.cnf')
\ }


"}}}
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim: foldmethod=marker
