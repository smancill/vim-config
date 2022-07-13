" c.vim: settings for C files
"
" SPDX-FileCopyrightText: © 2012 Sebastián Mancilla <smancill@smancill.dev>
"
" SPDX-License-Identifier: MIT-0

setlocal textwidth=78
setlocal cindent
setlocal nowrap

setlocal tabstop=8
setlocal softtabstop=8
setlocal shiftwidth=8
setlocal noexpandtab

setlocal popt=left:8pc,right:3pc

" always open a block
inoremap  <buffer>  {<CR>    {<CR>}<C-c>O
vnoremap  <buffer>  {<CR>   S{<CR>}<C-c>Pk=iB

" Alternate plugin
inoremap <buffer> <silent>  <LocalLeader>aa    <Esc>:A<CR>
nnoremap <buffer> <silent>  <LocalLeader>aa         :A<CR>

inoremap <buffer> <silent>  <LocalLeader>at    <Esc>:AT<CR>
nnoremap <buffer> <silent>  <LocalLeader>at         :AT<CR>

inoremap <buffer> <silent>  <LocalLeader>av    <Esc>:AV<CR>
nnoremap <buffer> <silent>  <LocalLeader>av         :AV<CR>

inoremap <buffer> <silent>  <LocalLeader>as    <Esc>:AS<CR>
nnoremap <buffer> <silent>  <LocalLeader>as         :AS<CR>
