" tex.vim: settings for LaTeX files

" grep always generate a filename
setlocal grepprg=grep\ -nH\ $*

" completion after :
setlocal iskeyword+=:


" redefine environments
let g:Tex_Env_{'figure'}="\\begin{figure}[<+HTPB+>]\<CR>\\centering\<CR>\\includegraphics[<+SIZE+>]{<+IMAGE+>}\<CR>\\caption{<+TEXT+>}\<CR>\\label{fig:<+REF+>}\<CR>\\end{figure}<++>"

" new environment
call IMAP('EFM', "\\begin{frame}\<CR>\\frametitle{<+TITLE+>}\<CR><+BODY+>\<CR>\\end{frame}<++>", 'tex')

" map to separate sections
call IMAP('#c', "%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%\<CR>", 'tex')
