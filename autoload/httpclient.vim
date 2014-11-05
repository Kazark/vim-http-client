" Author: Kazark

if exists('g:httpclient_loaded')
    finish
endif
let g:httpclient_loaded = 1

function httpclient#contentType()
    if &filetype == 'xml'
        return "Content-Type: application/xml"
    else
        return "Content-Type: text/plain"
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

function httpclient#curlWithBody(verb, contentType, url, bodyFile)
    execute "read!curl -si -X " . a:verb . ' -H "' . a:contentType . '" -T ' . a:bodyFile . " " . a:url
endfunction

function httpclient#requestWithBody(verb, url)
    let l:bodyFile = expand('%')
    let l:contentType = httpclient#contentType()
    call httpclient#splitbelow()
    call httpclient#curlWithBody(a:verb, l:contentType, a:url, l:bodyFile)
endfunction
