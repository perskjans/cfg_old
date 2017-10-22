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


hi clear
set t_Co=256
set background=dark
if exists("syntax_on")
  syntax reset
endif
let g:colors_name = "arcnice"


"
" Support for 256-color terminal
"
"hi Normal          ctermfg=252  ctermbg=16
hi Normal          ctermfg=130  ctermbg=16
hi CursorLine      ctermfg=NONE ctermbg=235 cterm=NONE
hi CursorLineNr    ctermfg=124 ctermbg=NONE

hi Boolean         ctermfg=135
hi Character       ctermfg=88
hi Number          ctermfg=135
hi String          ctermfg=88
hi Conditional     ctermfg=226
hi Constant        ctermfg=135
hi Cursor          ctermfg=16  ctermbg=6
hi Debug           ctermfg=225
hi Define          ctermfg=201
hi Delimiter       ctermfg=241

hi DiffAdd                     ctermbg=24
hi DiffChange      ctermfg=181 ctermbg=239
hi DiffDelete      ctermfg=162 ctermbg=53
hi DiffText                    ctermbg=102 

hi Directory       ctermfg=118
hi Error           ctermfg=219 ctermbg=89
hi Float           ctermfg=135
hi FoldColumn      ctermfg=67  ctermbg=16
hi Folded          ctermfg=67  ctermbg=16
hi Function        ctermfg=118
hi Identifier      ctermfg=208
hi Ignore          ctermfg=244 ctermbg=232
hi IncSearch       ctermfg=193 ctermbg=16

hi keyword         ctermfg=21
hi Label           ctermfg=229
hi Macro           ctermfg=201
hi SpecialKey      ctermfg=81

hi MatchParen      ctermfg=233  ctermbg=46
hi ModeMsg         ctermfg=229
hi MoreMsg         ctermfg=229
hi Operator        ctermfg=161

" complete menu
hi Pmenu           ctermfg=81  ctermbg=16
hi PmenuSel        ctermfg=255 ctermbg=242
hi PmenuSbar                   ctermbg=232
hi PmenuThumb      ctermfg=81

hi PreCondit       ctermfg=118
hi PreProc         ctermfg=118
hi Question        ctermfg=81
hi Repeat          ctermfg=161
hi Search          ctermfg=0   ctermbg=222

" marks column
hi SignColumn      ctermfg=118 ctermbg=235
hi SpecialChar     ctermfg=161
hi SpecialComment  ctermfg=245
hi Special         ctermfg=81
if has("spell")
    hi SpellBad                ctermbg=52
    hi SpellCap                ctermbg=17
    hi SpellLocal              ctermbg=17
    hi SpellRare  ctermfg=none ctermbg=none
endif
hi Statement       ctermfg=226
hi StatusLine      ctermfg=238 ctermbg=253
hi StatusLineNC    ctermfg=244 ctermbg=232
hi StorageClass    ctermfg=208
hi Structure       ctermfg=81
hi Tag             ctermfg=161
hi Title           ctermfg=166
hi Todo            ctermfg=231 ctermbg=196

hi Typedef         ctermfg=226
hi Type            ctermfg=21
hi Underlined      ctermfg=244

hi VertSplit       ctermfg=244 ctermbg=232
hi VisualNOS                   ctermbg=238
hi Visual                      ctermbg=235
hi WarningMsg      ctermfg=231 ctermbg=238
hi WildMenu        ctermfg=81  ctermbg=16

hi Comment         ctermfg=59
hi CursorColumn                ctermbg=234
hi ColorColumn                 ctermbg=235
hi LineNr          ctermfg=250 ctermbg=NONE
hi NonText         ctermfg=59

hi SpecialKey      ctermfg=59
