" ledger.vim: settings for Leger journal files
"
" SPDX-FileCopyrightText: © 2018 Sebastián Mancilla <smancill@smancill.dev>
"
" SPDX-License-Identifier: MIT-0

if exists("*SuperTabSetDefaultCompletionType")
  call SuperTabSetDefaultCompletionType("<C-x><C-o>")
endif

nnoremap <buffer> <silent> <leader>ll   :<C-u>Ledger balance<CR>
nnoremap <buffer> <silent> <leader>lr   :<C-u>Register<CR>
nnoremap <buffer> <silent> <leader>la   :<C-u>LedgerAlign<CR>
vnoremap <buffer> <silent> <leader>la   :<C-u>LedgerAlign<CR>

nnoremap <buffer> <silent> <leader>le   :<C-u>call ledger#entry()<CR>:s#/#-#g<CR>j:LedgerAlign<CR>
nnoremap <buffer> <silent> <leader>lx   :<C-u>call ledger#transaction_state_set(line('.'), '!')<CR>
nnoremap <buffer> <silent> <leader>lc   :<C-u>call ledger#transaction_state_set(line('.'), '*')<CR>
