function! s:goyo_enter()
    colorscheme pencil
endfunction

function! s:goyo_leave()
    colorscheme badwolf
endfunction

autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()

let g:vim_markdown_frontmatter=1 " format YAML frontmatter
let g:vim_markdown_math=1 " LaTeX math
let g:enable_bold_font = 0 " for Material design theme

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

let g:indent_guides_guide_size = 1
let g:indent_guides_color_change_percent = 3
let g:indent_guides_enable_on_vim_startup = 1

let g:table_mode_corner="|"

set guifont=M+\ 1m\ light\ for\ Powerline:h13

set encoding=utf-8
" let g:indentLine_color_gui = '#01DFD7' " blue PICK
"let g:indentLine_color_gui = '#a9a9a9' " blue PICK
" let g:indentLine_char = ''
"let g:indentLine_char = " ︙"
"let g:indentLine_char=u"U+DFF0"

let g:lightline = {
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'fugitive', 'filename' ] ]
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
    return "⭤"
  else
    return ""
  endif
endfunction

function! MyFugitive()
  if exists("*fugitive#head")
    let _ = fugitive#head()
    return strlen(_) ? "⭠"." "._ : ''
  endif
  return ''
endfunction

function! MyFilename()
  return ('' != MyReadonly() ? MyReadonly() . ' ' : '') .
       \ ('' != expand('%:t') ? expand('%:t') : '[No Name]') .
       \ ('' != MyModified() ? ' ' . MyModified() : '')
endfunction

au VimEnter * hi Cursor guibg=#FF4500
au InsertLeave * hi Cursor guibg=#FF4500
au InsertEnter * hi Cursor guibg=green

set nocompatible                " be iMproved, required
filetype off                    " required - Vundle

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

"#########  Vundle plugins #########
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'
Plugin 'airblade/vim-gitgutter'
Plugin 'tomtom/tcomment_vim'
Plugin 'tpope/vim-surround'
Plugin 'scrooloose/nerdtree'
Plugin 'vim-pandoc/vim-criticmarkup'
Plugin 'mattly/vim-markdown-enhancements'
Plugin 'itchyny/lightline.vim'
Plugin 'blerins/flattown'
Plugin 'Valloric/YouCompleteMe'
Plugin 'sjl/badwolf'
Plugin 'majutsushi/tagbar'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'junegunn/goyo.vim'
Plugin 'junegunn/limelight.vim'
Plugin 'reedes/vim-colors-pencil'
Plugin 'dhruvasagar/vim-table-mode'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'easymotion/vim-easymotion'
Plugin 'Raimondi/delimitMate'

au BufRead,BufNewFile *.md set filetype=markdown    " this is to make markdown syn-hi work for .md

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

if exists(":Tabularize")
  nmap <Leader>a= :Tabularize /=<CR>
  vmap <Leader>a= :Tabularize /=<CR>
  nmap <Leader>a: :Tabularize /:\zs<CR>
  vmap <Leader>a: :Tabularize /:\zs<CR>
endi    

"##############################################################################                                                                         
" Easier split navigation                                                                                                                               
"##############################################################################                                                                         

" Use ctrl-[hjkl] to select the active split!
nmap <silent> <c-k> :wincmd k<CR>
nmap <silent> <c-j> :wincmd j<CR>
nmap <silent> <c-h> :wincmd h<CR>
nmap <silent> <c-l> :wincmd l<CR>

" colorscheme flattown
colorscheme badwolf

filetype indent on              " OPTIONAL This enables automatic indentation as you type.
set autoread                    " read changes to file that happen on disk
set gcr=a:blinkon0              " disable cursor blink
" set colorcolumn=85
set hidden                      " Makes vim not complain when there are hidden buffers

" search
set ignorecase		            " Ignore case in search
set incsearch                   " search as characters are entered
set hlsearch                    " Highlights all search matches at the same time

set linebreak
" set list
set listchars=tab:▸\ ,eol:¬,space:.     " this and the one above it show invisible chars

" folding settings
set foldenable                  " sets folding
set foldlevelstart=10           " open most folds by default
set foldmethod=indent           " fold based on indent
set foldnestmax=10              " deepest fold is 10 levels
nnoremap <space> za
" space open/closes folds

" set number      		        " Show line numbers
set relativenumber              " Show relative line numbers
set cursorline                  " highlight current line
set ruler
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

set visualbell	        	    " Errors are visual
set undofile                    " create a file that contains undo information
set wrap                        " The following two lines wrap lines without breaking the word
set wildmenu                    " file autocomplete will show up in menu

" keep vim's backup, swap, and undo files in those directories.
set backupdir=~/.vim/backup//
set directory=~/.vim/swap//
set undodir=~/.vim/undo//

" disable spell check for the following file types
"autocmd BufNewFile,BufRead *.py setlocal nospell
"autocmd BufNewFile,BufRead *.R setlocal nospell
"autocmd BufNewFile,BufRead *.vimrc setlocal nospell
"autocmd BufNewFile,BufRead *.vim setlocal nospell
"autocmd BufNewFile,BufRead *.c setlocal nospell
"autocmd BufNewFile,BufRead *.Rnw set ft=tex nospell
"autocmd BufNewFile,BufRead .profile setlocal nospell

let g:tex_flavor='latex'
let g:Tex_ViewRule_pdf = 'Preview'

" ^ + f will erase whitespace at end of line
map <C-f> :s/\s\+$//<CR>

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

map <leader>n :NERDTree<CR>

if &term=="xterm" || &term=="xterm-color"
    :imap <Esc>Oq 1
    :imap <Esc>Or 2
    :imap <Esc>Os 3
    :imap <Esc>Ot 4
    :imap <Esc>Ou 5
    :imap <Esc>Ov 6
    :imap <Esc>Ow 7
    :imap <Esc>Ox 8
    :imap <Esc>Oy 9
    :imap <Esc>Op 0
    :imap <Esc>On .
    :imap <Esc>OQ /
    :imap <Esc>OR *
    :imap <Esc>Ol +
    :imap <Esc>OS -
endif

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
" the following should allow me to use Ctrl-shift-P to inspect
" an element to find out which group it belongs to
" for coloring purposes
nmap <C-S-P> :call <SID>SynStack()<CR>
function! <SID>SynStack()
    if !exists("*synstack")
        return
    endif
    echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc

set guifont=M+\ 1m\ light\ for\ Powerline:h15

" FIX: PluginUpdate => git pull: git-sh-setup: No such file or directory in MacVim (OK in non-GUI version of Vim)
if has("gui_macvim")
    set shell=/bin/bash\ -l
endif

" this reloads .vimrc whenever it is saved
" I think...
augroup reload_vimrc
    autocmd!
    autocmd bufwritepost $MYVIMRC nested source $MYVIMRC
augroup END
