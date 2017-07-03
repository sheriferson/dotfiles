function! s:goyo_enter()
    colorscheme pencil
endfunction

function! s:goyo_leave()
    colorscheme minimalist
endfunction

autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()

" settings for vim-pandoc
let g:pandoc#folding#fdc = 0
let g:pandoc#spell#enabled = 0

" emmet
let g:user_emmet_leader_key='<C-Z>'

" nvim-R
let R_assign_map = "--"
let R_min_editor_width = 80
let R_rconsole_width = 1000 " force the console to show up at the bottom
let R_show_args = 1
" Press the space bar to send lines and selection to R:
vmap <Space> <Plug>RDSendSelection
nmap <Space> <Plug>RDSendLine

" Neomake
let g:neomake_open_list = 2

let g:neomake_python_pylint_maker = {
    \ 'args': [
    \ '-d', 'C0103,C1801',
    \ '-f', 'text',
    \ '--msg-template="{path}:{line}:{column}:{C}: [{symbol}] {msg}"',
    \ '-r', 'n'
    \ ],
    \ 'errorformat':
    \ '%A%f:%l:%c:%t: %m,' .
    \ '%A%f:%l: %m,' .
    \ '%A%f:(%l): %m,' .
    \ '%-Z%p^%.%#,' .
    \ '%-G%.%#',
    \ }

let g:ycm_filetype_blacklist = {
    \ 'tagbar' : 1,
    \ 'qf' : 1,
    \ 'notes' : 1,
    \ 'markdown' : 1,
    \ 'unite' : 1,
    \ 'text' : 1,
    \ 'vimwiki' : 1,
    \ 'pandoc' : 1,
    \ 'infolog' : 1,
    \ 'mail' : 1,
    \ 'mkd.markdown' : 1,
    \ 'tex' : 1
    \}

let g:ycm_filetype_specific_completion_to_disable = {
    \ 'gitcommit': 1,
    \ 'markdown': 1,
    \ 'mkd.markdown' : 1,
    \ 'tex' : 1
    \}

" disable preview window by YouCompleteMe
set completeopt-=preview

let g:table_mode_corner="|"

let g:lightline = {
    \ 'colorscheme': 'wombat',
    \ 'active': {
    \   'left': [ [ 'mode', 'paste' ],
    \             [ 'fugitive', 'filename' ] ],
    \   'right': [ ['lineinfo'] ]
    \ },
    \ 'component_function': {
    \   'fugitive': 'MyFugitive',
    \   'readonly': 'MyReadonly',
    \   'filename': 'MyFilename',
    \   'modified': 'MyModified',
    \ }
    \ }

let g:lightline.mode_map = {
    \ 'n' : 'N',
    \ 'i' : 'I',
    \ 'R' : 'R',
    \ 'v' : 'V',
    \ 'V' : 'V',
    \ "\<C-v>": 'V',
    \ 's' : 'S',
    \ 'S' : 'S',
    \ "\<C-s>": 'S'
    \ }

function! MyModified()
  if &filetype == "help"
    return ""
  elseif &modified
    return "+"
  elseif &modifiable
    return ""
  else
    return ""
  endif
endfunction

function! MyReadonly()
  if &filetype == "help"
    return ""
  elseif &readonly
    return ""
  else
    return ""
  endif
endfunction

function! MyFugitive()
  if exists("*fugitive#head")
    let _ = fugitive#head()
    return strlen(_) ? ""." "._ : ''
  endif
  return ''
endfunction

function! MyFilename()
  return ('' != MyReadonly() ? MyReadonly() . ' ' : '') .
       \ ('' != expand('%:t') ? expand('%:t') : '[No Name]') .
       \ ('' != MyModified() ? ' ' . MyModified() : '')
endfunction

set nocompatible                " be iMproved, required
filetype off                    " required - Vundle

" set the runtime path to include Vundle and initialize
set shell=bash
set rtp+=~/.config/nvim/bundle/Vundle.vim
call vundle#begin('~/.config/nvim/bundle/')
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

