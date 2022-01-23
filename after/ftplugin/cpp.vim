" cpp.vim: settings for C++ files

setlocal commentstring=//%s

setlocal tabstop=4
setlocal softtabstop=4
setlocal shiftwidth=4
setlocal expandtab
setlocal cinoptions+=g0


if $VIM_CONFIG_USE_COC != ''

" ALE customization
if !filereadable('.project.vim')
  " Better default options that do not interfere with compilation database
  if findfile('compile_commands.json', '.,build') == ''
    if !exists('g:ale_cpp_gcc_options')
      let g:ale_cpp_gcc_options = '-std=c++17 -Wall'
    endif
  endif
endif

endif
