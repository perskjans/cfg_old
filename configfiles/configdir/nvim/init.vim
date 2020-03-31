set fileencodings=utf-8
set encoding=utf-8

let $myvimdir="~/.vim"
let MYVIMRC="~/.vimrc"
let $workman=$myvimdir . "/workman.vim"

syntax on
let $mycolorfile=$myvimdir . "/colors/perskjans.vim"
so $mycolorfile

"=====[ auto reload config if changed ]========
augroup myvimrc
    au!
        au BufWritePost .vimrc so $MYVIMRC
        au BufWritePost init.vim so $MYVIMRC
augroup END

nnoremap <silent> <leader>0 :so $MYVIMRC<cr>

" Backups folders {{{

set backup
set noswapfile

set dir=~/.cache/vimtmp
set undodir=~/.cache/tmp/undo
set backupdir=~/.cache/vimtmp/backup
set viewdir=~/.cache/vimtmp/view

" Make Vim able to edit crontab files again.
set backupskip=/tmp/*,/private/tmp/*"

" Make those folders automatically if they don't already exist.
if !isdirectory(expand(&dir))
    call mkdir(expand(&dir), "p")
endif
if !isdirectory(expand(&undodir))
    call mkdir(expand(&undodir), "p")
endif
if !isdirectory(expand(&backupdir))
    call mkdir(expand(&backupdir), "p")
endif
if !isdirectory(expand(&viewdir))
    call mkdir(expand(&viewdir), "p")
endif

" }}}

" PLUGIN HANDLING -------------------------------------------------------- {{{
"## neomake, vim-plug, matchit, vim-suround, supertab, ZoomWin, tComment,
set nocompatible              " be iMproved, required
filetype off                  " required

" Get Vundle
" git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/plugins/Vundle.vim

" set the runtime path to include Vundle and initialize

set rtp+=$myvimdir/plugins/Vundle.vim

" Call Vundle#begin()
" alternatively, pass a path where Vundle should install plugins
call vundle#begin($myvimdir . '/plugins')

Plugin 'VundleVim/Vundle.vim'

Plugin 'yggdroot/indentline'

Plugin 'easymotion/vim-easymotion'

Plugin 'pangloss/vim-javascript'

Plugin 'leafgarland/typescript-vim'

Plugin 'elzr/vim-json'
    "let g:vim_json_syntax_conceal = 0

Plugin 'frazrepo/vim-rainbow'
    let g:rainbow_active = 1

Plugin 'airblade/vim-gitgutter'

Plugin 'ctrlpvim/ctrlp.vim'
    let g:ctrlp_map = '<leader>f'

Plugin 'scrooloose/syntastic'

Plugin 'scrooloose/nerdtree'
    autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
    let NERDTreeHijackNetrw=1
    let g:NERDTreeDirArrowExpandable = '+'
    let g:NERDTreeDirArrowCollapsible = '-'

Plugin 'xuyuanp/nerdtree-git-plugin'

Plugin 'tpope/vim-fugitive'

Plugin 'tpope/vim-commentary'

Plugin 'tpope/vim-surround'

Plugin 'richsoni/vim-ecliptic'

Plugin 'vim-airline/vim-airline'
    let g:airline#extensions#tabline#enabled = 1
    "let g:airline_powerline_fonts = 1

"Plugin 'preservim/nerdcommenter'
"    " Add spaces after comment delimiters by default
"    let g:NERDSpaceDelims = 1
"
"    " Use compact syntax for prettified multi-line comments
"    let g:NERDCompactSexyComs = 1
"
"    " Align line-wise comment delimiters flush left instead of following code indentation
"    let g:NERDDefaultAlign = 'left'
"
"    " Set a language to use its alternate delimiters by default
"    let g:NERDAltDelims_java = 1
"
"    " Add your own custom formats or override the defaults
"    let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }
"
"    " Allow commenting and inverting empty lines (useful when commenting a region)
"    let g:NERDCommentEmptyLines = 1
"
"    " Enable trimming of trailing whitespace when uncommenting
"    let g:NERDTrimTrailingWhitespace = 1
"
"    " Enable NERDCommenterToggle to check all selected lines is commented or not 
"    let g:NERDToggleCheckAllLines = 1

"Plugin 'vim-airline/vim-airline-themes'

"Plugin 'itchyny/lightline.vim'

"Plugin 'msanders/snipmate.vim'

"Plugin 'rhysd/vim-clang-format'

"Plugin 'tpope/vim-vinegar'
    let g:netrw_banner=0 " Disable annoying banner
    let g:netrw_browser_split=4 " Open in prior window
    let g:netrw_altv=1 " Open splits to the right
    let g:netrw_liststyle=3 " Tree view
"let g:netrw_list_hide=netrw_gitignore#Hide()
"let g:netrw_list_hide='\(^\|\s\s\)\zs\.\S\+'

"Plugin 'andviro/flake8-vim'
"let g:PyFlakeOnWrite = 1
"let g:PyFlakeCheckers = 'pep8'
"let g:PyFlakeAggressive = 0

"Plugin 'klen/python-mode'
"map <Leader>g :call RopeGotoDefinition()<CR>
"let ropevim_enable_shortcuts = 1
"let g:pymode_rope_goto_def_newwin = "vnew"
"let g:pymode_rope_extended_complete = 1
"let g:pymode_breakpoint = 1
"let g:pymode_sytax = 1
"let g:pymode_sytax_builtin_objs = 1
"let g:pymode_sytax_builtin_funcs = 1
"map <Leader>b Oimport ipdb; ipdb.set_trace() # BREAKPOINT<C-c>


"Plugin 'ycm-core/YouCompleteMe'


"All of your Plugins must be added before the following line
call vundle#end()            " required

"filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ

" Put your non-Plugin stuff after this line


" END ---------------------------------------------------------------------- }}}

" BASIC OPTIONS------------------------------------------------------------- {{{

" required
"filetype plugin indent on
" To ignore plugin indent changes, instead use:
filetype plugin on

set path+=**
set modelines=0

set autoindent
set showmode
set showcmd
set hidden
set visualbell
set ttyfast
set ruler
set backspace=indent,eol,start
set laststatus=2
set history=1000
set undofile
set undoreload=10000
set list
set listchars=tab:▸\ ,eol:¬,extends:❯,precedes:❮
set lazyredraw
set matchtime=3
set showbreak=↪
set splitbelow
set splitright
set ff=unix
set cursorline
set number
set relativenumber
set pastetoggle=<F2>
set clipboard=unnamedplus
set autoindent  "Retain indentation on next line
set smartindent "Turn on autoindenting of blocks
set noautochdir

set notimeout
set ttimeout
set ttimeoutlen=10

" set complete=.,w,b,u,tBetter Completion
set complete=.,w,b,u,t
set completeopt=longest,menuone,preview

" Save when losing focus
au FocusLost * :silent! wall

" Resize splits when the window is resized
au VimResized * :wincmd =

"=====[ Setglobal relativenumber ]=====
autocmd WinEnter * :setlocal relativenumber
autocmd WinLeave,FocusLost * :setlocal number norelativenumber
autocmd InsertEnter * :setlocal number
autocmd InsertLeave * :setlocal relativenumber

" Highlight VCS conflict markers
match ErrorMsg '^\(<\|=\|>\)\{7\}\([^=].\+\)\?$'

" Open Quickfix window automatically after running :make
augroup OpenQuickfixWindowAfterMake
    autocmd QuickFixCmdPost [^l]* nested cwindow
    autocmd QuickFixCmdPost    l* nested lwindow
    autocmd FileType qf wincmd J
augroup END


"Square up visual selections...
set virtualedit=block

"=====[ Miscellaneous features (mainly options) ]=====================

set title           "Show filename in titlebar of window
set titleold=

set nomore          "Don't page long listings

set autowrite       "Save buffer automatically when changing files
set autoread        "Always reload buffer when external changes detected


"           +--Disable hlsearch while loading viminfo
"           | +--Remember marks for last 500 files
"           | |    +--Remember up to 10000 lines in each register
"           | |    |      +--Remember up to 1MB in each register
"           | |    |      |     +--Remember last 1000 search patterns
"           | |    |      |     |     +---Remember last 1000 commands
"           | |    |      |     |     |
"           v v    v      v     v     v
set viminfo=h,'500,<10000,s1000,/1000,:1000

set backspace=indent,eol,start      "BS past autoindents, line boundaries,
                                    "     and even the start of insertion

set fileformats=unix,mac,dos        "Handle Mac and DOS line-endings but prefer Unix endings

set wildmode=list:longest,full      "Show list of completions and complete as much as possible, then iterate full completions

set infercase                       "Adjust completions to match case

set showmode                        "Show mode change messages
set modelines=2                     "Always show mode

set updatecount=10                  "Save buffer every 10 chars typed


" Keycodes and maps timeout in 3/10 sec...
set timeout timeoutlen=300 ttimeoutlen=300


" Spelling
"
" There are three dictionaries I use for spellchecking:
"
"   /usr/share/dict/words
"   Basic stuff.
"
"   ~/.vim/custom-dictionary.utf-8.add
"   Custom words (like my name).  This is in my (version-controlled) dotfiles.
"
"   ~/.vim-local-dictionary.utf-8.add
"   More custom words.  This is *not* version controlled, so I can stick
"   work stuff in here without leaking internal names and shit.
"
" I also remap zG to add to the local dict (vanilla zG is useless anyway).
set dictionary=/usr/share/dict/words
"set spellfile=~/.vim/custom-dictionary.utf-8.add,~/.vim/local-dictionary.utf-8.add
nnoremap zG 2zg

"=====[ Correct common mistypings in-the-fly ]=======================

iab     flase  false
iab    retrun  return
iab     pritn  print
iab       teh  the
iab      liek  like
iab  liekwise  likewise
iab      Pelr  Perl
iab      pelr  perl
iab        ;t  't
iab      moer  more
iab  previosu  previous

" Wildmenu completion {{{

set wildmenu
"set wildmode=list:longest

set wildignore+=*/tmp/*,*.so,*.swp,*.zip         " MacOSX/Linux
set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe      " Windows
set wildignore+=.hg,.git,.svn,*.fossil           " Version control
set wildignore+=*.aux,*.out,*.toc                " LaTeX intermediate files
set wildignore+=*.jpg,*.bmp,*.gif,*.png,*.jpeg   " binary images
set wildignore+=*.o,*.obj,*.exe,*.dll,*.manifest " compiled object files
set wildignore+=*.spl                            " compiled spelling word lists
set wildignore+=*.sw?                            " Vim swap files
set wildignore+=*.DS_Store                       " OSX bullshit

set wildignore+=*.luac                           " Lua byte code

set wildignore+=migrations                       " Django migrations
set wildignore+=*.pyc                            " Python byte code

set wildignore+=*.orig                           " Merge resolution files
set wildignore+=bin                              " files in bin folder
set wildignore+=nbproject                        " Netbeans project folder
set wildignore+=external                         " folders for external dependecies
" }}}

" END ---------------------------------------------------------------------- }}}

" GRAPHICAL SETTINGS ------------------------------------------------------- {{{

" Tabs, spaces, wrapping {{{

set tabstop=4      "Tab indentation levels every four columns
set shiftwidth=4   "Indent/outdent by four columns
set expandtab      "Convert all tabs that are typed into spaces
set shiftround     "Always indent/outdent to nearest tabstop
set smarttab       "Use shiftwidths at left margin, tabstops everywhere else
set softtabstop=4
set expandtab
set wrap
"set textwidth=80
set formatoptions=tcq
set colorcolumn=81
" Don't try to highlight lines longer than 800 characters.
set synmaxcol=800

" }}}

" Cursorline {{{
" Only show cursorline in the current window and in normal mode.^
augroup cline
    au!
    au WinLeave,InsertEnter * set nocursorline
    au WinEnter,InsertLeave * set cursorline
augroup END

" }}}

"====[ Toggle visibility of naughty characters ]============

" Make naughty characters visible...
"exec "set listchars=tab:\<Char-0xBB>\<Char-0xBB>,trail:^,extends:>,precedes:<,nbsp:~"
set listchars=tab:>~,trail:^,extends:>,precedes:<,nbsp:~
",eol:
set showbreak=.^.

" Trailing {{{
" Only shown when not in insert mode so I don't go insane.

augroup trailing
    au!
    au InsertEnter * :set list!
    au InsertLeave * :set list!
augroup END

" }}}


augroup VisibleNaughtiness
    autocmd!
    autocmd BufEnter  *       set list
    autocmd BufEnter  *.txt   set nolist
    autocmd BufEnter  *.vp*   set nolist
    autocmd BufEnter  *       if !&modifiable
    autocmd BufEnter  *           set nolist
    autocmd BufEnter  *       endif
augroup END

" Resize vertical window
nnoremap <silent> <leader>1 :vertical resize +2<cr>
nnoremap <silent> <leader>2 :vertical resize -2<cr>
nnoremap <silent> <leader>3 :resize +2<cr>
nnoremap <silent> <leader>4 :resize -2<cr>
nnoremap <silent> <leader>5 :wincmd =<cr>

" END ---------------------------------------------------------------------- }}}

    " KEY MAPPING -------------------------------------------------------------- {{{{{{
    " Leader
    "let mapleader = "-"
    "let maplocalleader = "_"

    " === Movement ===
    nnoremap <C-j> jzz
    nnoremap <C-k> kzz
    nnoremap <A-n> }zz
    nnoremap <A-e> {zz
    nnoremap <C-e> <C-p>
    nnoremap <C-p> <C-e>
    vnoremap <C-e> <C-p>
    vnoremap <C-p> <C-e>

    " Splits
    nnoremap <leader>v <C-w>v
    nnoremap <leader>vv <C-w>s

    " Move between splits
    nnoremap <UP>  <C-W>k
    nnoremap <DOWN>  <C-W>j
    nnoremap <LEFT>  <C-W>h
    nnoremap <RIGHT>  <C-W>l

    " Move between open buffers
    nnoremap <C-l> :bn<CR>
    nnoremap <C-h> :bp<CR>


    " === Misc ===

    "noremap ; :
    "nnoremap : ,
    "nnoremap , ;
    "nnoremap ' "
nnoremap <silent> <leader>0 :wincmd =<cr>

" END ---------------------------------------------------------------------- }}}}}}

    " KEY MAPPING -------------------------------------------------------------- {{{
    " Leader
    "let mapleader = "-"
    "let maplocalleader = "_"

    " === Movement ===
    nnoremap <C-j> jzz
    nnoremap <C-k> kzz
    nnoremap <A-n> }zz
    nnoremap <A-e> {zz
    nnoremap <C-e> <C-p>
    nnoremap <C-p> <C-e>
    vnoremap <C-e> <C-p>
    vnoremap <C-p> <C-e>

    " Splits
    nnoremap <leader>v <C-w>v
    nnoremap <leader>vv <C-w>s

    " Move between splits
    nnoremap <UP>  <C-W>k
    nnoremap <DOWN>  <C-W>j
    nnoremap <LEFT>  <C-W>h
    nnoremap <RIGHT>  <C-W>l

    " Move between open buffers
    nnoremap <C-l> :bn<CR>
    nnoremap <C-h> :bp<CR>


    " === Misc ===

    "noremap ; :
    "nnoremap : ,
    "nnoremap , ;
    "nnoremap ' "
    "nnoremap " '
    inoremap tn <Esc>
    nnoremap <leader>t :NERDTreeToggle<cr>

    " yank, delete, paste
    "nnoremap <leader>y "+y
    "nnoremap <leader>Y "+Y
    "nnoremap <leader>d "+d
    "nnoremap <leader>D "+D
    "nnoremap <leader>p "+p
    "nnoremap <leader>P "+P


    " search and replace
    nnoremap <leader>r :%s:::cg<Left><Left><Left><Left>

    " Toggle search highlight
    nnoremap <leader>h :set hlsearch! hlsearch?<CR>

    " Open vimrc
    nnoremap <F3> :e $MYVIMRC<cr>

    " Close current buffer
    nnoremap <leader>b :bd<CR>

    " Show open buffers
    nnoremap <F4> :buffers<CR>:

    " Reload current buffer
    nnoremap <F5> :e<cr>


    " Make zO recursively open whatever fold we're in, even if it's partially open.
    nnoremap zO zczO

    " Indent/outdent current block...
    nmap %% $>i}``
    nmap $$ $<i}``

    " Visual Block mode is far more useful that Visual mode (so swap the commands).
    nnoremap v <C-v>
    nnoremap <C-v> v

    " Make BS/DEL work as expected in visual modes (i.e. delete the selected text).
    vmap <BS> x

    " Select the entire file...
    nnoremap vaa VGo1G

    " Run make
    nnoremap <F6>  :make!<cr><cr><cr>:cw<cr><cr>
    nnoremap <F7>  :cp<cr>
    nnoremap <F8>  :cn<cr>
    nnoremap <F9>  :call g:QFixToggle()<cr>

    function! g:QFixToggle()
          if exists("g:qfix_win")
            cclose
            unlet g:qfix_win
          else
            copen 10
            let g:qfix_win = bufnr("$")
          endif
    endfunction

    " Toggle line numbers
    nnoremap <leader>n :call g:ToggleNuMode()<CR>
    nnoremap <leader>nn :setlocal number!<cr>

    function! g:ToggleNuMode()
        if(&relativenumber == 1)
            set number
            set norelativenumber
        else
            set number
            set relativenumber
        endif
    endfunc

    " Remove trailing whitespace...
    nnoremap <leader>x mz:silent! call TrimTrailingWS()<CR>'z

    function! TrimTrailingWS()
        if search('\s\+$', 'cnw')
            :%s/\s\+$//ge
        endif
    endfunction

    " Sort lines
    vnoremap <leader>s :!sort<cr>

    " Wrap
    nnoremap <leader>W :set wrap!<cr>

    " Inserting blank lines
    nnoremap <space> o<Esc><UP>
    nnoremap <cr> O<ESC><DOWN>

    " Reselect last-pasted text
    nnoremap gp `[v`]

    " I constantly hit "u" in visual mode when I mean to "y". Use "gu" for those rare occasions.
    " From https://github.com/henrik/dotfiles/blob/master/vim/config/mappings.vim
    vnoremap u <nop>
    vnoremap gu u

    " "Uppercase word" mapping.

    "
    " This mapping allows you to press <c-u> in insert mode to convert the current
    " word to uppercase.  It's handy when you're writing names of constants and
    " don't want to use Capslock.
    "
    " To use it you type the name of the constant in lowercase.  While your
    " cursor is at the end of the word, press <c-u> to uppercase it, and then
    " continue happily on your way:
    "
    "                            cursor
    "                            v
    "     max_connections_allowed|
    "     <c-u>
    "     MAX_CONNECTIONS_ALLOWED|
    "                            ^
    "                            cursor
    "
    " It works by exiting out of insert mode, recording the current cursor location
    " in the z mark, using gUiw to uppercase inside the current word, moving back to
    " the z mark, and entering insert mode again.
    "
    " Note that this will overwrite the contents of the z mark.  I never use it, but
    " if you do you'll probably want to use another mark.
    inoremap <C-u> <esc>mzgUiw`za

    " Panic Button
    nnoremap <F12> mzggg?G`z

    " Keep the cursor_in place while joining lines
    nnoremap J mzJ`z

    " Split line (sister to [J]oin lines)
    " The normal use of S is covered by cc, so don't worry about shadowing it.
    nnoremap S i<cr><esc>^mwgk:silent! s/\v +$//<cr>:noh<cr>`w

    " Sudo to write
    cnoremap w!! w !sudo tee % >/dev/null

    " Toggle [i]nvisible characters
    nnoremap <leader>i :set list!<cr>

    " Unfuck my screen
    nnoremap <leader>u :syntax sync fromstart<cr>:redraw!<cr>

    " Zip Right
    "
    " Moves the character under the cursor to the end of the line.  Handy when you
    " have something like:
    "
    "     foo
    "
    " And you want to wrap it in a method call, so you type:
    "
    "     println()foo
    "
    " Once you hit escape your cursor is on the closing paren, so you can 'zip' it
    " over to the right with this mapping.
    "
    " This should preserve your last yank/delete as well.
    nnoremap zl x$p


    " END ---------------------------------------------------------------------- }}}

" Folding ------------------------------------------------------------------ {{{

set foldmethod=marker
set foldlevelstart=0
set foldnestmax=2

"Toggle fold methods \fo
let g:FoldMethod = 0
map <leader>z :call ToggleFold()<cr>
fun! ToggleFold()
    if g:FoldMethod == 0
        exe 'set foldmethod=indent'
        let g:FoldMethod = 1
    else
        exe 'set foldmethod=marker'
        let g:FoldMethod = 0
    endif
endfun

" Save folds when you leave buffer
autocmd BufWinLeave *.* mkview
autocmd BufWinEnter *.* silent loadview

" END ---------------------------------------------------------------------- }}}

" Filetype-specific ------------------------------------------------------- {{{

" Assembly {{{

augroup ft_asm
    au!
    au FileType asm setlocal noexpandtab shiftwidth=8 tabstop=8 softtabstop=8
augroup END

" }}}
" C {{{

augroup ft_c
    au!
    au FileType c setlocal foldmethod=marker foldmarker={,}
augroup END

" }}}
" CSS and LessCSS {{{

augroup ft_css
    au!

    au BufNewFile,BufRead *.less setlocal filetype=less

    au Filetype less,css setlocal foldmethod=marker
    au Filetype less,css setlocal foldmarker={,}
    au Filetype less,css setlocal omnifunc=csscomplete#CompleteCSS
    au Filetype less,css setlocal iskeyword+=-

    " Use <leader>S to sort properties.  Turns this:
    "
    "     p {
    "         width: 200px;
    "         height: 100px;
    "         background: red;
    "
    "         ...
    "     }
    "
    " into this:

    "     p {
    "         background: red;
    "         height: 100px;
    "         width: 200px;
    "
    "         ...
    "     }
    au BufNewFile,BufRead *.less,*.css nnoremap <buffer> <localleader>S ?{<CR>jV/\v^\s*\}?$<CR>k:sort<CR>:noh<CR>

    " Make {<cr> insert a pair of brackets in such a way that the cursor is correctly
    " positioned inside of them AND the following code doesn't get unfolded.
    au BufNewFile,BufRead *.less,*.css inoremap <buffer> {<cr> {}<left><cr><space><space><space><space>.<cr><esc>kA<bs>
augroup END

" }}}
" Django {{{

augroup ft_django
    au!

    au BufNewFile,BufRead urls.py           setlocal nowrap
    au BufNewFile,BufRead urls.py           normal! zR
    au BufNewFile,BufRead dashboard.py      normal! zR
    au BufNewFile,BufRead local_settings.py normal! zR

    au BufNewFile,BufRead admin.py     setlocal filetype=python.django
    au BufNewFile,BufRead urls.py      setlocal filetype=python.django
    au BufNewFile,BufRead models.py    setlocal filetype=python.django
    au BufNewFile,BufRead views.py     setlocal filetype=python.django
    au BufNewFile,BufRead settings.py  setlocal filetype=python.django
    au BufNewFile,BufRead settings.py  setlocal foldmethod=marker
    au BufNewFile,BufRead forms.py     setlocal filetype=python.django
    au BufNewFile,BufRead common_settings.py  setlocal filetype=python.django
    au BufNewFile,BufRead common_settings.py  setlocal foldmethod=marker
augroup END

" }}z
" Fish {{{

augroup ft_fish
    au!

    au BufNewFile,BufRead *.fish setlocal filetype=fish

    au FileType fish setlocal foldmethod=marker foldmarker={{{,}}}
augroup END

" }}}
" Java {{{

augroup ft_java
    au!

    au FileType java setlocal foldmethod=marker
    au FileType java setlocal foldmarker={,}
augroup END

" }}}
" Javascript {{{

augroup ft_javascript
    au!

    au FileType javascript setlocal foldmethod=marker
    au FileType javascript setlocal foldmarker={,}
    au FileType javascript call MakeSpacelessBufferIabbrev('clog', 'console.log();<left><left>')

    " Make {<cr> insert a pair of brackets in such a way that the cursor is correctly
    " positioned inside of them AND the following code doesn't get unfolded.
    au Filetype javascript inoremap <buffer> {<cr> {}<left><cr><space><space><space><space>.<cr><esc>kA<bs>
    " }

    " Prettify a hunk of JSON with <localleader>p
    au FileType javascript nnoremap <buffer> <localleader>p ^vg_:!python -m json.tool<cr>
    au FileType javascript vnoremap <buffer> <localleader>p :!python -m json.tool<cr>
augroup END

" }}}

" json {{{

au! BufRead,BufNewFile *.json set filetype=json

augroup json_autocmd
  autocmd!
  autocmd FileType json set autoindent
  autocmd FileType json set formatoptions=tcq2l
  autocmd FileType json set textwidth=78 shiftwidth=2
  autocmd FileType json set softtabstop=2 tabstop=8
  autocmd FileType json set expandtab
  autocmd FileType json set foldmethod=syntax
augroup END

" }}}

" Makefile {{{

augroup ft_make
    au!

    au Filetype make setlocal shiftwidth=8
augroup END

" }}}
" Markdown {{{

augroup ft_markdown
    au!

    au BufNewFile,BufRead *.m*down setlocal filetype=markdown foldlevel=1

    " Use <localleader>1/2/3 to add headings.

    au Filetype markdown nnoremap <buffer> <localleader>1 yypVr=:redraw<cr>
    au Filetype markdown nnoremap <buffer> <localleader>2 yypVr-:redraw<cr>
    au Filetype markdown nnoremap <buffer> <localleader>3 mzI###<space><esc>`zllll
    au Filetype markdown nnoremap <buffer> <localleader>4 mzI####<space><esc>`zlllll

    au Filetype markdown nnoremap <buffer> <localleader>p VV:'<,'>!python -m json.tool<cr>
    au Filetype markdown vnoremap <buffer> <localleader>p :!python -m json.tool<cr>
augroup END

" }}}
" Python {{{

function! OpenPythonRepl() "{{{
    "fucking kill me
    NeoRepl fish
endfunction "}}}
function! SendPythonLine() "{{{
    let view = winsaveview()

    execute "normal! ^vg_\<esc>"
    call NeoReplSendSelection()

    call winrestview(view)
endfunction "}}}
function! SendPythonParagraph() "{{{
    let view = winsaveview()

    execute "normal! ^vip\<esc>"
    call NeoReplSendSelection()

    call winrestview(view)
endfunction "}}}
function! SendPythonTopLevelHunk() "{{{
    let view = winsaveview()

    " TODO: This is horseshit, ugh

    " If we're on the first char of the form, calling PareditFindDefunBck will
    " move us to the previous form, which we don't want.  So instead we'll just
    " always move a char to the right.
    silent! normal! l

    call PareditFindDefunBck()
    execute "normal! vab\<esc>"
    call NeoReplSendSelection()

    call winrestview(view)
endfunction "}}}
function! SendPythonSelection() "{{{
    let view = winsaveview()
    let old_z = @z

    normal! gv"zy
    call NeoReplSendRaw("%cpaste\n" . @z . "\n--\n")

    let @z = old_z
    call winrestview(view)
endfunction "}}}
function! SendPythonBuffer() "{{{
    let view = winsaveview()

    execute "normal! ggVG\<esc>"

    normal! gv"zy
    call NeoReplSendRaw("%cpaste\n" . @z . "\n--\n")

    call winrestview(view)
endfunction "}}}

augroup ft_python
    au!

    au FileType python setlocal define=^\s*\\(def\\\\|class\\)

    " Jesus tapdancing Christ, built-in Python syntax, you couldn't let me
    " override this in a normal way, could you?
    au FileType python if exists("python_space_error_highlight") | unlet python_space_error_highlight | endif

    " Strip REPL-session marks from just-pasted text
    au FileType python nnoremap <localleader>s mz`[v`]:v/\v^(\>\>\>\|[.][.][.])/d<cr>gv:s/\v^(\>\>\> \|[.][.][.] \|[.][.][.]$)//<cr>:noh<cr>`z

    " Set up some basic neorepl mappings.
    "
    " key  desc                   mnemonic
    " \o - connect neorepl        [o]pen repl
    " \l - send current line      [l]ine
    " \p - send current paragraph [p]aragraph
    " \e - send top-level hunk    [e]val
    " \e - send selected hunk     [e]val
    " \r - send entire file       [r]eload file
    " \c - send ctrl-l            [c]lear

    au FileType python nnoremap <buffer> <silent> <localleader>o :call OpenPythonRepl()<cr>

    " Send the current line to the REPL
    au FileType python nnoremap <buffer> <silent> <localleader>l :call SendPythonLine()<cr>

    " Send the current paragraph to the REPL
    au FileType python nnoremap <buffer> <silent> <localleader>p :call SendPythonParagraph()<cr>

    " " Send the current top-level hunk to the REPL
    " au FileType python nnoremap <buffer> <silent> <localleader>e :call SendPythonTopLevelHunk()<cr>

    " Send the current selection to the REPL
    au FileType python vnoremap <buffer> <silent> <localleader>e :<c-u>call SendPythonSelection()<cr>

    " Send the entire buffer to the REPL ([r]eload)
    au FileType python nnoremap <buffer> <silent> <localleader>r :call SendPythonBuffer()<cr>

    " Clear the REPL
    au FileType python nnoremap <buffer> <silent> <localleader>c :call NeoReplSendRaw("")<cr>
augroup END

" }}}
" Ruby {{{

augroup ft_ruby
    au!
    au Filetype ruby setlocal foldmethod=syntax
    au BufRead,BufNewFile Capfile setlocal filetype=ruby
augroup END

" }}}
" Standard In {{{

augroup ft_stdin
    au!

    " Treat buffers from stdin (e.g.: echo foo | vim -) as scratch.

" }}}
" Vim {{{

augroup ft_vim
    au!

    au FileType vim setlocal foldmethod=marker
    au FileType help setlocal textwidth=78
    au BufWinEnter *.txt if &ft == 'help' | wincmd L | endif
augroup END

" }}}
" XML {{{

augroup ft_xml
    au!

    au FileType xml setlocal foldmethod=manual

    " Use <localleader>f to fold the current tag.
    au FileType xml nnoremap <buffer> <localleader>f Vatzf

    " Indent tag
    au FileType xml nnoremap <buffer> <localleader>= Vat=
augroup END

" }}}

autocmd BufWritePost */herbstluftwm/* silent !herbstclient reload

" END ---------------------------------------------------------------------- }}}

so $workman
