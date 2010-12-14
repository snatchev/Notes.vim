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
set backupdir=.backups/
set directory=.backups/

nnoremap <CR> "=strftime("✍ %F %r\n")<CR>po<TAB>

"remember last cursor postion
" TODO doesnt work
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif


"don't use any of the default vim stuff
set runtimepath=./
call pathogen#runtime_append_all_bundles()
" load all the plugins
runtime! plugin/**/*.vim

""""""""""""""""""""""""""""""""""
" have nerdtree quit if it's the last window open
" https://github.com/scrooloose/nerdtree/issues#issue/21
"
function! NERDTreeQuit()
  redir => buffersoutput
  silent buffers
  redir END
"                     1BufNo  2Mods.     3File           4LineNo
  let pattern = '^\s*\(\d\+\)\(.....\) "\(.*\)"\s\+line \(\d\+\)$'
  let windowfound = 0

  for bline in split(buffersoutput, "\n")
    let m = matchlist(bline, pattern)

    if (len(m) > 0)
      if (m[2] =~ '..a..')
        let windowfound = 1
      endif
    endif
  endfor

  if (!windowfound)
    quitall
  endif
endfunction
autocmd WinEnter * call NERDTreeQuit()




" nerdtree browsing
let NERDTreeHighlightCursorline=0
let NERDTreeStatusline="\%{strftime('%F')}"
let NERDTreeWinSize=20
"TODO: remove the top 5 lines...

" open the tree
NERDTree notesdb
" set the focus on the first buffer
wincmd l

" move to the bottom of the page.
$


" TODO:
" syntax highlighting

"syntax enable   " not syn on, we want to define our own
"set syntax=notes-syntax
" right hand-side todolist
" gVim links -> open in browser.
" easy pasting
