" Configure plugins first
runtime! include/plugins.vim
 
" General settings
runtime! include/general.vim

" Specific settings
if !exists('g:vscode')
    runtime! include/cli.vim
else
    runtime! include/vscode.vim
endif
