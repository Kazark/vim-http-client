" Author: Kazark

if exists('g:httpclient_loaded')
    finish
endif
let g:httpclient_loaded = 1

function httpclient#contentType()
    if &filetype == 'xml'
        return "application/xml"
    elseif &filetype == 'json'
        return "application/json"
    else
        return "text/plain"
    endif
endfunction

function httpclient#splitbelow()
    let l:oldsplitbelow=&splitbelow
    set splitbelow
    new
    let &splitbelow=l:oldsplitbelow
    setlocal buftype=nofile
    setlocal noswapfile
    setfiletype http
endfunction

function httpclient#request(verb, url)
    let l:bodyFile = expand('%')
    call httpclient#splitbelow()
    call httpclient#curl(a:verb, a:url)
endfunction

function httpclient#curl(verb, url)
    execute "read!curl -si -X " . a:verb . " " . a:url
endfunction

function httpclient#curlWithBody(verb, contentType, url, bodyFile)
    execute "read!curl -si -X " . a:verb . ' -H "Content-Type: ' . a:contentType . '" -T ' . a:bodyFile . " " . a:url
endfunction

function httpclient#requestWithBody(verb, url)
    let l:bodyFile = expand('%')
    let l:contentType = httpclient#contentType()
    call httpclient#splitbelow()
    call httpclient#curlWithBody(a:verb, l:contentType, a:url, l:bodyFile)
endfunction
