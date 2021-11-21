" Set clipboard
set clipboard=unnamedplus 

" Clipbord sync with Windows through WSL
if has('clipboard') || exists('g:vscode')
    let g:clipboard = {
        \   'name': 'wslclipboard',
        \   'copy': {
        \       '+': 'win32yank.exe -i --crlf',
        \       '*': 'win32yank.exe -i --crlf',
        \   },
        \   'paste': {
        \       '+': 'win32yank.exe -o --lf',
        \       '*': 'win32yank.exe -o --lf',
        \   },
        \   'cache_enabled': 1,
    \ }
endif
