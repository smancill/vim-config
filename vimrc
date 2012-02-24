" ~/.vimrc: executed by Vim at startup

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" PLUGINS                               {{{1
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Use NeoBundle
filetype off
set nocompatible

if has('vim_starting')
set runtimepath+=~/.vim/bundle/neobundle.vim
call neobundle#rc()
endif

" Required
NeoBundle 'smancill/neobundle.vim'

" Add your bundles in bundle.vim
source ~/.vim/bundle.vim

syntax on
filetype plugin indent on


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" PLUGINS CONFIGURATION                 {{{1
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Local vimrc                               {{{2
let g:local_vimrc='.project.vim'

" Ack                                       {{{2
let g:ackprg="ack-grep -H --nocolor --nogroup --column"

" Syntastic                                 {{{2
let g:syntastic_cpp_compiler_options = ' -std=c++0x'

" Tagbar                                    {{{2
nnoremap <silent> <F8> :TagbarToggle<CR>
let g:tagbar_autofocus = 1
let g:tagbar_compact = 1

" Clang Complete                            {{{2
let g:clang_use_library=1
let g:clang_library_path=expand('~/.vim/src/clang-3.0/lib')
let g:clang_periodic_quickfix=1

" LaTeX Suite                               {{{2
let g:tex_flavor="latex"              " filetype of *.tex, so LaTeXSuite works
let g:Tex_DefaultTargetFormat='pdf'
let g:Tex_IgnoreLevel=11
let g:Tex_IgnoredWarnings="Underfull\n".
                         \"Overfull\n".
                         \"specifier changed to\n".
                         \"You have requested\n".
                         \"Missing number, treated as zero\n".
                         \"There were undefined references\n".
                         \"Citation %.%# undefined\n".
                         \"Reference %.%# undefined\n".
                         \"Label `' multiply defined\n".
                         \"Label(s) may have changed\n".
                         \"There were multiply-defined labels"

" Fix e-acute problem in insert mode
imap   <buffer>   <C-L>i  <Plug>Tex_InsertItemOnThisLine

" QuickBuf                                  {{{2
let g:qb_hotkey="M"

" NERDTree                                  {{{2
nnoremap <silent>  <F3>              :NERDTreeToggle<CR>

" }}}


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" OPTIONS                               {{{1
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set history=500                             " How many lines of history
set vb t_vb=                                " Disable beep

set autoread                                " Read files if changed outside
set nobackup                                " Do not use backups (Git FTW)
set directory=./.swp,~/.vim/.files,/tmp     " Change path to swap files
set backupdir=./.bak,~/.vim/.files,/tmp     " Change path to backup files
set fenc=utf-8                              " Default file encoding
set ff=unix                                 " Default end of line

set mouse=a                                 " Use mouse in all modes
set backspace=indent,eol,start              " Backspace works in Insert mode
set whichwrap=b,s,<,>,[,]                   " Move cursor to other lines

set hidden                                  " Change buffer whitout saving
set switchbuf=usetab                        " Change to buffer in open tab

set tabpagemax=15                           " Show 15 tabs
set showmode                                " Always show the mode
set showcmd                                 " Always show the command
set ruler                                   " Show position of the cursor
set laststatus=2                            " Always show statusline
set rulerformat=%25(%LL\ \ \ %l,%c%V%=%P%)  " Ruler string

set wildmenu                                " Better command-line completion
set wildmode=longest,full                   " Completion options
set wildignore=*.bak,*.o,*.e,*~,*.py[co]    " Ignore this files

set tabstop=4                               " Four spaces for a tab
set softtabstop=4                           " Four spaces for a tab
set smarttab                                " Smart tabs at beginning of line
set expandtab                               " Use spaces instead of tabs
set shiftround                              " Indent to multiple of shiftwidth
set shiftwidth=4                            " Default indent of four spaces

set formatoptions=tq2                       " Set format options
set autoindent                              " Indent new lines using previous

set incsearch                               " Search word while typing
set ignorecase                              " Ignore case in search patterns
set smartcase                               " But override if uppercase used

set completeopt=menu,preview,longest        " Completion menu options
set pumheight=10                            " Size of completion menu

set spelllang=es,en                         " Spelling languages
set spellsuggest=10                         " Number of spelling suggestions
set spellfile=~/.vim/spell/mine.utf-8.add   " Spell file for additions

set tags+=.tags                             " Use a dot tags file

set listchars=tab:▸\ ,eol:¬                 " Better unprintable characters


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" GLOBAL MAPPINGS                       {{{1
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Toggle ['] and [`] keys for moving to marks
nnoremap ' `
nnoremap ` '

" Better navigation in long lines
nnoremap j  gj
nnoremap k  gk

" Remap keys that will be used as normal mode mappings
nnoremap <silent>   <space>h      H
nnoremap <silent>   <space>m      M
nnoremap <silent>   <space>l      L

" Buffers
nnoremap <silent>   K             <C-^>
nnoremap            H             :bprevious<CR>
nnoremap            L             :bnext<CR>

" Omnicompletion popup menu like IDE
inoremap <expr>     <CR>          pumvisible() ? "\<C-y>" : "\<CR>"
inoremap <expr>     <Down>        pumvisible() ? "\<C-n>" : "\<Down>"
inoremap <expr>     <Up>          pumvisible() ? "\<C-p>" : "\<Up>"

" Command line history
cnoremap            <C-P>         <Up>
cnoremap            <C-N>         <Down>

" Toggle paste
nnoremap            <F12>         :set invpaste<CR>:set paste?<CR>

" Easily open a new terminal
inoremap <silent>   <C-F11>         <ESC>:!x-terminal-emulator<CR>
nnoremap <silent>   <C-F11>         :!x-terminal-emulator<CR>

" Write as sudo
cnoremap            w!!           w !sudo tee % >/dev/null


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" AUTOCOMMANDS                          {{{1
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Restore cursor position
autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif

" Automatically close popup menu and preview window for omnicompletion
autocmd CursorMovedI,InsertLeave *
    \ if pumvisible() == 0 |
    \   silent! pclose |
    \ endif

" If last windows is quickfix window, exit Vim
autocmd BufEnter * silent! call utils#CloseLast()

" Move to the parent directory in any fugitive tree or blob
autocmd User Fugitive
    \ if fugitive#buffer().type() =~# '^\%(tree\|blob\)$' |
    \   nnoremap <silent> <buffer> .. :edit %:h<CR> |
    \ endif

" Autoclean fugitive buffers
autocmd BufReadPost fugitive://* set bufhidden=delete


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" COMMANDS                              {{{1
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Python calculator on command line
command! -nargs=+ CC :py print <args>


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" TERM AND COLORSCHEME                  {{{1
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

if $COLORTERM == 'gnome-terminal'
    set t_Co=256
    colorscheme solarized
elseif $TERM =~ 'rxvt' || $TERM =~ '256color'
    set t_Co=256
    colorscheme darkglass
endif

" Change color of completion menu according to the terminal and current
" colorsqueme
highlight PmenuSel ctermfg=white


"}}}
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim: foldmethod=marker
