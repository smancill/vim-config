" markdown.vim: settings for Markdown markup files

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" MAPPINGS                              {{{1
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

nnoremap <buffer> <silent>  <F9>         :Hammer<CR>
inoremap <buffer> <silent>  <F9>    <Esc>:Hammer<CR>

vnoremap <buffer> <silent>  <LocalLeader>fi     <ESC>`<i*<ESC>`>ea*<ESC>
vnoremap <buffer> <silent>  <LocalLeader>fb     <ESC>`<i**<ESC>`>ea**<ESC>
vnoremap <buffer> <silent>  <LocalLeader>fm     <ESC>`<i`<ESC>`>ea`<ESC>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" TAGBAR SUPPORT                        {{{1
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:tagbar_type_markdown = {
	\ 'ctagstype' : 'markdown',
	\ 'kinds' : [
		\ 'h:headings'
	\ ],
  \ 'sort'    : 0,
  \ 'deffile' : expand('~/.vim/ftplugin/markdown/markdown.cnf')
\ }


"}}}
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim: foldmethod=marker
