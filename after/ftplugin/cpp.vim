" cpp.vim: settings for C++ files

setlocal commentstring=//%s

setlocal tabstop=4
setlocal softtabstop=4
setlocal shiftwidth=4
setlocal cinoptions+=g0


" ALE/clang_complete customization
if !filereadable('.project.vim')
  " Better default options that do not interfere with compilation database
  if findfile('compile_commands.json', '.,build') == ''
    if g:ale_cpp_gcc_options == ''
      let g:ale_cpp_gcc_options = '-std=c++14 -Wall'
    endif
    if g:clang_user_options !~ '-std='
      let g:clang_user_options .= ' -std=c++14'
    endif
  endif
endif
