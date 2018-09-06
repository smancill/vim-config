" markdown.vim: settings for Markdown markup files

setlocal textwidth=78
setlocal spell

setlocal tabstop=4
setlocal softtabstop=4
setlocal shiftwidth=4

nnoremap <buffer> <silent>  <F9>         :<C-U>PrevimOpen<CR>

let g:tagbar_type_markdown = {
  \ 'ctagstype' : 'markdown',
  \ 'kinds' : [
  \   'h:headings'
  \ ],
  \ 'sort'    : 0,
  \ 'deffile' : expand('<sfile>:p:h') . '/markdown/markdown.cnf'
  \ }
