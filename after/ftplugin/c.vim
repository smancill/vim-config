" c.vim: settings for C files

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" OPTIONS                               {{{1
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

setlocal tabstop=8                          " Tabs use 8 spaces
setlocal shiftwidth=8                       " Indent using 8 spaces
setlocal textwidth=78                       " Use 78 columns for text width
setlocal cindent                            " Indent using C indenting rules
setlocal formatoptions=cqro                 " Change text options to C format
setlocal nospell                            " Do not use spell
setlocal nowrap                             " Do not wrap long lines
setlocal popt=left:8pc,right:3pc            " Print options

"}}}
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim: foldmethod=marker
