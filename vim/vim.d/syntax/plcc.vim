" Vim syntax file
" Language: PLCC
" Maintainer: Max Meinhold
" Latest Revision: 07 March 2019

if exists("b:current_syntax")
  finish
endif

syn match   plccComment         "#.*$"
syn keyword plccKeyword         token skip
syn match   plccAssignOp        "\(:\|*\)\{2\}="
syn match   plccToken           "\(\W\|+\)\@<=[A-Z0-9]\+\(\W\|\n\)\@="
syn match   plccCapturedItem    "\(<\)\@<=\w\+\(>\)\@="
syn match   plccClass           "\(:\)\@<=[A-Z]\+[a-z][A-za-z0-9]\+"
syn match   plccRootClass       "\(^<\)\@<=\w\+\(>:\?\)\@="
syn region  plccDoubleString    start=/"/ skip=/\\"/ end=/"/
syn region  plccSingleString    start=/'/ skip=/\\'/ end=/'/
syn match   plccInclude         "^include"
syn match   plccDivider         "%\+"
syn match   plccVarName         "\(>\)\@<=[A-Za-z][A-za-z0-9]\+"

hi def link plccComment         Comment
hi def link plccKeyword         Keyword
hi def link plccAssignOp        Operator
hi def link plccClass           Identifier
hi def link plccRootClass       Identifier
hi def link plccCapturedItem    Function
hi def link plccToken           Structure
hi def link plccVarName         Function
hi def link plccInclude         Include
hi def link plccDivider         Delimiter
hi def link plccDoubleString    String
hi def link plccSingleString    String

let b:current_syntax = "plcc"
