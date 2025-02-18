" asciidoc.vim: settings for AsciiDoc markup files
"
" SPDX-FileCopyrightText: © 2020 Sebastián Mancilla <smancill@smancill.dev>
"
" SPDX-License-Identifier: MIT-0

setlocal textwidth=78
setlocal spell

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
