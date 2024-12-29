" bundle.vim: register and configure plugins
"
" SPDX-FileCopyrightText: © 2012 Sebastián Mancilla <smancill@smancill.dev>
"
" SPDX-License-Identifier: MIT-0

" Prerequisites                             {{{2
let g:vim_config_programs = {
  \ 'has_fd': executable('fd'),
  \ 'has_rg': executable('rg'),
  \ 'has_ctags': executable('ctags'),
  \ }

" vim-addon-local-vimrc                     {{{2
Plug 'https://github.com/MarcWeber/vim-addon-local-vimrc'
" {{{
let g:local_vimrc = {
  \ 'names': ['.project.vim', '.vimrc'],
  \ 'hash_fun': 'LVRHashOfFile',
  \ 'cache_file': $XDG_STATE_HOME . '/vim/local_rc_cache',
  \ }
" }}}

" Buffergator                               {{{2
Plug 'https://github.com/jeetsukumaran/vim-buffergator'
" {{{
nnoremap <silent>   <C-J>         :<C-U>BuffergatorOpen<CR>
augroup filetype_buffergator
  autocmd!
  autocmd FileType buffergator  nnoremap <buffer>   <C-J>   j
  autocmd FileType buffergator  nnoremap <buffer>   <C-K>   k
  autocmd FileType qf           nnoremap <buffer>   <C-J>   j
  autocmd FileType qf           nnoremap <buffer>   <C-K>   k
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
nnoremap <silent>   g[            :<C-U>CtrlPBufTag<CR>
let g:ctrlp_working_path_mode = 0
let g:ctrlp_by_filename = 0
let g:ctrlp_match_window = 'results:40'
let g:ctrlp_mruf_max = 50
let g:ctrlp_mruf_exclude = '\v(/private)?/var/folders/.*|\.git/.*|\.stgit-.*\.txt|.*_(LOCAL|REMOTE)_.*'
let g:ctrlp_show_hidden = 1
let g:ctrlp_open_new_file = 'r'
let g:ctrlp_custom_ignore = {
  \ 'file': '\v\.?tags$',
  \ 'dir':  '\v\.(git|hg|svn|gradle)$|(_site|build)$'
  \ }
if g:vim_config_programs.has_fd
  let g:ctrlp_user_command = "fd --hidden --exclude .git --type f --base-directory '%s'"
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
let g:netrw_home = $XDG_STATE_HOME . '/vim'
" }}}

" NERDTree                                  {{{2
Plug 'https://github.com/scrooloose/nerdtree', {'on': ['NERDTree', 'NERDTreeToggle', 'NERDTreeFind']}
" {{{
nnoremap <silent>   <F3>          :<C-U>NERDTreeToggle<CR>
nnoremap <silent>   <Leader><F3>  :<C-U>NERDTreeFind<CR>
let g:NERDTreeHijackNetrw = 0
let g:NERDTreeCaseSensitiveSort = 1
let g:NERDTreeRespectWildIgnore = 1
let g:NERDTreeIgnore = [
  \ '\.git$[[dir]]',
  \ '\.hg$[[dir]]',
  \ '\.svn$[[dir]]',
  \ '\.\?tags\(\.\w*\)\?$[[file]]',
  \ ]
let g:NERDTreeBookmarksFile = $XDG_DATA_HOME . '/vim/NERDTreeBookmarks'
" }}}

" Dirvish                                   {{{2
Plug 'https://github.com/justinmk/vim-dirvish'
" {{{
let g:dirvish_mode = ':sort | :sort /^.*[/]/'
" }}}

" Ack                                       {{{2
Plug 'https://github.com/mileszs/ack.vim'
" {{{
if g:vim_config_programs.has_rg
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
let g:airline_symbols = {}
let g:airline_symbols.linenr = ' ☰ '
let g:airline_symbols.maxlinenr = ''
let g:airline_symbols.colnr = ':'
let g:airline_theme = 'powerlineish'
let g:airline_highlighting_cache = 1
let g:airline_detect_spell = 0
let g:airline_extensions = [
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

" Unimpaired (lite)                         {{{2
Plug 'https://github.com/smancill/vim-unimpaired-lite'

" SuperTab                                  {{{2
if !g:vim_config_options.use_coc
Plug 'https://github.com/ervandew/supertab'
" {{{
if has('gui_running') || has('nvim')
  let g:SuperTabMappingForward = '<C-Space>'
  let g:SuperTabMappingBackward = '<S-C-Space>'
else
  let g:SuperTabMappingForward = '<C-@>'
  let g:SuperTabMappingBackward = '<C-S-@>'
endif
let g:SuperTabDefaultCompletionType = 'context'
" }}}
endif

" UltiSnips                                 {{{2
if has('python3')
Plug 'https://github.com/SirVer/ultisnips'
Plug 'https://github.com/honza/vim-snippets'
" {{{
if has('gui_running') || has('nvim')
  let g:UltiSnipsExpandTrigger = '<C-Space>'
else
  let g:UltiSnipsExpandTrigger = '<C-@>'
endif
let g:UltiSnipsJumpForwardTrigger = '<Tab>'
let g:UltiSnipsJumpBackwardTrigger = '<S-Tab>'
let g:UltiSnipsEditSplit = 'context'
if g:vim_config_options.has_private
  let g:UltiSnipsSnippetStorageDirectoryForUltiSnipsEdit = $VIM_CONFIG_HOME . '/private/UltiSnips'
endif
let b:did_after_plugin_ultisnips_after = 1
" }}}
endif

" Fugitive                                  {{{2
Plug 'https://github.com/tpope/vim-fugitive'
Plug 'https://github.com/tpope/vim-rhubarb'
Plug 'https://github.com/shumphrey/fugitive-gitlab.vim'
" {{{
nnoremap <silent>   <Leader>gs    :<C-U>Git<CR>
nnoremap <silent>   <Leader>gc    :<C-U>Git commit<CR>
nnoremap <silent>   <Leader>gl    :<C-U>terminal ++close tig -- %<CR>
nnoremap <silent>   <Leader>ge    :<C-U>Gedit<CR>
nnoremap <silent>   <Leader>gd    :<C-U>Gdiffsplit!<CR>
nnoremap <silent>   <Leader>gu    :<C-U>Gedit :%<Bar>Gdiffsplit! @<CR>
nnoremap <silent>   <Leader>gb    :<C-U>terminal ++close tig blame +<C-R>=line('.')<CR> -- %<CR>
nnoremap <silent>   <Leader>go    :<C-U>GBrowse<CR>
" }}}

" ALE                                       {{{2
Plug 'https://github.com/dense-analysis/ale'
" {{{
let g:ale_lint_on_enter = 1
let g:ale_lint_on_insert_leave = 0
let g:ale_lint_on_text_changed = 'never'
let g:ale_open_list = 0
let g:ale_set_quickfix = 0
let g:ale_set_loclist = 0
let g:ale_linters = {
  \ 'c': ['cc'],
  \ 'cpp': ['cc'],
  \ 'java': [],
  \ 'javascript': ['eslint'],
  \ 'python': ['ruff'],
  \ }
let g:ale_pattern_options = {}
let g:ale_c_parse_compile_commands = 1
let g:ale_virtualtext_cursor = 0
let g:ale_warn_about_trailing_whitespace = 0

let g:airline_extensions += ['ale']
" }}}

" CoC                                       {{{2
if g:vim_config_options.use_coc
Plug 'https://github.com/neoclide/coc.nvim', {'branch': 'release'}
" {{{
" XXX: See after/plugin/coc.vim for CoC configuration

set signcolumn=auto
if has('8.1.1228')
  set tagfunc=CocTagFunc
endif

let g:coc_global_extensions = [
  \ 'coc-omni',
  \ 'coc-json',
  \ 'coc-yaml',
  \ 'coc-git',
  \ 'coc-clangd',
  \ 'coc-pyright',
  \ ]
let g:coc_disable_transparent_cursor = 1
let g:coc_snippet_next = '<Tab>'
let g:coc_snippet_prev = '<S-Tab>'

let g:ale_disable_lsp = 1
let g:ale_linters = {
  \ 'c': [],
  \ 'cpp': [],
  \ 'java': [],
  \ 'javascript': [],
  \ 'python': [],
  \ }
let g:airline_extensions += ['coc']
let g:UltiSnipsExpandTrigger = '<Nop>'

function! s:expand_or_coc()
  if !coc#pum#visible()
    call UltiSnips#ExpandSnippet()
    if g:ulti_expand_res == 0
      return coc#refresh()
    endif
  endif
  return ""
endfunction

function! s:coc_select_confirm()
  if coc#pum#visible()
    return coc#_select_confirm()
  elseif pumvisible()
    return "\<C-Y>"
  else
    return "\<CR>"
  endif
endfunction

function! s:coc_overwrite_map(action, map)
  if coc#rpc#ready() && CocAction('getCurrentFunctionSymbol') isnot v:null
    call CocActionAsync(a:action)
  else
    call feedkeys(a:map, 'n')
  endif
endfunction

if has('gui_running') || has('nvim')
  inoremap <silent> <C-Space>   <C-R>=<SID>expand_or_coc()<CR>
else
  inoremap <silent> <C-@>       <C-R>=<SID>expand_or_coc()<CR>
endif
inoremap <silent> <expr>    <CR>        <SID>coc_select_confirm()

nmap  <silent>  K           :<C-U>call <SID>coc_overwrite_map('doHover', 'K')<CR>
nmap  <silent>  gd          :<C-U>call <SID>coc_overwrite_map('jumpDefinition', 'gd')<CR>

nmap  <silent>  [w          <Plug>(coc-diagnostic-prev)
nmap  <silent>  ]w          <Plug>(coc-diagnostic-next)
nmap  <silent>  <F10>       :<C-U>CocDiagnostics<CR>
nmap  <silent>  <Leader>cd  :<C-U>CocDiagnostics<CR>

nmap  <silent>  <Leader>js  <Plug>(coc-declaration)
nmap  <silent>  <Leader>jd  <Plug>(coc-definition)
nmap  <silent>  <Leader>jt  <Plug>(coc-type-definition)
nmap  <silent>  <Leader>ji  <Plug>(coc-implementation)
nmap  <silent>  <Leader>jr  <Plug>(coc-references)

nmap  <silent>  <Leader>ca  <Plug>(coc-codeaction)
nmap  <silent>  <Leader>cf  <Plug>(coc-fix-current)
nmap  <silent>  <Leader>cr  <Plug>(coc-rename)
xmap  <silent>  <Leader>cF  <Plug>(coc-format-selected)
nmap  <silent>  <Leader>cF  <Plug>(coc-format-selected)
nmap  <silent>  <Leader>ch  :<C-U>call CocAction('highlight')<CR>

nmap  <silent>  <Leader>lc  :<C-U>CocList commands<CR>
nmap  <silent>  <Leader>ld  :<C-U>CocList diagnostics<CR>
nmap  <silent>  <Leader>lo  :<C-U>CocList outline<CR>
nmap  <silent>  <Leader>ls  :<C-U>CocList --interactive symbols<CR>

if has('patch-8.2.0750') || has('nvim-0.4.0')
  nnoremap <silent> <nowait> <expr> <C-F> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-F>"
  nnoremap <silent> <nowait> <expr> <C-B> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-B>"
  inoremap <silent> <nowait> <expr> <C-F> coc#float#has_scroll() ? "\<C-R>=coc#float#scroll(1)\<CR>" : "\<C-F>"
  inoremap <silent> <nowait> <expr> <C-B> coc#float#has_scroll() ? "\<C-R>=coc#float#scroll(0)\<CR>" : "\<C-B>"
  vnoremap <silent> <nowait> <expr> <C-F> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-F>"
  vnoremap <silent> <nowait> <expr> <C-B> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-B>"
endif

command! -nargs=0 Format :call CocActionAsync('format')
command! -nargs=0 OrgImports :call CocActionAsync('runCommand', 'editor.action.organizeImport')

augroup coc_colors
  autocmd!
  autocmd ColorScheme darkglass highlight CocMenuSel ctermbg=240
augroup END
" }}}
endif

" mundo                                     {{{2
Plug 'https://github.com/simnalamburt/vim-mundo', {'on': ['MundoShow', 'MundoToggle']}
" {{{
nnoremap <silent>   <F5>          :<C-U>silent MundoToggle<CR>
let g:mundo_preview_bottom = 1
let g:mundo_verbose_graph = 0
" }}}

" Commentary                                {{{2
Plug 'https://github.com/tpope/vim-commentary'

" matchit                                   {{{2
packadd! matchit

" Tagbar                                    {{{2
Plug 'https://github.com/majutsushi/tagbar', {'on': ['TagbarOpen', 'TagbarToggle']}
" {{{
nnoremap <silent>   <F8>          :<C-U>TagbarToggle<CR>
let g:tagbar_autofocus = 1
let g:tagbar_compact = 1
let g:tagbar_singleclick = 1
" }}}

" Gutentangs                                {{{2
if g:vim_config_programs.has_ctags
Plug 'https://github.com/ludovicchabant/vim-gutentags'
" {{{
let g:gutentags_ctags_tagfile = '.tags'
let g:gutentags_file_list_command = {
  \ 'markers': {
  \   '.git': 'git ls-files --cached --others --exclude-standard',
  \   },
  \ }
" }}}
endif

" Sideways                                  {{{2
Plug 'https://github.com/AndrewRadev/sideways.vim', {'on': ['SidewaysLeft', 'SidewaysRight']}
" {{{
nnoremap  <Leader><     :SidewaysLeft<CR>
nnoremap  <Leader>>     :SidewaysRight<CR>
" }}}

" EditorConfig                              {{{2
Plug 'https://github.com/editorconfig/editorconfig-vim'
" {{{
let g:EditorConfig_exclude_patterns = ['fugitive://.*', '.git/COMMIT']
" }}}

" jedi                                      {{{2
if !g:vim_config_options.use_coc
Plug 'https://github.com/davidhalter/jedi-vim'
" {{{
let g:jedi#auto_vim_configuration = 0
let g:jedi#completions_command = ''
" }}}
endif

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

" darkglass                                 {{{2
Plug 'https://github.com/smancill/darkglass'

" Ledger                                    {{{2
Plug 'https://github.com/ledger/vim-ledger', {'for': 'ledger'}
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
if has('patch-8.2.2070')
Plug 'https://github.com/antoinemadec/FixCursorHold.nvim'
" {{{
let g:cursorhold_updatetime = 200
" }}}
endif

" Distributed                               {{{2
let g:loaded_getscriptPlugin = 1
let g:loaded_logiPat = 1
let g:loaded_spellfile_plugin = 1
let g:loaded_2html_plugin = 1

" }}}2

" vim: foldmethod=marker foldlevel=2
