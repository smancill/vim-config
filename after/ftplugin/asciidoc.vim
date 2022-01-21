" asciidoc.vim: settings for AsciiDoc markup files

setlocal textwidth=78
setlocal spell

setlocal tabstop=2
setlocal softtabstop=2
setlocal shiftwidth=2

let g:tagbar_type_asciidoc = {
  \ 'ctagstype': 'asciidoc',
  \ 'kinds': [
  \   'h:headings'
  \ ],
  \ 'sort': 0,
  \ 'deffile': expand('<sfile>:p:h') . '/asciidoc/asciidoc.cnf'
  \ }
let g:tagbar_type_asciidoctor = g:tagbar_type_asciidoc
