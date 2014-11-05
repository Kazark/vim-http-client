" Author: Kazark
" Purpose: Use Vim to hit HTTP APIs

if exists('g:httpclient_loaded_plugin')
    finish
endif
let g:httpclient_loaded_plugin = 1

command -nargs=1 Put :call httpclient#requestWithBody('PUT', <q-args>)
command -nargs=1 Post :call httpclient#requestWithBody('POST', <q-args>)
