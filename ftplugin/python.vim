" python.vim: settings for Python files

setlocal formatoptions=croql
setlocal nowrap

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


" Execute a selection of code
python << EOL
import vim
def EvaluateCurrentRange():
    eval(compile('\n'.join(vim.current.range),'','exec'),globals())
EOL

" run the current buffer
nnoremap <buffer> <silent>  <F9>    :make<CR>

" run the selected range
vnoremap <buffer> <silent>  <F9>    :py EvaluateCurrentRange()<CR>
