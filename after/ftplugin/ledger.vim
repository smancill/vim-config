" ledger.vim: settings for Leger journal files
"
" SPDX-FileCopyrightText: © 2018 Sebastián Mancilla <smancill@smancill.dev>
"
" SPDX-License-Identifier: MIT-0

if exists('*SuperTabSetDefaultCompletionType')
  call SuperTabSetDefaultCompletionType('<C-X><C-O>')
endif

nnoremap <buffer> <silent> <Leader>ll   :<C-U>Ledger balance<CR>
nnoremap <buffer> <silent> <Leader>lr   :<C-U>Register<CR>
nnoremap <buffer> <silent> <Leader>la   :<C-U>LedgerAlign<CR>
vnoremap <buffer> <silent> <Leader>la   :<C-U>LedgerAlign<CR>

nnoremap <buffer> <silent> <Leader>le   :<C-U>call ledger#entry()<CR>:s#/#-#g<CR>j:LedgerAlign<CR>
nnoremap <buffer> <silent> <Leader>lx   :<C-U>call ledger#transaction_state_set(line('.'), '!')<CR>
nnoremap <buffer> <silent> <Leader>lc   :<C-U>call ledger#transaction_state_set(line('.'), '*')<CR>
