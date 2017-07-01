function! CmdLine(str)
    exe "menu Foo.Bar :" . a:str
    emenu Foo.Bar
    unmenu Foo
endfunction 

function! visual#action(...) range
    let l:saved_reg = @"
    execute "normal! vgvy"
    let l:pattern = escape(@", '\\/.*$^~[]')
    let l:pattern = substitute(l:pattern, "\n$", "", "")

    let l:list = copy(a:000)
    for str in l:list
        let l:r = substitute(str, "foo", l:pattern,"")
        let l:cnt =  index(l:list, str)
        let l:list[l:cnt] = l:r
    endfor
    let l:cmd_str = join(l:list, " ")
    exe l:cmd_str 

    let @/ = l:pattern
    let @" = l:saved_reg
endfunction

function! visual#replace(direction) range
    let l:saved_reg = @"
    execute "normal! vgvy"

    let l:pattern = escape(@", '\\/.*$^~[]')
    let l:pattern = substitute(l:pattern, "\n$", "", "")

    let l:r = substitute(a:direction, "foo", l:pattern,"")
    call CmdLine(l:r)

    let @/ = l:pattern
    let @" = l:saved_reg
endfunction
