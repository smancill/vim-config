let s:current_color = get(g:, 'colors_name', 'default')

if s:current_color == 'darkglass'
  highlight! link cmakeGeneratorExpression Normal
endif
