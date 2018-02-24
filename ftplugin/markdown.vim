" markdown.vim: settings for Markdown markup files

nnoremap <buffer> <silent>  <F9>         :<C-U>PrevimOpen<CR>

let g:tagbar_type_markdown = {
	\ 'ctagstype' : 'markdown',
	\ 'kinds' : [
		\ 'h:headings'
	\ ],
  \ 'sort'    : 0,
  \ 'deffile' : expand('~/.vim/ftplugin/markdown/markdown.cnf')
\ }
