nnoremap <leader>f :call FoldColumnToggle()<cr>

function! FoldColumnToggle()
    if &foldcolumn
	setlocal foldcolumn=0
    else
	setlocal foldcolumn=4
    endif
endfunction


nnoremap <leader>q :call QuickfixToggle()<cr>

let g:quickfix_is_open = 0

function! QuickfixToggle()
    if g:quickfix_is_open
	cclose
	let g:quickfix_is_open = 0
    else
	copen
	let g:quickfix_is_open = 1
    endif
endfunction
