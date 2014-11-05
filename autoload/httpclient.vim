" Author: Kazark

if exists('g:httpclient_loaded')
    finish
endif
let g:httpclient_loaded = 1

function httpclient#put(url)
    let l:bodyFile = expand('%')
    if &filetype == 'xml'
        let l:contentType = "Content-Type: application/xml"
    else
        let l:contentType = "Content-Type: text/plain"
    endif
    let l:verb = 'PUT'
    let l:oldsplitbelow=&splitbelow
    set splitbelow
    new
    let &splitbelow=l:oldsplitbelow
    setlocal buftype=nofile
    setlocal noswapfile
    execute "read!curl -si -X " . l:verb . ' -H "' . l:contentType . '" -T ' . l:bodyFile . " " . a:url
endfunction
