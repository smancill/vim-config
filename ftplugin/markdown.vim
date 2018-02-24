" markdown.vim: settings for Markdown markup files

nnoremap <buffer> <silent>  <F9>         :Hammer<CR>
inoremap <buffer> <silent>  <F9>    <Esc>:Hammer<CR>

let g:tagbar_type_markdown = {
	\ 'ctagstype' : 'markdown',
	\ 'kinds' : [
		\ 'h:headings'
	\ ],
  \ 'sort'    : 0,
  \ 'deffile' : expand('~/.vim/ftplugin/markdown/markdown.cnf')
\ }
