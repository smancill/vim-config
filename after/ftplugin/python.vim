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

" run the current buffer
nnoremap <buffer> <silent>  <F9>    :make<CR>
