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

function! Filtered(fn, l)
    let new_list = deepcopy(a:l)
    if type(a:l) == type([])
	call filter(new_list, string(a:fn) . '(v:val)')
    elseif type(a:l) == type({})
	" filter dictionary based on keys
	call filter(new_list, string(a:fn) . '(v:key)')
    endif
    return new_list
endfunction

function! Removed(fn, l)
    let new_list = deepcopy(a:l)
    if type(a:l) == type([])
	call filter(new_list, '!' . string(a:fn) . '(v:val)')
    elseif type(a:l) == type({})
	" filter dictionary based on keys
	call filter(new_list, '!' . string(a:fn) . '(v:key)')
    endif
    return new_list
endfunction

function! Reduced(fn, l, memo)
    let reduction = a:memo
    if type(a:l) == type([])
	for item in a:l
	    let reduction = a:fn(reduction, item)
	endfor
    elseif type(a:l) == type({})
	for [key, value] in items(a:l)
	    let reduction = a:fn(reduction, key, value)
	endfor
    endif
    return reduction
endfunction