"#########  Vundle plugins #########
Plugin 'godlygeek/tabular'
Plugin 'tpope/vim-fugitive'
Plugin 'vim-pandoc/vim-pandoc'
Plugin 'vim-pandoc/vim-pandoc-syntax'
Plugin 'airblade/vim-gitgutter'
Plugin 'tomtom/tcomment_vim'
Plugin 'tpope/vim-surround'
Plugin 'scrooloose/nerdtree'
Plugin 'itchyny/lightline.vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'majutsushi/tagbar'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'junegunn/goyo.vim'
Plugin 'junegunn/limelight.vim'
Plugin 'dhruvasagar/vim-table-mode'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'easymotion/vim-easymotion'
Plugin 'Raimondi/delimitMate'
Plugin 'JuliaEditorSupport/julia-vim'
" Plugin 'vim-pandoc/vim-criticmarkup'
" Plugin 'jimhester/lintr'
Plugin 'ntpeters/vim-better-whitespace'         " 2017-05-31
Plugin 'neomake/neomake'                        " 2017-06-11
Plugin 'christoomey/vim-tmux-navigator'         " 2017-06-12
" colorschemes
Plugin 'blerins/flattown'
Plugin 'sjl/badwolf'
Plugin 'reedes/vim-colors-pencil'
Plugin 'scwood/vim-hybrid'
Plugin 'Haron-Prime/Antares'
Plugin 'kudabux/vim-srcery-drk'
Plugin 'dikiaap/minimalist'
Plugin 'fneu/breezy'
" Plugin 'jscappini/material.vim'
" javascript
Plugin 'jelera/vim-javascript-syntax'           " general javscript syntax improvements
Plugin 'ternjs/tern_for_vim'                    " Tern-based JavaScript editing support.
" html
Plugin 'mattn/emmet-vim'
" R
Plugin 'jalvesaq/Nvim-R'
Plugin 'hkupty/iron.nvim'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
"######### end #########

syntax on            		    " syntax highlighting

" change the mapleader from \ to ,
let mapleader=","

nmap <leader>= :Tabularize /=<CR>
vmap <leader>= :Tabularize /=<CR>
nmap <leader>: :Tabularize /:\zs<CR>
vmap <leader>: :Tabularize /:\zs<CR>
nmap <leader>< :Tabularize /<-<CR>
vmap <leader>< :Tabularize /<-<CR>

" create new splits below and to the right, like god intended
set splitbelow
set splitright

" Copy to clipboard
" from: https://www.reddit.com/r/neovim/comments/3fricd/easiest_way_to_copy_from_neovim_to_system/
vnoremap <leader>y  "+y
nnoremap <leader>Y  "+yg_
nnoremap <leader>y  "+y
nnoremap <leader>yy  "+yy

" Paste from clipboard
nnoremap <leader>p "+p
nnoremap <leader>P "+P
vnoremap <leader>p "+p
vnoremap <leader>P "+P

colorscheme minimalist
set background=light

filetype indent on                      " OPTIONAL This enables automatic indentation as you type.
set autoread                            " read changes to file that happen on disk
set gcr=a:blinkon0                      " disable cursor blink

set hidden                              " Makes vim not complain when there are hidden buffers

" search
set ignorecase		                    " Ignore case in search
set incsearch                           " search as characters are entered
set hlsearch                            " Highlights all search matches at the same time

set linebreak

" folding settings
" set foldenable                  " sets folding
" set foldlevelstart=10           " open most folds by default
" set foldmethod=indent           " fold based on indent
" set foldnestmax=10              " deepest fold is 10 levels
" nnoremap <space> za
" space open/closes folds

" the next two in that order turn on hybrid line number;
set relativenumber              " Show relative line numbers
set number      		        " Show line numbers

" set cursorline                  " highlight current line
" set ruler
set scrolloff=8	    	        " Maintain 8 lines while scrolling
set nosmartindent		        " Automatically indent with curly bracket
set nospell                     " Spell check is off by default
set spelllang=en_us             " American dictionary
set shiftwidth=4
set showmatch                   " set show matching parentheses

" tabs
set expandtab                   " Convert tabs into spaces
set tabstop=4	            	" Specifies the number of spaces in a tab
set softtabstop=4               " when editing
set smarttab

