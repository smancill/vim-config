" cpp.vim: settings for C++ files
"
" SPDX-FileCopyrightText: © 2012 Sebastián Mancilla <smancill@smancill.dev>
"
" SPDX-License-Identifier: MIT-0

setlocal commentstring=//%s

setlocal softtabstop=4
setlocal shiftwidth=4
setlocal expandtab
setlocal cinoptions+=g0


if !g:vim_config_options.use_coc

" ALE customization
if !filereadable('.project.vim')
  " Better default options that do not interfere with compilation database
  if findfile('compile_commands.json', '.,build') == ''
    if !exists('g:ale_cpp_cc_options')
      let g:ale_cpp_cc_options = '-std=c++17 -Wall'
    endif
  endif
endif

endif
