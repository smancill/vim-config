setlocal tabstop=4                          " Tabs use 4 spaces
setlocal softtabstop=4                      " Tabs use 4 spaces
setlocal shiftwidth=4                       " Indent using 4 spaces
setlocal formatoptions=cqro                 " Format text
setlocal nospell                            " Do not use spell
setlocal nowrap                             " Do not wrap long lines

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" MAPPINGS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Use CTRL+SPACE for omnicompletion
inoremap <buffer> <silent> <C-@>    <C-x><C-o>


" Run the current buffer
setlocal makeprg=python\ %
setlocal errorformat=
  \%A\ \ File\ \"%f\"\\\,\ line\ %l\\\,%m,
  \%C\ \ \ \ %.%#,
  \%+Z%.%#Error\:\ %.%#,
  \%A\ \ File\ \"%f\"\\\,\ line\ %l,
  \%+C\ \ %.%#,
  \%-C%p^,
  \%Z%m,
  \%-G%.%#

nnoremap <buffer> <silent>  <F9>    :make<CR>


" Execute a selection of code
python << EOL
import vim
def EvaluateCurrentRange():
    eval(compile('\n'.join(vim.current.range),'','exec'),globals())
EOL

vnoremap <buffer> <silent>  <F9>    :py EvaluateCurrentRange()<CR>
