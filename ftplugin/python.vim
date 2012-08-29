" python.vim: settings for Python files

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" OPTIONS                               {{{1
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

setlocal tabstop=4                          " Tabs use 4 spaces
setlocal softtabstop=4                      " Tabs use 4 spaces
setlocal shiftwidth=4                       " Indent using 4 spaces
setlocal formatoptions=cqro                 " Format text
setlocal nospell                            " Do not use spell
setlocal nowrap                             " Do not wrap long lines
setlocal makeprg=python\ %                  " Use python as make program
setlocal errorformat=                       " Read python errors
  \%A\ \ File\ \"%f\"\\\,\ line\ %l\\\,%m,
  \%C\ \ \ \ %.%#,
  \%+Z%.%#Error\:\ %.%#,
  \%A\ \ File\ \"%f\"\\\,\ line\ %l,
  \%+C\ \ %.%#,
  \%-C%p^,
  \%Z%m,
  \%-G%.%#


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" FUNCTIONS                             {{{1
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Execute a selection of code
python << EOL
import vim
def EvaluateCurrentRange():
    eval(compile('\n'.join(vim.current.range),'','exec'),globals())
EOL


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" MAPPINGS                              {{{1
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Run the current buffer
nnoremap <buffer> <silent>  <F9>    :make<CR>

" Run the selected range
vnoremap <buffer> <silent>  <F9>    :py EvaluateCurrentRange()<CR>

"}}}
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim: foldmethod=marker
