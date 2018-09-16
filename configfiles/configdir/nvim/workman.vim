" Taken from https://axiomatic.neophilus.net/workman-layout-for-vim/
" Keyboard  **************************
    function! Keyboard(type)
       if a:type == "workman"
           "(O)pen line -> (L)ine
           nnoremap l o
           nnoremap o l
           nnoremap L O
           nnoremap O L
           vnoremap l o
           vnoremap o l
           vnoremap L O
           vnoremap O L
           "Search (N)ext -> (J)ump
           nnoremap j n
           nnoremap n j
           nnoremap J N
           nnoremap N J
           nnoremap gn gj
           nnoremap gj gn
           vnoremap j n
           vnoremap n j
           vnoremap J N
           vnoremap N J
           vnoremap gn gj
           vnoremap gj gn
           "(E)nd of word -> brea(K) of word
           nnoremap k e
           nnoremap e k
           nnoremap K E
           nnoremap E <nop>
           nnoremap gk ge
           nnoremap ge gk
           vnoremap k e
           vnoremap e k
           vnoremap K E
           vnoremap E <nop>
           vnoremap gk ge
           vnoremap ge gk
           "(Y)ank -> (H)aul
           nnoremap h y
           onoremap h y
           nnoremap y h
           nnoremap H Y
           nnoremap Y H
           vnoremap h y
           vnoremap y h
           vnoremap H Y
           vnoremap Y H
       else " qwerty
           call UnmapWorkman()
       endif
    endfunction

    function! UnmapWorkman()
        "Unmaps Workman keys
        silent! nunmap h
        silent! ounmap h
        silent! nunmap j
        silent! nunmap k
        silent! nunmap l
        silent! nunmap y
        silent! nunmap n
        silent! nunmap e
        silent! nunmap o
        silent! nunmap H
        silent! nunmap J
        silent! nunmap K
        silent! nunmap L
        silent! nunmap Y
        silent! nunmap N
        silent! nunmap E
        silent! nunmap O
        silent! vunmap h
        silent! vunmap j
        silent! vunmap k
        silent! vunmap l
        silent! vunmap y
        silent! vunmap n
        silent! vunmap e
        silent! vunmap o
        silent! vunmap H
        silent! vunmap J
        silent! vunmap K
        silent! vunmap L
        silent! vunmap Y
        silent! vunmap N
        silent! vunmap E
        silent! vunmap O
    endfunction

    function! LoadKeyboard()
       let keys = $keyboard
       if (keys == "workman")
           call Keyboard("workman")
       else
           call Keyboard("qwerty")
       endif
    endfunction

    autocmd VimEnter * call LoadKeyboard()

    :noremap <Leader>q :call Keyboard("qwerty")<CR>:echom "Qwerty Keyboard Layout"<CR>
    :noremap <Leader>w :call Keyboard("workman")<CR>:echom "Workman Keyboard Layout"<CR>
