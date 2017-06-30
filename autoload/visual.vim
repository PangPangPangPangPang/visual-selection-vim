function! CmdLine(str)
    exe "menu Foo.Bar :" . a:str
    emenu Foo.Bar
    unmenu Foo
endfunction 

function! visual#action(...) range
    let l:saved_reg = @"
    " redir => message
    " silent execute 'ls'
    " redir END
    " echo message . 11111
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
    echo l:cmd_str
    call CmdLine(l:cmd_str)
    let @/ = l:pattern
    let @" = l:saved_reg
endfunction
