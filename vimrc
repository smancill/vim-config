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

" Ultisnips                                 {{{2
let g:UltiSnipsExpandTrigger = "<TAB>"
let g:UltiSnipsJumpForwardTrigger = "<TAB>"
let g:UltiSnipsJumpBackwardTrigger = "<S-TAB>"
let g:UltiSnipsListSnippets = "<leader>ls"
let g:UltiSnipsEditSplit='horizontal'
let g:UltiSnipsSnippetDirectories = ["ultisnips"]
let g:UltiSnipsDontReverseSearchPath = 1

" Local vimrc                               {{{2
let g:local_vimrc='.project.vim'

" ctrlp                                     {{{2
nnoremap <silent> <C-N>     :CtrlPBuffer<CR>
let g:ctrlp_working_path_mode = 0
let g:ctrlp_by_filename = 1
let g:ctrlp_mruf_max = 50
let g:ctrlp_dotfiles = 1
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\.git$\|\.hg$\|\.svn$'
  \ }

" Ack                                       {{{2
let g:ackprg="ack-grep -H --nocolor --nogroup --column"

" Syntastic                                 {{{2
let g:syntastic_c_check_header = 1
let g:syntastic_cpp_check_header = 1
let g:syntastic_cpp_config_file = '.clang_complete'
let g:syntastic_c_config_file = '.clang_complete'
if v:version == 700
  let g:syntastic_enable_highlighting = 0
endif

" Tagbar                                    {{{2
nnoremap <silent> <F8> :TagbarToggle<CR>
let g:tagbar_autofocus = 1
let g:tagbar_compact = 1

" EasyTags                                  {{{2
let g:easytags_cmd = 'ctags'
let g:easytags_dynamic_files = 2

" Alternate                                 {{{2
let g:alternateExtensions_cc  = "hh,h,hpp"
let g:alternateExtensions_cpp = "hpp,h,hh"
let g:alternateExtensions_C   = "h,H"
let g:alternateExtensions_hh  = "cc,cpp,cxx"
let g:alternateExtensions_h   = "c,cpp,cxx,cc,C"
let g:alternateExtensions_hpp = "cpp,cxx,C,cc"

" Clang Complete                            {{{2
" let g:clang_use_library=1
let g:clang_auto_select=1
let g:clang_snippets=1
let g:clang_snippets_engine='ultisnips'
let g:clang_conceal_snippets=1
let g:clang_complete_copen=0
let g:clang_user_options="-DCLANG"

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

" Send to Evernote                          {{{2
let g:evernote_gmail_username = "smancill.m"
let g:evernote_email_local_part  = "smancill.d0477"

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
set synmaxcol=128                           " Prevent lag with long lines

set autoread                                " Read files if changed outside
set nobackup                                " Do not use backups (Git FTW)
set directory=./.swp,~/.vim/.files,/tmp     " Change path to swap files
set backupdir=./.bak,~/.vim/.files,/tmp     " Change path to backup files
set fenc=utf-8                              " Default file encoding
set ff=unix                                 " Default end of line

set mouse=a                                 " Use mouse in all modes
if has('unnamedplus')                       " Use system clipboard
  set clipboard=unnamedplus,autoselect,exclude:cons\|linux
endif

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
set wildignore=*.bak,*.o,*.os,*.so,*.gch,*.class,*~,*.py[co],*.rb[co]
                                            " Ignore these files

set tabstop=4                               " Four spaces for a tab
set softtabstop=4                           " Four spaces for a tab
set smarttab                                " Smart tabs at beginning of line
set expandtab                               " Use spaces instead of tabs
set shiftround                              " Indent to multiple of shiftwidth
set shiftwidth=4                            " Default indent of four spaces

set formatoptions=tq2                       " Set format options
set autoindent                              " Indent new lines using previous
set wrap                                    " Softwrap long lines
set linebreak                               " Wrap at spaces characters
let &showbreak='» '                         " Mark continuation of long lines

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

augroup vimrc_autocommands
autocmd!

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
autocmd BufEnter *
    \ if &buftype=="quickfix" || &buftype=="nofile" |
    \   if winbufnr(2) == -1 |
    \     quit! |
    \   endif |
    \ endif

" Move to the parent directory in any fugitive tree or blob
autocmd User Fugitive
    \ if fugitive#buffer().type() =~# '^\%(tree\|blob\)$' |
    \   nnoremap <silent> <buffer> .. :edit %:h<CR> |
    \ endif

" Autoclean fugitive buffers
autocmd BufReadPost fugitive://* set bufhidden=delete

" Always start on first line of Git commit message
autocmd BufEnter *
    \ if &filetype == 'gitcommit' |
    \   call setpos('.', [0, 1, 1]) |
    \ endif

augroup END


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" COMMANDS                              {{{1
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
command! -nargs=0 DiffOrig vert new | set bt=nofile | r # | 0d_ |
  \ diffthis | wincmd p | diffthis

" Python calculator on command line
command! -nargs=+ CC :py print <args>


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" TERM AND COLORSCHEME                  {{{1
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

if $COLORTERM == 'gnome-terminal'
    set t_Co=256
    let s:color_squeme = "inkpot"
elseif $TERM =~ 'rxvt' || $TERM =~ '256color'
    set t_Co=256
    let s:color_squeme = "darkglass"
endif

try
  if exists("s:color_squeme")
    exe "colorscheme " . s:color_squeme
  endif
catch /^Vim\%((\a\+)\)\=:E185/
endtry

" Change color of completion menu according to the terminal and current
" colorsqueme
highlight PmenuSel ctermbg=white
highlight PmenuSel ctermfg=black


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" PER USER CONFIGURATION                {{{1
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let s:user_vimrc = expand("~/.vim/vimrc_mine.vim")
if filereadable(s:user_vimrc)
  exe "source " . s:user_vimrc
endif

"}}}
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim: foldmethod=marker
