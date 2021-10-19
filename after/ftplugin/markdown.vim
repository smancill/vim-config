" markdown.vim: settings for Markdown markup files

setlocal textwidth=78
setlocal spell

setlocal tabstop=4
setlocal softtabstop=4
setlocal shiftwidth=4

nnoremap <buffer> <silent>  <F9>         :<C-U>PrevimOpen<CR>
nnoremap <buffer> <silent>  [[           :call search('\v^(#<bar>.+\n(\=+<bar>-+)$)', 'bW')<CR>
nnoremap <buffer> <silent>  ]]           :call search('\v^(#<bar>.+\n(\=+<bar>-+)$)', 'W')<CR>
