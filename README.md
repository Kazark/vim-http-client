HTTP Client for Vim
===============

Use POSTman in Chrome or RESTClient in Firefox for hitting HTTP APIs? What about
doing it from Vim instead of your browser?

Currently supported commands:

    PUT localhost:8080/api/thing

which `PUT`s the contents of the current file to the given URL and then pops up
a window with the HTTP response. A `Content-Type` header is added based on the
filetype.
