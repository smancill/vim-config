" gitcommit.vim: settings for Git commit buffers
"
" SPDX-FileCopyrightText: © 2019 Sebastián Mancilla <smancill@smancill.dev>
"
" SPDX-License-Identifier: MIT-0

" Allow automatic formatting of bulleted lists
setlocal comments+=fb:*
setlocal comments+=fb:-

setlocal formatoptions+=c " Auto-wrap comments using textwidth
setlocal formatoptions+=q " Allow formatting of comments with `gq`
