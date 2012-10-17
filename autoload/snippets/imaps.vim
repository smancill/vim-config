" clang_complete imaps's snippet generator
" Author: Sebastián Mancilla

function! snippets#imaps#init()
  if g:clang_conceal_snippets == 1
    augroup ClangCompleteSnippets
      " the check for b:clang_user_options is to do not define anything on
      " buffers that are not supported by imaps
      autocmd! Syntax *
             \ if exists('b:clang_user_options') |
             \   call <SID>UpdateConcealSyntax() |
             \ endif
    augroup END
    call s:UpdateConcealSyntax()
  endif
endfunction

function! s:UpdateConcealSyntax()
  syntax match Conceal /<+/ conceal
  syntax match Conceal /+>/ conceal
endfunction

" fullname = strcat(char *dest, const char *src)
" args_pos = [ [8, 17], [20, 34] ]
function! snippets#imaps#add_snippet(fullname, args_pos)
  let l:res = ''
  let l:prev_idx = 0
  for elt in a:args_pos
    let l:res .= a:fullname[l:prev_idx : elt[0] - 1] . '<+' . a:fullname[elt[0] : elt[1] - 1] . '+>'
    let l:prev_idx = elt[1]
  endfor

  let l:res .= a:fullname[l:prev_idx : ]
  if g:clang_trailing_placeholder == 1 && len(a:args_pos) > 0
    let l:res .= '<++>'
  endif

  return l:res
endfunction

function! snippets#imaps#trigger()
  call s:BeginSnips()
endfunction

function! snippets#imaps#reset()
endfunction

function! s:BeginSnips()
  if pumvisible() != 0
    return
  endif
  call feedkeys("\<esc>^\<c-j>")
endfunction

" vim: set ts=2 sts=2 sw=2 expandtab :
