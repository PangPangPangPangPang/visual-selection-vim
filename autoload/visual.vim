function! VisualAction(action, ...) range
    let l:saved_reg = @"
    execute "normal! vgvy"

    let l:pattern = escape(@", '\\/.*$^~[]')
    let l:pattern = substitute(l:pattern, "\n$", "", "")
    call CmdLine(a:action . l:pattern)
    let @/ = l:pattern
    let @" = l:saved_reg
endfunction
