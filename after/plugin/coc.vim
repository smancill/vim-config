" SPDX-FileCopyrightText: © 2021 Sebastián Mancilla <smancill@smancill.dev>
"
" SPDX-License-Identifier: MIT-0

if !exists('g:did_coc_loaded')
  finish
endif

" Not recommended to be used together with coc#config()
command! -nargs=0 CocConfig
  \ echohl WarningMsg |
  \ echomsg "Use coc#config() in '<vim_dir>/after/plugin/coc.vim' to configure CoC" |
  \ echohl None


" coc                                       {{{2
call coc#config('coc.preferences', {
  \ 'rootPatterns': [
  \   '.vim',
  \   '.git',
  \   '.hg',
  \   '.envrc',
  \   '.project.vim',
  \   '.projections.json'
  \ ],
  \ 'useQuickfixForLocations': v:true,
  \ })

call coc#config('diagnostic', {
  \ 'checkCurrentLine': v:true,
  \ 'displayByAle': v:false,
  \ 'errorSign': '>>',
  \ 'messageDelay': 400,
  \ 'signPriority': 20,
  \ 'warningSign': '--',
  \ })

call coc#config('inlayHint', {
  \ 'display': v:false,
  \ })

call coc#config('suggest', {
  \ 'autoTrigger': 'trigger',
  \ 'minTriggerInputLength': 2,
  \ 'noselect': v:false,
  \ 'snippetIndicator': '▸',
  \ })

call coc#config('list.insertMappings', {
  \ '<C-C>': 'do:exit',
  \ '<C-J>': 'do:next',
  \ '<C-K>': 'do:previous',
  \ })

call coc#config('list.normalMappings', {
  \ '<C-C>': 'do:exit',
  \ '<C-J>': 'do:next',
  \ '<C-K>': 'do:previous',
  \ })

" coc-git                                   {{{2
call coc#config('git', {
  \ 'enableGlobalStatus': v:false,
  \ })

" coc-pyright                               {{{2
call coc#config('python.formatting.provider', 'black')

call coc#config('python.linting.enabled', v:true)
call coc#config('python.linting.flake8Enabled', v:true)
" }}}

" vim: foldmethod=marker foldlevel=2