" for R/SQL files, 2 spaces
autocmd Filetype sql setlocal ts=2 sw=2 expandtab
autocmd Filetype r setlocal ts=2 sw=2 expandtab

autocmd BufRead,BufNewFile *.md set filetype=markdown    " this is to make markdown syn-hi work for .md

set undofile                    " create a file that contains undo information
set wrap                        " The following two lines wrap lines without breaking the word
set wildmenu                    " file autocomplete will show up in menu

" keep vim's backup, swap, and undo files in those directories.
set backupdir=~/.config/nvim/backup//
set directory=~/.config/nvim/swap//
set undodir=~/.config/nvim/undo//

let g:tex_flavor='latex'
let g:Tex_ViewRule_pdf = 'Preview'

" leader + f will erase whitespace at end of line
map <leader>f :s/\s\+$//<CR>

"This unsets the 'last search pattern' register by hitting return
nnoremap <CR> :noh<CR><CR>
" move around lines visually
nnoremap j gj
nnoremap k gk

" not have to press shift before colon to type commands
nnoremap ; :

" Quickly edit/reload the vimrc file
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>

map <C-c> :NERDTreeToggle<CR>

" statusline
" cf the default statusline: %<%f\ %h%m%r%=%-14.(%l,%c%V%)\ %P
" format markers:
"   %< truncation point
"   %n buffer number
"   %f relative path to file
"   %m modified flag [+] (modified), [-] (unmodifiable) or nothing
"   %r readonly flag [RO]
"   %y filetype [ruby]
"   %= split point for left and right justification
"   %-35. width specification
"   %l current line number
"   %L number of lines in buffer
"   %c current column number
"   %V current virtual column number (-n), if different from %c
"   %P percentage through buffer
"   %) end of width specification
set laststatus=2
" the if statement below seems to fix lightline breaking
" after sourcing .vimrc with an open file
" https://github.com/itchyny/lightline.vim/issues/8#issuecomment-23322423
if &statusline ==# ''
    set statusline=%<\ %n:%f\ %r%y%m%=%-35.(line:\ %l\ of\ %L,\ col:\ %c%V\ (%P)%)
endif
"hi StatusLine term=reverse ctermfg=11 ctermbg=232 gui=bold,reverse

" 2013/12/2
" the following should allow me to use Ctrl-J to inspect
" an element to find out which group it belongs to
" for coloring purposes
nmap <C-J> :call <SID>SynStack()<CR>
function! <SID>SynStack()
    if !exists("*synstack")
        return
    endif
    echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc

" nvim-R -> remapping tab to C-x C-o
" placed here to happen after Youcompleteme loads because it rewrites tab
" remapping
autocmd FileType r inoremap <buffer> <tab> <C-x><C-o>

" set coneal chars with black bg and red fg
" this has to happen at the end, since something in the middle
" probably a colorscheme overrides it
highlight ColorColumn ctermbg=23 guibg=14
autocmd FileType python set colorcolumn=80

highlight conceal ctermbg=black ctermfg=9

autocmd! BufWritePost,BufEnter * Neomake

:tnoremap <Esc> <C-\><C-n>

:tnoremap <A-h> <C-\><C-N><C-w>h
:tnoremap <A-j> <C-\><C-N><C-w>j
:tnoremap <A-k> <C-\><C-N><C-w>k
:tnoremap <A-l> <C-\><C-N><C-w>l
:inoremap <A-h> <C-\><C-N><C-w>h
:inoremap <A-j> <C-\><C-N><C-w>j
:inoremap <A-k> <C-\><C-N><C-w>k
:inoremap <A-l> <C-\><C-N><C-w>l
:nnoremap <A-h> <C-w>h
:nnoremap <A-j> <C-w>j
:nnoremap <A-k> <C-w>k
:nnoremap <A-l> <C-w>l

augroup ironmapping
    autocmd!
    autocmd Filetype python nmap <buffer> <Space> <Plug>(iron-send-motion)
    autocmd Filetype python vmap <buffer> <leader>t <Plug>(iron-send-motion)
    autocmd Filetype python nmap <buffer> <leader>p <Plug>(iron-repeat-cmd)
augroup END
