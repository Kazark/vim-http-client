" Author: Kazark
" Purpose: Use Vim to hit HTTP APIs

if exists('g:httpclient_loaded_plugin')
    finish
endif
let g:httpclient_loaded_plugin = 1

command -nargs=1 HttpDelete :call httpclient#request('DELETE', <q-args>)
command -nargs=1 HttpGet :call httpclient#request('GET', <q-args>)
command -nargs=1 HttpPut :call httpclient#requestWithBody('PUT', <q-args>)
command -nargs=1 HttpPost :call httpclient#requestWithBody('POST', <q-args>)
