" SPDX-FileCopyrightText: © 2021 Sebastián Mancilla <smancill@smancill.dev>
"
" SPDX-License-Identifier: MIT-0

if $VIM_CONFIG_USE_COC != ''
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

  call coc#config('suggest', {
    \ 'autoTrigger': 'trigger',
    \ 'minTriggerInputLength': 2,
    \ 'noselect': v:false,
    \ 'snippetIndicator': '▸',
    \ })

  call coc#config('list.insertMappings', {
    \ '<C-c>': 'do:exit',
    \ '<C-j>': 'do:next',
    \ '<C-k>': 'do:previous',
    \ })

  call coc#config('list.normalMappings', {
    \ '<C-c>': 'do:exit',
    \ '<C-j>': 'do:next',
    \ '<C-k>': 'do:previous',
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
endif

" vim: foldmethod=marker foldlevel=2
