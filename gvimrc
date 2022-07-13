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
let s:gvimrc_patterns = [
  \ $VIM_CONFIG_HOME . '/gvimrc_?*',
  \ ]
if $VIM_CONFIG_LOAD_PRIVATE_RC == '1'
  let s:gvimrc_patterns += [
    \ $VIM_CONFIG_HOME . '/gvimrc.local',
    \ $VIM_CONFIG_HOME . '/private/gvimrc*'
    \ ]
endif
for s:gvimrc_pattern in s:gvimrc_patterns
  for s:gvimrc_file in split(glob(s:gvimrc_pattern, '\n'))
    execute 'source' s:gvimrc_file
  endfor
endfor
