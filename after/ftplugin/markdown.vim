" markdown.vim: settings for Markdown markup files
"
" SPDX-FileCopyrightText: © 2012 Sebastián Mancilla <smancill@smancill.dev>
"
" SPDX-License-Identifier: MIT-0

setlocal textwidth=78
setlocal spell

setlocal softtabstop=4
setlocal shiftwidth=4

nnoremap <buffer> <silent>  [[           :call search('\v^(#<Bar>.+\n(\=+<Bar>-+)$)', 'bW')<CR>
nnoremap <buffer> <silent>  ]]           :call search('\v^(#<Bar>.+\n(\=+<Bar>-+)$)', 'W')<CR>
