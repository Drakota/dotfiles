" Set clipboard
set clipboard=unnamedplus 

" Clipbord sync with the VSCode extension
if has('clipboard') || exists('g:vscode')
    let s:clip = '/mnt/c/Windows/System32/clip.exe'
    if executable(s:clip)
        augroup WSLYank
            autocmd!
            autocmd TextYankPost * if v:event.operator ==# 'y' | call system(s:clip, @0) | endif
        augroup END
    endif
endif

" CLI specific config
if !exists('g:vscode')
	" Set tab size
	set tabstop=4

	" Enable line numbers
	set number

	" Enable mouse scrolling in tmux
	set mouse=a

	" Enable syntax highlighting
	syntax on

	" Wrap long lines
	set wrap
endif