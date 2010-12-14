set nocp

set backspace=indent,eol,start

set novisualbell " don't blink
set noerrorbells "don't make noise
set cursorline " highlight current line

set shiftwidth=2
set tabstop=2
set expandtab
" autoindent just re-uses the indent of the pervious line
set autoindent

set backup		" keep a backup file
set backupdir=/tmp

nnoremap <CR> "=strftime("✍ %F %r\n")<CR>po<TAB>

#TODO:
syntax highlighting
nerdtree browsing
right hand-side todolist
gVim links -> open in browser.
easy pasting
