let s:cpo_save=&cpo
set cpo&vim

function! common#echomsg_multilines(text)
  let lines = split(a:text, "[\n\r]")
  for line in lines
    echomsg line
  endfor
endfunction


function! common#error_msg(text)
  if has('gui_running')
    call confirm(a:text, '&Ok', '1', 'Error')
  else
    " echohl ErrorMsg
    echoerr a:text
    " echohl None
  endif
endfunction


function! common#warning_msg(text)
  echohl WarningMsg
  " echomsg a:text
  call common#echomsg_multilines(a:text)
  echohl None
endfunction

let &cpo=s:cpo_save
