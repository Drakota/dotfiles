" Set clipboard
set clipboard=unnamedplus 

" Clipbord sync with Windows through WSL
if has('clipboard') || exists('g:vscode')
    let s:clip = 'clip.exe'
    if executable(s:clip)
        augroup WSLYank
            autocmd!
            autocmd TextYankPost * if v:event.operator ==# 'y' | call system(s:clip, @0) | endif
        augroup END
    endif
endif
