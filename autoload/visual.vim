function! visual#cmdLine(str)
    let l:cmd = 'menu Foo.Bar :' . a:str
    exe l:cmd
    emenu Foo.Bar
    unmenu Foo
endfunction 

function! visual#get_visual_selection()
    " Why is this not a built-in Vim script function?!
    let [line_start, column_start] = getpos("'<")[1:2]
    let [line_end, column_end] = getpos("'>")[1:2]
    let lines = getline(line_start, line_end)
    if len(lines) == 0
        return ''
    endif
    let lines[-1] = lines[-1][: column_end - (&selection == 'inclusive' ? 1 : 2)]
    let lines[0] = lines[0][column_start - 1:]
    return join(lines, "\n")
endfunction

function! visual#action(...) range

    let l:pattern = visual#get_visual_selection()
    let l:list = copy(a:000)
    for str in l:list
        let l:r = substitute(str, "foo", l:pattern,"")
        let l:cnt =  index(l:list, str)
        let l:list[l:cnt] = l:r
    endfor
    let l:cmd_str = join(l:list, " ")
    exe l:cmd_str 
endfunction

function! visual#replace(...) range
    let l:pattern = visual#get_visual_selection()
    let l:list = copy(a:000)
    for str in l:list
        let l:r = substitute(str, "foo", l:pattern,"")
        let l:cnt =  index(l:list, str)
        let l:list[l:cnt] = l:r
    endfor
    let l:cmd_str = join(l:list, " ")
    call visual#cmdLine(l:cmd_str)
endfunction
