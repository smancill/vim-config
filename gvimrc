" SPDX-FileCopyrightText: © 2012 Sebastián Mancilla <smancill@smancill.dev>
"
" SPDX-License-Identifier: MIT-0

source $VIMRUNTIME/mswin.vim

set vb t_vb=

if has('mac')
  set guifont=SF\ Mono
endif
set guioptions=irec

if g:vim_config_options.use_colorscheme
colorscheme darkglass
endif

" Load extra gvimrc
let s:gvimrc_files = [
  \ $VIM_CONFIG_HOME . '/vendor/gvimrc',
  \ $VIM_CONFIG_HOME . '/private/gvimrc'
  \ ]
for s:gvimrc_file in s:gvimrc_files
  if filereadable(s:gvimrc_file)
    execute 'source' s:gvimrc_file
  endif
endfor
