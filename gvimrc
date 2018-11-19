set nocompatible
source $VIMRUNTIME/mswin.vim

set nowrap
set vb t_vb=

set gfn=Ubuntu\ Mono\ 10
set guioptions=irec
set bg=light
colo darkglass

" Load extra gvimrc
let s:gvimrc_patterns = [
  \ '~/.vim/gvimrc_?*',
  \ '~/.vim/gvimrc.local',
  \ '~/.vim/private/gvimrc*'
  \ ]
for s:gvimrc_pattern in s:gvimrc_patterns
  for s:gvimrc_file in split(glob(s:gvimrc_pattern, '\n'))
    execute 'source' s:gvimrc_file
  endfor
endfor
