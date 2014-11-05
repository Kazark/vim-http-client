" Vim syntax file
" Language:	HTTP Requests
" Maintainer:	Kazark <kazark@zoho.com>
"
" Used headers.vim as a template 

" Remove any old syntax stuff hanging around
if version < 600
  syn clear
elseif exists("b:current_syntax")
  finish
endif

" Generic
syn match httpXHeader "\v^[Xx]-[^:]{1,20}:"
syn match httpHeader "\v^[^Xx \t][-0-9A-Za-z_]{1,30}:"
syn match httpDate "\v(\a{3}, )?\d{1,2} \a{3} \d{2,4}"
syn match httpShortDate "\v<\d{1,2}[-/]\d{1,2}([-/]\d{2,4})?>"
syn match httpTime "\v<\d{1,2}:\d{1,2}:\d{1,2}(.\d{1,4})?( [+-]\d{4})?( [(]?\u{3,5}[)]?)?"
syn match httpHost "\v<\w+\.(\w+\.)*\a\w+>"
syn match httpEmail "\v<[A-Za-z0-9.]*\@[A-Za-z0-9]*\.[A-Za-z0-9.]*>"
syn match httpContentType "\v<\a{1,20}/\a{1,20}>"
" IP Addresses
syn match httpIPAddr "\v<\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}>"

hi link httpXHeader	Comment
hi link httpHeader	Statement
hi link httpFromHdr	Identifier
hi link httpToHdr	Identifier
hi link httpEmail	Type
hi link httpIPAddr	Function
hi link httpDate	Constant
hi link httpShortDate	Constant
hi link httpTime	Constant
hi link httpContentType	PreProc
hi link httpHost	Special

let b:current_syntax = "http"
