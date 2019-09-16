" Vim colorscheme file
" Maintainer:   Per Erskjans aka Arcnice

" This is my custom syntax file to override the defaults provided with Vim.
" This file should be located in $HOME/.vim/colors/ or $HOME/vimfiles/colors.

" This file should automatically be sourced by $RUNTIMEPATH.

" NOTE(S):
" *(1)
" This color scheme is created for 256 color terminals only. This may change
" in the future.
"
" *(2)
" The color definitions assumes and is intended for a black or dark background.

" *(3)
" This file is specifically in Unix style EOL format so that I can simply
" copy this file between Windows and Unix systems.  VIM can source files in
" with the UNIX EOL format (only <NL> instead of <CR><NR> for DOS) in any
" operating system if the 'fileformats' is not empty and there is no <CR>
" just before the <NL> on the first line.  See ':help :source_crnl' and
" ':help fileformats'.

"
" Support for 256-color terminal
"

hi clear
set t_Co=256
"set background=dark
if exists("syntax_on")
  syntax reset
endif
"let g:colors_name = "perskjans"

hi Boolean             cterm=NONE    ctermfg=135     ctermbg=NONE
hi Character           cterm=NONE    ctermfg=5       ctermbg=NONE
hi ColorColumn         cterm=NONE    ctermfg=NONE    ctermbg=235
hi Comment             cterm=NONE    ctermfg=59      ctermbg=NONE
hi Conditional         cterm=NONE    ctermfg=4       ctermbg=NONE
hi Constant            cterm=NONE    ctermfg=135     ctermbg=NONE
hi CursorColumn        cterm=NONE    ctermfg=NONE    ctermbg=234
hi Cursor              cterm=NONE    ctermfg=16      ctermbg=10
hi CursorLine          cterm=NONE    ctermfg=NONE    ctermbg=235
hi CursorLineNr        cterm=NONE    ctermfg=124     ctermbg=NONE
hi Debug               cterm=NONE    ctermfg=225     ctermbg=NONE
hi Define              cterm=NONE    ctermfg=201     ctermbg=NONE
hi Delimiter           cterm=NONE    ctermfg=241     ctermbg=NONE
hi DiffAdd             cterm=NONE    ctermfg=NONE    ctermbg=24
hi DiffChange          cterm=NONE    ctermfg=181     ctermbg=239
hi DiffDelete          cterm=NONE    ctermfg=162     ctermbg=53
hi DiffText            cterm=NONE    ctermfg=NONE    ctermbg=102
hi Directory           cterm=NONE    ctermfg=6       ctermbg=NONE
hi Error               cterm=NONE    ctermfg=219     ctermbg=89
hi Float               cterm=NONE    ctermfg=135     ctermbg=NONE
hi FoldColumn          cterm=NONE    ctermfg=67      ctermbg=16
hi Folded              cterm=NONE    ctermfg=67      ctermbg=16
hi Function            cterm=NONE    ctermfg=208     ctermbg=NONE
hi Identifier          cterm=NONE    ctermfg=208     ctermbg=NONE
hi Ignore              cterm=NONE    ctermfg=244     ctermbg=232
hi IncSearch           cterm=NONE    ctermfg=193     ctermbg=16
hi keyword             cterm=NONE    ctermfg=21      ctermbg=NONE
hi Label               cterm=NONE    ctermfg=229     ctermbg=NONE
hi LineNr              cterm=NONE    ctermfg=250     ctermbg=NONE
hi Macro               cterm=NONE    ctermfg=201     ctermbg=NONE
hi MatchParen          cterm=NONE    ctermfg=0       ctermbg=198
hi ModeMsg             cterm=NONE    ctermfg=229     ctermbg=NONE
hi MoreMsg             cterm=NONE    ctermfg=229     ctermbg=NONE
hi NonText             cterm=NONE    ctermfg=59      ctermbg=NONE
hi Normal              cterm=NONE    ctermfg=130     ctermbg=16
hi Number              cterm=NONE    ctermfg=135     ctermbg=NONE
hi Operator            cterm=NONE    ctermfg=161     ctermbg=NONE
hi Pmenu               cterm=NONE    ctermfg=81      ctermbg=16
hi PmenuSbar           cterm=NONE    ctermfg=NONE    ctermbg=232
hi PmenuSel            cterm=NONE    ctermfg=255     ctermbg=242
hi PmenuThumb          cterm=NONE    ctermfg=81      ctermbg=NONE
hi PreCondit           cterm=NONE    ctermfg=118     ctermbg=NONE
hi PreProc             cterm=NONE    ctermfg=89      ctermbg=NONE
hi Question            cterm=NONE    ctermfg=81      ctermbg=NONE
hi Repeat              cterm=NONE    ctermfg=161     ctermbg=NONE
hi Search              cterm=NONE    ctermfg=0       ctermbg=222
hi SignColumn          cterm=NONE    ctermfg=118     ctermbg=235
hi SpecialChar         cterm=NONE    ctermfg=161     ctermbg=NONE
hi SpecialComment      cterm=NONE    ctermfg=245     ctermbg=NONE
hi Special             cterm=NONE    ctermfg=74      ctermbg=NONE
hi Statement           cterm=NONE    ctermfg=3       ctermbg=NONE
hi SpecialKey          cterm=NONE    ctermfg=81      ctermbg=NONE
hi StatusLine          cterm=NONE    ctermfg=238     ctermbg=253
hi StatusLineNC        cterm=NONE    ctermfg=244     ctermbg=232
hi StorageClass        cterm=NONE    ctermfg=208     ctermbg=NONE
hi String              cterm=NONE    ctermfg=34      ctermbg=NONE
hi Structure           cterm=NONE    ctermfg=63      ctermbg=NONE
hi Tag                 cterm=NONE    ctermfg=161     ctermbg=NONE
hi Title               cterm=NONE    ctermfg=190     ctermbg=NONE
hi Todo                cterm=NONE    ctermfg=231     ctermbg=196
hi Type                cterm=NONE    ctermfg=2       ctermbg=NONE
hi Typedef             cterm=NONE    ctermfg=226     ctermbg=NONE
hi Underlined          cterm=NONE    ctermfg=244     ctermbg=NONE
hi WarningMsg          cterm=NONE    ctermfg=231     ctermbg=238
hi VertSplit           cterm=NONE    ctermfg=52      ctermbg=NONE
hi WildMenu            cterm=NONE    ctermfg=81      ctermbg=16
hi Visual              cterm=NONE    ctermfg=NONE    ctermbg=236
hi VisualNOS           cterm=NONE    ctermfg=NONE    ctermbg=236

if has("spell")
    hi SpellBad        cterm=NONE    ctermfg=NONE    ctermbg=52
    hi SpellCap        cterm=NONE    ctermfg=NONE    ctermbg=17
    hi SpellLocal      cterm=NONE    ctermfg=NONE    ctermbg=17
    hi SpellRare       cterm=NONE    ctermfg=NONE    ctermbg=NONE
endif
