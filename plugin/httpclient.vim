" Author: Kazark
" Purpose: Use Vim to hit HTTP APIs

if exists('g:httpclient_loaded_plugin')
    finish
endif
let g:httpclient_loaded_plugin = 1

command -nargs=1 Put :call httpclient#put(<q-args>)
