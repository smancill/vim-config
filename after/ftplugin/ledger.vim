" ledger.vim: settings for Leger journal files

call SuperTabSetDefaultCompletionType("<c-x><c-o>")

nnoremap <buffer> <silent> <leader>ll   :<C-u>Ledger b -V<CR>
nnoremap <buffer> <silent> <leader>lr   :<C-u>Register<CR>
nnoremap <buffer> <silent> <leader>la   :<C-u>LedgerAlign<CR>
vnoremap <buffer> <silent> <leader>la   :<C-u>LedgerAlign<CR>
