" bundle.vim: register and configure plugins

" Prerequisites                             {{{2
let g:vim_config_has_fd = executable('fd')
let g:vim_config_has_rg = executable('rg')

" vim-addon-local-vimrc                     {{{2
Plug 'https://github.com/MarcWeber/vim-addon-local-vimrc'
" {{{
let g:local_vimrc = {
  \ 'names': ['.project.vim', '.vimrc'],
  \ 'hash_fun': 'LVRHashOfFile',
  \ 'cache_file': $XDG_CACHE_HOME . '/vim/local_rc_cache',
  \ }
" }}}

" Buffergator                               {{{2
Plug 'https://github.com/jeetsukumaran/vim-buffergator'
" {{{
nnoremap <silent>   <C-J>         :<C-U>BuffergatorOpen<CR>
nnoremap <silent>   <C-_>         :<C-U>BuffergatorTabsOpen<CR>
augroup filetype_buffergator
  autocmd!
  autocmd FileType buffergator  nnoremap <buffer>   <C-j>   j
  autocmd FileType buffergator  nnoremap <buffer>   <C-k>   k
  autocmd FileType buffergator  nnoremap <buffer>   -       -
  autocmd BufEnter \[\[buffergator-buffers\]\]  unmap ds
  autocmd BufLeave \[\[buffergator-buffers\]\]  nmap  ds  <Plug>Dsurround
augroup END
let g:buffergator_suppress_keymaps = 1
let g:buffergator_viewport_split_policy = 'B'
let g:buffergator_split_size = 12
let g:buffergator_sort_regime = 'mru'
" }}}

" ctrlp                                     {{{2
Plug 'https://github.com/ctrlpvim/ctrlp.vim'
" {{{
if has('gui_running') || has('nvim')
  nnoremap <silent>   <C-Space>     :<C-U>CtrlPBuffer<CR>
else
  nnoremap <silent>   <C-@>         :<C-U>CtrlPBuffer<CR>
