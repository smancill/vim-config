" vimrc: executed by Vim at startup
"
" SPDX-FileCopyrightText: © 2012 Sebastián Mancilla <smancill@smancill.dev>
"
" SPDX-License-Identifier: MIT-0

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ENVIRONMENT                           {{{1
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

if empty($XDG_CONFIG_HOME)
  let $XDG_CONFIG_HOME = $HOME . '/.config'
endif

if empty($XDG_CACHE_HOME)
  let $XDG_CACHE_HOME = $HOME . '/.cache'
endif

if empty($XDG_DATA_HOME)
  let $XDG_DATA_HOME = $HOME . '/.local/share'
endif

if has('nvim')
  let $VIM_CONFIG_HOME = $XDG_CONFIG_HOME . '/nvim'
else
  let $VIM_CONFIG_HOME = $HOME . '/.vim'
endif

if empty($VIM_CONFIG_LOAD_PRIVATE_RC)
  let $VIM_CONFIG_LOAD_PRIVATE_RC = '1'
endif


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" PLUGINS                               {{{1
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Use vim-plug
set nocompatible

if has('vim_starting')
  if empty(glob($VIM_CONFIG_HOME . '/autoload/plug.vim'))
    echomsg 'Plugin manager "vim-plug" not found.'
    echomsg 'Run "./install.sh" in your $VIMHOME directory.'
    exit
  endif
endif

function! s:deregister(repo)
  let repo = substitute(a:repo, '[\/]\+$', '', '')
  let name = fnamemodify(repo, ':t:s?\.git$??')
  call remove(g:plugs, name)
  call remove(g:plugs_order, index(g:plugs_order, name))
endfunction

function! s:plugins_update() abort
  let snapshot_dir = $VIM_CONFIG_HOME . '/tmp/snapshot'
  if !isdirectory(snapshot_dir)
    call mkdir(snapshot_dir, 'p')
  endif
  exe 'PlugSnapshot! '.snapshot_dir . '/plug-' . strftime('%Y-%m-%dT%H:%M') . '.vim'
  close
  PlugUpdate
endfu

command! -nargs=1 -bar UnPlug call s:deregister(<args>)
command! -bar PlugSafeUpdate call s:plugins_update()


call plug#begin($VIM_CONFIG_HOME . '/bundle')

" Load bundles
let s:bundle_patterns = [
  \ $VIM_CONFIG_HOME . '/bundle.vim',
  \ $VIM_CONFIG_HOME . '/bundle_?*.vim',
  \ ]
if $VIM_CONFIG_LOAD_PRIVATE_RC == '1'
  let s:bundle_patterns += [
    \ $VIM_CONFIG_HOME . '/bundle.local',
    \ $VIM_CONFIG_HOME . '/private/bundle*.vim',
    \ ]
endif
for s:bundle_pattern in s:bundle_patterns
  for s:bundle_file in split(glob(s:bundle_pattern, '\n'))
    execute 'source' s:bundle_file
  endfor
endfor

call plug#end()

delcom UnPlug


" Support private directory
if $VIM_CONFIG_LOAD_PRIVATE_RC == '1'
  set rtp-=$VIM_CONFIG_HOME
  set rtp^=$VIM_CONFIG_HOME/private
  set rtp^=$VIM_CONFIG_HOME

  " Allow overriding settings in $VIM_CONFIG_HOME/after
  set rtp+=$VIM_CONFIG_HOME/private/after
endif


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" OPTIONS                               {{{1
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set history=500                             " How many lines of history
set vb t_vb=                                " Disable beep
set synmaxcol=256                           " Prevent lag with long lines
set nrformats-=octal                        " Don't detect octal numbers

if !has('nvim')
  set ttimeout                              " Time out mappings and keycodes
  set ttimeoutlen=100                       " Shorter time out for keycodes
endif

set autoread                                " Read files if changed outside
set nobackup                                " Do not use backups (Git FTW)
set fileencoding=utf-8                      " Default file encoding
set fileformats=unix,dos,mac                " Support all EOLs by default
set fileformat=unix                         " Default end of line

if !has('nvim')
  set directory^=$XDG_CACHE_HOME/vim/swap//   " Location of swap files
  set backupdir^=$XDG_CACHE_HOME/vim/backup// " Location of backup files
endif
if has('persistent_undo')
  if !has('nvim')
    set undodir^=$XDG_CACHE_HOME/vim/undo//   " Location of undo files
  endif
  set undofile                              " Active persistent undo
endif

set mouse=a                                 " Use mouse in all modes
set backspace=indent,eol,start              " Backspace works in Insert mode
set whichwrap=b,s,<,>,[,]                   " Move cursor to other lines

set hidden                                  " Change buffer whitout saving
set switchbuf=useopen                       " Change to buffer in open window
set splitright                              " New windows on the right

set tabpagemax=15                           " Show 15 tabs
set showmode                                " Always show the mode
set showcmd                                 " Always show the command
set ruler                                   " Show position of the cursor
set number                                  " Show line numbers
set laststatus=2                            " Always show statusline
set shortmess+=aI                           " Abbreviate status messages
set rulerformat=%25(%LL\ \ \ %l,%c%V%=%P%)  " Ruler string
if has('nvim')
  set guicursor=
endif

set wildmenu                                " Better command-line completion
set wildmode=longest:full,full              " Completion options
set wildignore+=*.bak,*~,*.swp              " Ignore these files
set wildignore+=*.o,*.os,*.so,*.dylib,*.gch,*.mod,*.class
set wildignore+=*.py[co],*.rb[co],__pycache__
set wildignorecase                          " Ignore case in file completion

set tabstop=4                               " Four spaces for a tab
set softtabstop=4                           " Four spaces for a tab
set smarttab                                " Smart tabs at beginning of line
set expandtab                               " Use spaces instead of tabs
set shiftround                              " Indent to multiple of shiftwidth
set shiftwidth=4                            " Default indent of four spaces

set autoindent                              " Indent new lines using previous
set nojoinspaces                            " One space after sentences
set wrap                                    " Softwrap long lines
set linebreak                               " Wrap at spaces characters
if v:version > 703 || v:version == 703 && has('patch541')
  set formatoptions+=j                      " Delete comment when joining lines
endif
set display+=lastline                       " If wrap set, display last line
set virtualedit=block                       " Move freely in visual block
if has("patch-8.1.0360")
  set diffopt+=algorithm:histogram          " Set diff algorithm
endif

set incsearch                               " Search word while typing
set ignorecase                              " Ignore case in search patterns
set smartcase                               " But override if uppercase used
set hlsearch                                " Highlight search

set complete-=i                             " Ignore include files
if has('patch-7.4.775')                     " Completion menu options
  set completeopt=menuone,preview,noinsert
else
  set completeopt=menuone,preview
endif
set pumheight=10                            " Size of completion menu

set spelllang=es,en                         " Spelling languages
set spellsuggest=10                         " Number of spelling suggestions
set spellfile=$VIM_CONFIG_HOME/spell/mine.utf-8.add " Spell file for additions

set tags=./.tags;,./tags;                   " Use a dot tags file

set viminfo^=!                              " Save uppercase variables
set sessionoptions-=options                 " Options can corrupt sessions

" Better unprintable characters
if &termencoding ==# 'utf-8' || &encoding ==# 'utf-8'
  let &listchars = "tab:\u25b8 ,trail:\u2423,nbsp:\u26ad,eol:\u00ac,extends:\u21c9,precedes:\u21c7"
  let &fillchars = "fold:\u00b7"
  let &showbreak = "\u00bb "
endif


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" GLOBAL MAPPINGS                       {{{1
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Toggle ['] and [`] keys for moving to marks
nnoremap ' `
nnoremap ` '

" Better navigation in long lines
nnoremap <expr>     j             (v:count ? 'j' : 'gj')
nnoremap <expr>     k             (v:count ? 'k' : 'gk')

" Buffers
nnoremap <silent>   <C-k>         :<C-U>b#<CR>

" Make Y consistent with C and D (see :help Y)
nnoremap Y y$

" Omnicompletion popup menu like IDE
inoremap <expr>     <CR>          pumvisible() ? "\<C-y>" : "\<CR>"
inoremap <expr>     <Down>        pumvisible() ? "\<C-n>" : "\<Down>"
inoremap <expr>     <Up>          pumvisible() ? "\<C-p>" : "\<Up>"

" Command line history
cnoremap            <C-P>         <Up>
cnoremap            <C-N>         <Down>

" Disable unwanted keys in normal mode
nnoremap            <F1>          <nop>
nnoremap            Q             gq

" Use <C-L> to clear the highlighting of :set hlsearch
if maparg('<C-L>', 'n') ==# ''
  nnoremap <silent>   <C-L>         :<C-U>nohlsearch<CR>:diffupdate<CR><C-L>
endif

" Break undo after CTRL-U
inoremap            <C-U>         <C-G>u<C-U>


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" AUTOCOMMANDS                          {{{1
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

augroup vimrc_autocommands
autocmd!

" Restore cursor position
autocmd BufReadPost *
  \ if line("'\"") >= 1 && line("'\"") <= line("$") && &ft !~# 'commit\|stg' |
  \   exe "normal! g`\"" |
  \ endif

" Save current view settings on a per-window, per-buffer basis
function! AutoSaveWinView()
  if !exists('w:SavedBufView')
    let w:SavedBufView = {}
  endif
  let w:SavedBufView[bufnr('%')] = winsaveview()
endfunction

" Restore current view settings
function! AutoRestoreWinView()
  let buf = bufnr('%')
  if exists('w:SavedBufView') && has_key(w:SavedBufView, buf)
    let v = winsaveview()
    let atStartOfFile = v.lnum == 1 && v.col == 0
    if atStartOfFile && !&diff
      call winrestview(w:SavedBufView[buf])
    endif
    unlet w:SavedBufView[buf]
  endif
endfunction

" When switching buffers, preserve window view
if v:version >= 700
  autocmd BufLeave * call AutoSaveWinView()
  autocmd BufEnter * call AutoRestoreWinView()
endif

" Automatically close popup menu and preview window for omnicompletion
autocmd CursorMovedI,InsertLeave *
  \ if pumvisible() == 0 |
  \   silent! pclose |
  \ endif

if v:version >= 801
  autocmd CmdlineEnter : set noignorecase
  autocmd CmdlineLeave : set ignorecase
endif

" Always put quickfix window in the bottom
autocmd FileType qf wincmd J

" If last windows is quickfix window, exit Vim
autocmd BufEnter *
  \ if &buftype == 'quickfix' |
  \   if winbufnr(2) == -1 |
  \     quit! |
  \   endif |
  \ endif

autocmd BufRead /private/var/folders/*,/var/folders/*,/tmp/*
  \ setlocal noundofile

" Terminal buffers
if v:version >= 801
  autocmd TerminalOpen * if &buftype == 'terminal' | setlocal nonumber | endif
endif

augroup END


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" TERM AND COLORSCHEME                  {{{1
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

if $COLORTERM == 'gnome-terminal'
  set t_Co=256
  let s:color_squeme = 'inkpot'
elseif $TERM =~ 'rxvt' || $TERM =~ '256color'
  set t_Co=256
  let s:color_squeme = 'darkglass'
endif

try
  if exists('s:color_squeme')
    exe 'colorscheme ' . s:color_squeme
  endif
catch /^Vim\%((\a\+)\)\=:E185/
endtry

" Change color of completion menu according to the terminal and current
" colorsqueme
highlight PmenuSel ctermbg=white
highlight PmenuSel ctermfg=black


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" EXTRA CONFIGURATION                   {{{1
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Load extra vimrc
let s:vimrc_patterns = [
  \ $VIM_CONFIG_HOME . '/vimrc_?*',
  \ ]
if $VIM_CONFIG_LOAD_PRIVATE_RC == '1'
  let s:vimrc_patterns += [
    \ $VIM_CONFIG_HOME . '/vimrc.local',
    \ $VIM_CONFIG_HOME . '/private/vimrc*',
    \ ]
endif
for s:vimrc_pattern in s:vimrc_patterns
  for s:vimrc_file in split(glob(s:vimrc_pattern, '\n'))
    execute 'source' s:vimrc_file
  endfor
endfor

"}}}
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim: foldmethod=marker foldlevel=5
