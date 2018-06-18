" Configuration file for vim

" Normally we use vim-extensions. If you want true vi-compatibility
" remove change the following statements
set nocompatible	" Use Vim defaults instead of 100% vi compatibility
set backspace=2		" more powerful backspacing

" Don't write backup file if vim is being called by "crontab -e"
au BufWrite /private/tmp/crontab.* set nowritebackup nobackup
" Don't write backup file if vim is being called by "chpass"
au BufWrite /private/etc/pw.* set nowritebackup nobackup
syntax on "enables syntax highlighting
set nu "enables line numbers
set tabstop=4 "sets \t length to 4 spaces
set softtabstop=4 "sets the tab key to input 4 spaces and backspace to remove 4
set expandtab "Tabs become spaces
filetype indent on "reads standard indentation by file type
" retab

" move vertically by visual line
nnoremap j gj 
nnoremap k gk

"remap B and E to move to beginning/end of line, and unbind the original keys
nnoremap B ^
nnoremap E $

nnoremap $ <nop>
nnoremap ^ <nop>

" handle double indentation
set shiftwidth=4

color slate

" Show nonprinting charachters
" set list
