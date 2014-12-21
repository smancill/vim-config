" c.vim: settings for C/C++ files

" always open a block
inoremap  <buffer>  {<CR>    {<CR>}<Esc>O
vnoremap  <buffer>  {<CR>   S{<CR>}<Esc>Pk=iB

" Alternate plugin
inoremap <buffer> <silent>  <LocalLeader>aa    <Esc>:A<CR>
nnoremap <buffer> <silent>  <LocalLeader>aa         :A<CR>

inoremap <buffer> <silent>  <LocalLeader>at    <Esc>:AT<CR>
nnoremap <buffer> <silent>  <LocalLeader>at         :AT<CR>

inoremap <buffer> <silent>  <LocalLeader>av    <Esc>:AV<CR>
nnoremap <buffer> <silent>  <LocalLeader>av         :AV<CR>

inoremap <buffer> <silent>  <LocalLeader>as    <Esc>:AS<CR>
nnoremap <buffer> <silent>  <LocalLeader>as         :AS<CR>
