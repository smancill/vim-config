" tex.vim: settings for LaTeX files

setlocal textwidth=78
setlocal spell

setlocal tabstop=2
setlocal softtabstop=2
setlocal shiftwidth=2

let g:tagbar_type_tex = {
  \ 'ctagstype' : 'latex',
  \ 'kinds'     : [
  \   's:sections',
  \   'g:graphics',
  \   'l:labels',
  \   'r:refs:1',
  \   'p:pagerefs:1'
  \ ],
  \ 'sort'    : 0,
  \ 'deffile' : expand('~/.vim/after/ftplugin/latex/latex.cnf')
  \ }
