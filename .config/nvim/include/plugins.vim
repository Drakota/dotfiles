function! Cond(cond, ...)
  let opts = get(a:000, 0, {})
  return a:cond ? opts : extend(opts, { 'on': [], 'for': [] })
endfunction

call plug#begin(has('nvim') ? stdpath('data') . '/plugged' : '~/.vim/plugged')

Plug 'easymotion/vim-easymotion', Cond(!exists('g:vscode'))
Plug 'asvetliakov/vim-easymotion', Cond(exists('g:vscode'), { 'as': 'vsc-easymotion' })
Plug 'vim-scripts/ReplaceWithRegister'

call plug#end()

let g:EasyMotion_do_mapping = 0 " Disable default mappings
let g:EasyMotion_smartcase = 1

" Gif config
map  <Leader><Leader>/ <Plug>(easymotion-sn)
omap <Leader><Leader>/ <Plug>(easymotion-tn)
