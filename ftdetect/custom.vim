" SPDX-FileCopyrightText: © 2012 Sebastián Mancilla <smancill@smancill.dev>
"
" SPDX-License-Identifier: MIT-0

autocmd BufRead,BufNewFile  *.txt               setfiletype text
autocmd BufRead,BufNewFile  README              setfiletype text
autocmd BufRead,BufNewFile  [sS][cC]onstruct    setfiletype python
autocmd BufRead,BufNewFile  [sS][cC]onscript    setfiletype python
autocmd BufRead,BufNewFile  *.gradle            setfiletype groovy
autocmd BufRead,BufNewFile  .clang-tidy         setfiletype yaml
autocmd BufRead,BufNewFile  .clang-format       setfiletype yaml
autocmd BufRead,BufNewFile  .envrc              setfiletype bash
