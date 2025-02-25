" c.vim: settings for C files
"
" SPDX-FileCopyrightText: © 2012 Sebastián Mancilla <smancill@smancill.dev>
"
" SPDX-License-Identifier: MIT-0

setlocal textwidth=78
setlocal cindent
setlocal nowrap
if has('patch-8.2.4907')
  setlocal formatoptions+=/
endif

setlocal tabstop=8
setlocal softtabstop=8
setlocal shiftwidth=8
setlocal noexpandtab

setlocal popt=left:8pc,right:3pc
