" SPDX-FileCopyrightText: © 2025 Sebastián Mancilla <smancill@smancill.dev>
"
" SPDX-License-Identifier: MIT-0

let s:current_color = get(g:, 'colors_name', 'default')

if s:current_color == 'darkglass'
  highlight! link cmakeGeneratorExpression Normal
endif
