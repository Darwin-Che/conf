"" -- https://levelup.gitconnected.com/tweak-your-vim-as-a-powerful-ide-fcea5f7eff9c --

syntax on
" set modeline
" set expandtab
set tabstop=4
set shiftwidth=4
set scrolloff=8
set exrc " .vimrc in local project dir
set secure
" autocmd BufRead,BufNewFile * set signcolumn=yes
" autocmd FileType tagbar,nerdtree set signcolumn=no
" set foldmethod=indent
set nofoldenable
" set number relativenumber
set number
set diffopt+=vertical
" :augroup numbertoggle
" :  autocmd!
" :  autocmd BufEnter,FocusGained,InsertLeave,WinEnter * if &nu | set rnu   | endif
" :  autocmd BufLeave,FocusLost,InsertEnter,WinLeave   * if &nu | set nornu | endif
" :augroup END


"" -- PATHOGEN --
execute pathogen#infect()

"" -- THEME -- 
set cursorline
set background=dark

"let g:airline_theme='material'
"let g:material_theme_style = 'darker'
"colorscheme material
"hi Normal       ctermbg=NONE guibg=NONE
"hi SignColumn   ctermbg=235 guibg=#262626
"hi LineNr       ctermfg=grey guifg=grey ctermbg=NONE guibg=NONE
"hi CursorLineNr ctermbg=NONE guibg=NONE ctermfg=178 guifg=#d7af00

let g:gitgutter_set_sign_backgrounds = 0

"" -- NERDTree --
let NERDTreeShowHidden=1

"" -- buftabline
let buftabline_numbers=1

"" -- Airline -- 
" let g:airline#extensions#tabline#enabled = 1
" autocmd BufRead,BufNewFile * set laststatus=0

"" -- Whitespace highlight --
" match ExtraWhitespace /\s\+$/
" autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
" autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
" autocmd InsertLeave * match ExtraWhitespace /\s\+$/
" autocmd BufWinLeave * call clearmatches()

"" -- Exuberant Ctags --
set tags=tags

"" -- NVIM configuration --

" For Neovim > 0.1.5 and Vim > patch 7.4.1799 - https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162
" Based on Vim patch 7.4.1770 (`guicolors` option) - https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd
" https://github.com/neovim/neovim/wiki/Following-HEAD#20160511
if (has("termguicolors") && $TERM_PROGRAM ==# 'iTerm.app')
  set termguicolors
endif

" For Neovim 0.1.3 and 0.1.4 - https://github.com/neovim/neovim/pull/2198
if (has('nvim'))
  let $NVIM_TUI_ENABLE_TRUE_COLOR = 1
endif

if has('nvim')
    " Enable deoplete when InsertEnter.
    let g:deoplete#enable_at_startup = 0
    autocmd InsertEnter * call deoplete#enable()

    set belloff=""
    call deoplete#custom#source('_',  'max_menu_width', 0)
    call deoplete#custom#source('_',  'max_abbr_width', 0)
    call deoplete#custom#source('_',  'max_kind_width', 0)

    set hidden
    let g:LanguageClient_serverCommands = {
        \ 'rust': ['~/.cargo/bin/rustup', 'run', 'stable', 'rls'],
        \ 'go': ['~/.go/bin/gopls']
        \ }
endif

"" -- from no_plugin tutorial
"" https://github.com/changemewtf/no_plugins
set nocompatible

filetype plugin indent on
syntax enable

"" finding files
set path+=**
set wildmenu

"" tags
command! MakeTags !ctags -R .
" - Use ^] to jump to tag under cursor
"   " - Use g^] for ambiguous tags
"   " - Use ^t to jump back up the tag stack

"" Auto Complete
" HIGHLIGHTS:
" " - ^x^n for JUST this file
" " - ^x^f for filenames (works with our path trick!)
" " - ^x^] for tags only
" " - ^n for anything specified by the 'complete' option
"
" " NOW WE CAN:
" " - Use ^n and ^p to go back and forth in the suggestion list


