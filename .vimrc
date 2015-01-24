" Basic settings --- {{{
set number
set numberwidth=4

let mapleader=","
let maplocalleader="\\"
" }}}

" Status line --- {{{
set statusline=%f		" file path
set statusline+=\ 		" separator
set statusline+=%y 		" filetype
set statusline+=\ 		" separator
set statusline+=%m		" modified
set statusline+=%r		" readonly
set statusline+=%=		" align right
set statusline+=%l		" current line
set statusline+=/		" separator
set statusline+=%L		" total lines
" }}}

" Mappings --- {
" Edit and source .vimrc
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>

" Recover from accidental Ctrl-U
" http://vim.wikia.com/wiki/Recover_from_accidental_Ctrl-U
inoremap <c-u> <c-g>u<c-u>
inoremap <c-w> <c-g>u<c-w>

" Easier <esc>
inoremap jk <esc>
inoremap <esc> <nop>

" Transpose lines
noremap <leader>- dd p
noremap <leader>_ dd k p

" Convert current word to uppercase
inoremap <leader><c-u> <esc>bveUea
nnoremap <leader><c-u> bveU

" Clear line then insert
nnoremap <leader>c ddO

" Surround word in double quotes
nnoremap <leader>" viw<esc>a"<esc>hbi"<esc>lel

" Surround word in single quotes
nnoremap <leader>' viw<esc>a'<esc>hbi'<esc>lel

" Surround visual selection in double quotes
vnoremap <leader>" <esc>`>a"<esc>`<i"<esc>`>ll

" Surround visual selection in single quotes
vnoremap <leader>' <esc>`>a'<esc>`<i'<esc>`>ll

" Move to the beginning of current line
nnoremap H ^

" Move to the end of the current line
nnoremap L $

" Operate on next email
onoremap in@ :execute "normal! /@\r:nohlsearch\rBvEbe"<cr>
" }}}

" Python file settings --- {{{
augroup filetype_python
  autocmd!
  autocmd FileType python setlocal nowrap nolist nospell number
  " Comment out a line
  autocmd FileType python nnoremap <buffer> <localleader>c I#<esc>
augroup END
" }}}

" Vimscript file settings --- {{{
augroup filetype_vim
  autocmd!
  autocmd FileType vim setlocal foldmethod=marker nowrap nolist nospell nonumber
  " Comment out a line
  autocmd FileType vim nnoremap <buffer> <localleader>c I" <esc>
augroup END
" }}}

" HTML file settings --- {{{
augroup filetype_html
  autocmd!
  " Fold a block
  autocmd FileType html nnoremap <buffer> <localleader>f Vatzf
augroup END
" }}}

" Markdown file settings --- {{{
augroup filetype_markdown
  autocmd!
  " Inside and around heading
  " NOTE: It took a long time to figure out the double escape for \|
  autocmd FileType markdown onoremap <buffer> ih :<c-u>execute "normal! ?^==\\+$\\\\|^--\\+$\r:nohlsearch\rkvg_"<cr>
  autocmd FileType markdown onoremap <buffer> ah :<c-u>execute "normal! ?^==\\+$\\\\|^--\\+$\r:nohlsearch\rg_vk0"<cr>
augroup END
" }}}

iabbrev adn  and
iabbrev teh  the
iabbrev waht what
iabbrev tehn then
iabbrev @@ esumbar@gmail.com
iabbrev ssig -- <cr>Edmund Sumbar<cr>esumbar@gmail.com
