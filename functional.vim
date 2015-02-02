function! Sorted(l)
    let new_list = deepcopy(a:l)
    call sort(new_list)
    return new_list
endfunction

function! Reversed(l)
    let new_list = deepcopy(a:l)
    call reverse(new_list)
    return new_list
endfunction

function! Append(l, val)
    let new_list = deepcopy(a:l)
    call add(new_list, a:val)
    return new_list
endfunction

" Assoc works for both Lists and Dictionaries without change
function! Assoc(l, i, val)
    let new_list = deepcopy(a:l)
    let new_list[a:i] = a:val
    return new_list
endfunction

" Pop works for both Lists and Dictionaries without change
function! Pop(l, i)
    let new_list = deepcopy(a:l)
    call remove(new_list, a:i)
    return new_list
endfunction

" Mapped works for both Lists and Dictionaries without change
function! Mapped(fn, l)
    let new_list = deepcopy(a:l)
    call map(new_list, string(a:fn) . '(v:val)')
    return new_list
endfunction

" Convert functions to also support dictionaries
" Finish implementing the Reduced function

function! Filtered(fn, l)
    let new_list = deepcopy(a:l)
    call filter(new_list, string(a:fn) . '(v:val)')
    return new_list
endfunction

function! Removed(fn, l)
    let new_list = deepcopy(a:l)
    call filter(new_list, '!' . string(a:fn) . '(v:val)')
    return new_list
endfunction

function! Reduced(fn, l)
    if type(a:l) == type([])
	let new_list = deepcopy(a:l)
	let reduction = remove(new_list, 0)
	for item in new_list
	    let reduction = a:fn(reduction, item)
	endfor
    elseif type(a:l) == type({})
	let new_dict = deepcopy(a:l)
	let first_key = keys(a:l)[0]
	let reduction = remove(new_dict, first_key)
    else
	echom "Not a List or Dict"
	let reduction = 0
    endif
    return reduction
endfunction