endif
nnoremap <silent>   <C-N>         :<C-U>CtrlPMRU<CR>
nnoremap <silent>   g{            :<C-U>CtrlPTag<CR>
nnoremap <silent>   g[            :<C-U>CtrlPBufTag<CR>
let g:ctrlp_working_path_mode = 0
let g:ctrlp_by_filename = 0
let g:ctrlp_match_window = 'results:40'
let g:ctrlp_mruf_max = 50
let g:ctrlp_mruf_exclude = '\v(/private)?/var/folders/.*|\.git/.*|\.stgit-(new|edit)\.txt'
let g:ctrlp_show_hidden = 1
let g:ctrlp_open_new_file = 'r'
let g:ctrlp_custom_ignore = {
  \ 'file': '\v\.?tags$',
  \ 'dir':  '\v\.(git|hg|svn|gradle)$|(_site|build)$'
  \ }
if g:vim_config_has_fd
  let g:ctrlp_user_command = "fd --hidden --exclude .git --type f '' %s"
  let g:ctrlp_use_caching = 0
endif
let g:ctrlp_buftag_types = {
  \ 'markdown': '--language-force=markdown --md-types=csSt',
  \ }
" }}}

" netrw                                     {{{2
" {{{
let g:netrw_altfile = 1
let g:netrw_dirhistmax = 0
" }}}

" NERDTree                                  {{{2
Plug 'https://github.com/scrooloose/nerdtree', { 'on':  [ 'NERDTreeToggle', 'NERDTreeFind' ] }
" {{{
nnoremap <silent>   <F3>          :<C-U>NERDTreeToggle<CR>
nnoremap <silent>   <leader><F3>  :<C-U>NERDTreeFind<CR>
let NERDTreeHijackNetrw = 0
let NERDTreeCaseSensitiveSort = 1
let NERDTreeRespectWildIgnore = 1
let NERDTreeIgnore = [
  \ '\.d$[[dir]]',
  \ '\.git$[[dir]]',
  \ '\.hg$[[dir]]',
  \ '\.svn$[[dir]]',
  \ '\.\?tags\(\.\w*\)\?$[[file]]',
  \ ]
" }}}

" Vinegar                                   {{{2
Plug 'https://github.com/tpope/vim-vinegar'

" Ack                                       {{{2
Plug 'https://github.com/mileszs/ack.vim'
" {{{
if g:vim_config_has_rg
  let g:ackprg = 'rg --vimgrep --hidden --glob ''!.git'' --smart-case'
endif

nnoremap  <Leader>/     :Ack!<Space>
" }}}

" Airline                                   {{{2
Plug 'https://github.com/vim-airline/vim-airline'
Plug 'https://github.com/vim-airline/vim-airline-themes'
" {{{
let g:airline_left_sep = ''
let g:airline_right_sep = ''
let g:airline_theme = 'powerlineish'
let g:airline_highlighting_cache = 1
let g:airline_detect_spell = 0
let g:airline_extensions = [
  \ 'ale',
  \ 'ctrlp',
  \ 'fugitiveline',
  \ 'quickfix',
  \ 'term',
  \ 'whitespace',
  \ ]
let g:airline#extensions#disable_rtp_load = 1
let g:airline#extensions#ctrlp#show_adjacent_modes = 0
let g:airline#extensions#whitespace#mixed_indent_algo = 2
" }}}

" Surround                                  {{{2
Plug 'https://github.com/tpope/vim-surround'

" Repeat                                    {{{2
Plug 'https://github.com/tpope/vim-repeat'

" Unimpaired (slim)                         {{{2
Plug 'https://github.com/smancill/vim-unimpaired-slim'

" SuperTab                                  {{{2
Plug 'https://github.com/ervandew/supertab'
" {{{
if has('gui_running') || has('nvim')
  let g:SuperTabMappingForward = '<C-Space>'
  let g:SuperTabMappingBackward = '<S-C-space>'
else
  let g:SuperTabMappingForward = '<C-@>'
  let g:SuperTabMappingBackward = '<C-S-@>'
endif
let g:SuperTabDefaultCompletionType = 'context'
" }}}

" Ultisnips                                 {{{2
Plug 'https://github.com/SirVer/ultisnips'
Plug 'https://github.com/honza/vim-snippets'
" {{{
inoremap <silent>   <C-@>         <nop>
if has('gui_running') || has('nvim')
  let g:UltiSnipsExpandTrigger = '<C-Space>'
else
  let g:UltiSnipsExpandTrigger = '<C-@>'
endif
let g:UltiSnipsJumpForwardTrigger = '<TAB>'
let g:UltiSnipsJumpBackwardTrigger = '<S-TAB>'
let g:UltiSnipsEditSplit = 'context'
if $VIM_CONFIG_LOAD_PRIVATE_RC == '1' && isdirectory($VIM_CONFIG_HOME . '/private')
  let g:UltiSnipsSnippetsDir = $VIM_CONFIG_HOME . '/private/UltiSnips'
endif
" }}}

" Fugitive                                  {{{2
Plug 'https://github.com/tpope/vim-fugitive'
Plug 'https://github.com/tpope/vim-rhubarb'
Plug 'https://github.com/shumphrey/fugitive-gitlab.vim'
" {{{
nnoremap <silent>   <leader>gs    :<C-U>Gstatus<CR>
nnoremap <silent>   <leader>gc    :<C-U>Gcommit<CR>
nnoremap <silent>   <leader>gl    :<C-U>terminal ++close tig -- %<CR>
nnoremap <silent>   <leader>ge    :<C-U>Gedit<CR>
nnoremap <silent>   <leader>gd    :<C-U>Gdiff<CR>
nnoremap <silent>   <leader>gu    :<C-U>Gedit :%<bar>Gdiff! @<CR>
nnoremap <silent>   <leader>gb    :<C-U>terminal ++close tig blame +<C-r>=line('.')<CR> -- %<CR>
nnoremap <silent>   <leader>go    :<C-U>Gbrowse<CR>

" }}}

" mergetool
Plug 'https://github.com/samoshkin/vim-mergetool'
" {{{
let g:mergetool_layout = 'lm'
let g:mergetool_prefer_revision = 'remote'
" }}}

" Gist                                      {{{2
Plug 'https://github.com/mattn/gist-vim'
Plug 'https://github.com/mattn/webapi-vim'
" {{{
if has('macunix')
  let g:gist_clip_command = 'pbcopy'
else
  let g:gist_clip_command = 'xclip -selection clipboard'
endif
" }}}

" ALE                                       {{{2
Plug 'https://github.com/dense-analysis/ale'
" {{{
let g:ale_lint_on_enter = 1
let g:ale_lint_on_insert_leave = 0
let g:ale_lint_on_text_changed = 'never'
let g:ale_open_list = 0
let g:ale_linters = {
  \ 'c': ['gcc'],
  \ 'cpp': ['gcc'],
  \ 'java': [],
  \ 'javascript': ['eslint'],
  \ 'python': ['flake8'],
  \ }
let g:ale_pattern_options = {}
let g:ale_c_parse_compile_commands = 1
let g:ale_cpp_gcc_options = ''
let g:ale_cpp_clang_options = ''
" }}}

" mundo                                     {{{2
Plug 'https://github.com/simnalamburt/vim-mundo'
" {{{
nnoremap <silent>   <F5>          :<C-U>silent MundoToggle<CR>
let g:mundo_preview_bottom = 1
let g:mundo_verbose_graph = 0
" }}}

" Commentary                                {{{2
Plug 'https://github.com/tpope/vim-commentary'

" matchit                                   {{{2
Plug 'https://github.com/benjifisher/matchit.zip'

" Tagbar                                    {{{2
Plug 'https://github.com/majutsushi/tagbar'
" {{{
nnoremap <silent>   <F8>          :<C-U>TagbarToggle<CR>
let g:tagbar_autofocus = 1
let g:tagbar_compact = 1
let g:tagbar_singleclick = 1
" }}}

" Gutentangs                                {{{2
Plug 'https://github.com/ludovicchabant/vim-gutentags'
" {{{
let g:gutentags_ctags_tagfile = '.tags'
let g:gutentags_file_list_command = {
  \ 'markers': {
  \   '.git': 'git ls-files --cached --others --exclude-standard',
  \   },
  \ }
" }}}

" Sideways                                  {{{2
Plug 'https://github.com/AndrewRadev/sideways.vim'
" {{{
nnoremap  <Leader><     :SidewaysLeft<CR>
nnoremap  <Leader>>     :SidewaysRight<CR>
" }}}

" EditorConfig                              {{{2
Plug 'https://github.com/editorconfig/editorconfig-vim'
" {{{
let g:EditorConfig_exclude_patterns = ['fugitive://.*', '.git/COMMIT']
" }}}

" Alternate                                 {{{2
Plug 'https://github.com/vim-scripts/a.vim'
" {{{
let g:alternateExtensions_cc  = 'hh,h,hpp,hxx'
let g:alternateExtensions_cpp = 'hpp,h,hh,hxx'
let g:alternateExtensions_C   = 'h,H'
let g:alternateExtensions_hh  = 'cc,cpp,cxx'
let g:alternateExtensions_h   = 'c,cpp,cxx,cc,C'
let g:alternateExtensions_hpp = 'cpp,cxx,C,cc'
let g:alternateExtensions_hxx = 'cpp,cxx,C,cc'
" }}}

" Clang Complete                            {{{2
Plug 'https://github.com/Rip-Rip/clang_complete'
" {{{
let g:clang_auto_select = 1
let g:clang_snippets = 1
let g:clang_snippets_engine = 'ultisnips'
let g:clang_complete_copen = 0
let g:clang_jumpto_declaration_key = '<leader><C-]>'
let g:clang_jumpto_back_key = '<leader><C-T>'
let g:clang_jumpto_declaration_in_preview_key = '<leader><C-W>}'
let g:clang_user_options = '-DCLANG -fcxx-exceptions'
let g:clang_auto_user_options = 'compile_commands.json, .clang_complete, path'
" }}}

" jedi                                      {{{2
Plug 'https://github.com/davidhalter/jedi-vim'
" {{{
let g:jedi#auto_vim_configuration = 0
let g:jedi#completions_command = ''
" }}}

" indentpython                              {{{2
Plug 'https://github.com/vim-scripts/indentpython.vim'

" python-syntax
Plug 'https://github.com/vim-python/python-syntax'
" {{{
let g:python_highlight_builtins = 1
let g:python_highlight_string_format = 1
let g:python_highlight_doctests = 1
let g:python_highlight_func_calls = 1
let g:python_highlight_class_vars = 1
let g:python_highlight_file_headers_as_comments = 1
" }}}

" Previm                                    {{{2
Plug 'https://github.com/kannokanno/previm'
" {{{
if has('macunix')
  let g:previm_open_cmd = 'open'
else
  let g:previm_open_cmd = 'xdg-open'
endif
" }}}

" darkglass                                 {{{2
Plug 'https://github.com/smancill/darkglass'

" inkpot                                    {{{2
Plug 'https://github.com/ciaranm/inkpot'

" Conky                                     {{{2
Plug 'https://github.com/smancill/conky-syntax.vim'

" Ledger                                    {{{2
Plug 'https://github.com/ledger/vim-ledger'
" {{{
let g:ledger_maxwidth = 80
let g:ledger_detailed_first = 1
let g:ledger_fold_blanks = 1
let g:ledger_decimal_sep = ','
let g:ledger_align_at = 61
let g:ledger_date_format = '%Y-%m-%d'
let g:ledger_extra_options = '--explicit --pedantic --check-payees'
let g:ledger_qf_register_format = '%(format_date(date))  %-36(payee) %-44(account) %15(scrub(amount)) %15(scrub(total))\n'
let g:ledger_qf_reconcile_format = '%(format_date(date))  %-4(code) %-36(payee) %-44(account) %15(scrub(amount))\n'
" }}}

" FixCursorHold                             {{{2
Plug 'https://github.com/antoinemadec/FixCursorHold.nvim'
" {{{
let g:cursorhold_updatetime = 200
" }}}

" }}}2

" vim: foldmethod=marker foldlevel=2
