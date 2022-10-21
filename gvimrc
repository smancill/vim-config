" SPDX-FileCopyrightText: © 2012 Sebastián Mancilla <smancill@smancill.dev>
"
" SPDX-License-Identifier: MIT-0

source $VIMRUNTIME/mswin.vim

set nowrap
set vb t_vb=

set gfn=Ubuntu\ Mono\ 10
set guioptions=irec
set bg=light
colo darkglass

" Load extra gvimrc
let s:gvimrc_files = [
  \ $VIM_CONFIG_HOME . '/vendor/gvimrc',
  \ $VIM_CONFIG_HOME . '/private/gvimrc'
  \ ]
endif
for s:gvimrc_file in s:gvimrc_files
  if filereadable(s:gvimrc_file)
    execute 'source' s:gvimrc_file
  endif
endfor
