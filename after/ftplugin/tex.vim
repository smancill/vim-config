""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" LATEX SUITE
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

setlocal grepprg=grep\ -nH\ $*              " grep always generate a filename
setlocal iskeyword+=:                       " Completion after :

" Map to separate sections
call IMAP('#c', "%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%\<CR>", 'tex')
