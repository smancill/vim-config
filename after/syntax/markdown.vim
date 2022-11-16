" SPDX-FileCopyrightText: © 2018 Sebastián Mancilla <smancill@smancill.dev>
"
" SPDX-License-Identifier: MIT-0

let s:current_color = get(g:, 'colors_name', 'default')
if s:current_color == 'darkglass'
  " default
  hi! link  markdownLinkText              Identifier
  hi! link  markdownUrl                   Statement
  hi! link  markdownId                    Type
  hi! link  markdownIdDeclaration         Type
  hi! link  markdownCode                  String
  hi! link  markdownCodeDelimiter         String
  hi! link  markdownCodeBlock             String
  hi! link  markdownListMarker            Special
  hi! link  markdownLinkTextDelimiter     Special
  hi! link  markdownIdDelimiter           Special
  hi! link  markdownLinkDelimiter         Special
  hi! link  markdownUrlDelimiter          Special
  hi! link  markdownHeadingDelimiter      Title

  " plasticboy/vim-markdown
  hi! link  mkdLink               Identifier
  hi! link  mkdId                 Type
  hi! link  mkdLinkDef            Type
  hi! link  mkdLinkDefTarget      Statement
  hi! link  mkdURL                Statement
  hi! link  mkdInlineURL          Statement
  hi! link  mkdFootnotes          Type
  hi! link  mkdHeading            Title
  hi! link  mkdListItem           Special
  hi! link  mkdRule               Special
endif
