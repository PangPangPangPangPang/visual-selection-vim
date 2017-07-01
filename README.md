# visual-selection-vim

Simple vim plugin for selection action.

Example：

```VimScript
vnoremap <silent> <leader>f :call visual#action('Ack! foo')<CR>
vnoremap <leader>r :call visual#replace('%s/foo//g')<CR><left><left>
```
