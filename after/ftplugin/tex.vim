""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" LATEX SUITE
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

setlocal grepprg=grep\ -nH\ $*              " grep always generate a filename
setlocal iskeyword+=:                       " Completion after :

" Redefine environments
let g:Tex_Env_{'figure'}="\\begin{figure}[<+HTPB+>]\<CR>\\centering\<CR>\\includegraphics[<+SIZE+>]{<+IMAGE+>}\<CR>\\caption{<+TEXT+>}\<CR>\\label{fig:<+REF+>}\<CR>\\end{figure}<++>"

" New environment
call IMAP('EFM', "\\begin{frame}\<CR>\\frametitle{<+TITLE+>}\<CR><+BODY+>\<CR>\\end{frame}<++>", 'tex')

" Map to separate sections
call IMAP('#c', "%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%\<CR>", 'tex')
