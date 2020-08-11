command! -bang -nargs=? -complete=customlist,UltiSnips#FileTypeComplete UltiSnipsEdit
    \ :call override#UltiSnips#Edit(<q-bang>, <q-args>)
