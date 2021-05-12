" Set tab size
set tabstop=4

" Enable line numbers
set number

" Enable mouse scrolling in tmux
set mouse=a

" Enable syntax highlighting
syntax on

" Makes 'CTRL-^' execute 'lnoremap x X' and 'lnoremap X x' for each letter a-z.
for c in range(char2nr('A'), char2nr('Z'))
  execute 'lnoremap ' . nr2char(c+32) . ' ' . nr2char(c)
  execute 'lnoremap ' . nr2char(c) . ' ' . nr2char(c+32)
endfor

" Kill the capslock when leaving insert mode.
autocmd InsertLeave * set iminsert=0

" Disable bell sounds
set belloff=all

" Show command while it's being typed
set showcmd
