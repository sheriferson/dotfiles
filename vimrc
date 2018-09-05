function! s:goyo_enter()
    silent !tmux set status off
    autocmd! numbertoggle
    set norelativenumber
    set nonumber

    highlight conceal ctermbg=None ctermfg=141
    highlight EndOfBuffer ctermbg=None ctermfg=235
endfunction

function! s:goyo_leave()
    silent !tmux set status on
    set relativenumber
    set number

    " need to get things back to normal as much as possible
    " maybe one day I will find a way to re-enable these
    " settings in a nice seamless way without rewriting code
    " if you're reading this and have a better way, please tell me!
    " hi@sherifsoliman.com
    augroup numbertoggle
      autocmd!
      autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
      autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
    augroup END

    highlight conceal ctermbg=None ctermfg=141
    highlight Pmenu ctermfg=15 ctermbg=30 guifg=#ffffff guibg=#000000
    highlight CursorLineNR ctermfg=172 ctermbg=None
    highlight Normal ctermbg=None
    highlight Folded ctermbg=None
endfunction

autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()

" GitGutter styling to use • instead of +/-
" https://github.com/statico/dotfiles/blob/master/.vim/vimrc
let g:gitgutter_sign_added = '•'
let g:gitgutter_sign_modified = '•'
let g:gitgutter_sign_removed = '•'
let g:gitgutter_sign_modified_removed = '•'

" settings for vim-pandoc
let g:pandoc#folding#fdc = 0
let g:pandoc#spell#enabled = 0

" emmet
let g:user_emmet_leader_key = '<C-Z>'

" Quickly fix spelling errors choosing the first result
nmap <Leader>z z=1<CR><CR>

" markdown preview
let vim_markdown_preview_pandoc = 1
let vim_markdown_preview_hotkey = '<C-M>'

" nvim-R
" use rtichoke
let g:R_app = 'rtichoke'
let g:R_cmd = 'R'
let g:R_hl_term = 0
let R_bracketed_paste = 1

" press -- to have Nvim-R insert the assignment operator: <-
let R_assign_map = "--"

" set a minimum source editor width
let R_min_editor_width = 100

" make sure the console is at the bottom by making it really wide
let R_rconsole_width = 1000

" show arguments for functions during omnicompletion
let R_show_args = 1

" Don't expand a dataframe to show columns by default
let R_objbr_opendf = 0

" Scroll to end of output in console
let R_auto_scroll = 1

" Press the space bar to send lines and selection to R console
vmap <Space> <Plug>RDSendSelection
nmap <Space> <Plug>RDSendLine

" Neomake
let g:neomake_open_list = 2
let g:neomake_python_python_exe = 'python3'
let g:neomake_python_makers = ['python3', 'pylint']

" vimcmdline
let cmdline_app = {}
let cmdline_app['python'] = 'bpython'
let cmdline_term_height = 20 " Initial height of interpreter window or pane

" VimToDo
let g:VimTodoListsMoveItems = 0

" for pylint: disable:
" - invalid name
" - len(sequence) warning usage
" - unnecessary parentheses after return keyword
let g:neomake_python_pylint_maker = {
    \ 'args': [
    \ '-d', 'invalid-name, len-as-condition, superfluous-parens, unidiomatic-typecheck',
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

let g:neomake_r_lintr_maker = {
    \ 'exe': 'Rscript',
    \ 'args': ['-e', 'lintr::lint("%:p", linters = lintr::with_defaults(single_quotes_linter = NULL, object_name_linter = NULL))'],
    \ 'errorformat':
        \ '%W%f:%l:%c: style: %m,' .
        \ '%W%f:%l:%c: warning: %m,' .
        \ '%E%f:%l:%c: error: %m,'
    \ }

let g:neomake_r_enabled_makers = ['lintr']
let g:neomake_remove_invalid_entries = 1

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
" Remove tab from list of keys that cycle through options
" to allow using tab to generate autocomplete list
let g:ycm_key_list_select_completion = ['<Down>']

let g:table_mode_corner="|"

let g:lightline = {
    \ 'colorscheme': 'OldHope',
    \ 'active': {
    \   'left': [ [ 'mode', 'paste' ],
    \             [ 'fugitive', 'filename' ] ],
    \   'right': [['wordcount'], ['lineinfo'] ]
    \ },
    \ 'component_function': {
    \   'fugitive': 'MyFugitive',
    \   'readonly': 'MyReadonly',
    \   'filename': 'MyFilename',
    \   'modified': 'MyModified',
    \   'wordcount': 'MyWordCount'
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

function! MyWordCount()
    let _ = ['pandoc', 'text', 'md', 'markdown']
    if index(_, &filetype) == -1
        return ""
    else
        return wordCount#WordCount()
    endif
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
Plugin 'dhruvasagar/vim-table-mode'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'easymotion/vim-easymotion'
Plugin 'Raimondi/delimitMate'
Plugin 'JuliaEditorSupport/julia-vim'
Plugin 'vim-pandoc/vim-criticmarkup'
Plugin 'ChesleyTan/wordCount.vim'
Plugin 'maverickg/stan.vim'
Plugin 'dearrrfish/vim-applescript'
Plugin 'tpope/vim-dadbod'
Plugin 'tpope/vim-dotenv'
" Plugin 'jimhester/lintr'
Plugin 'ntpeters/vim-better-whitespace'         " 2017-05-31
Plugin 'neomake/neomake'                        " 2017-06-11
Plugin 'christoomey/vim-tmux-navigator'         " 2017-06-12
Plugin 'iamcco/mathjax-support-for-mkdp'        " 2018-01-26
Plugin 'iamcco/markdown-preview.vim'            " 2018-01-26
Plugin 'ekalinin/Dockerfile.vim'                " 2018-07-19
Plugin 'dag/vim-fish'                           " 2018-08-09
Plugin 'aserebryakov/vim-todo-lists'            " 2018-08-28
" colorschemes
Plugin 'blerins/flattown'
Plugin 'sjl/badwolf'
Plugin 'reedes/vim-colors-pencil'
Plugin 'scwood/vim-hybrid'
Plugin 'Haron-Prime/Antares'
Plugin 'kudabux/vim-srcery-drk'
Plugin 'dikiaap/minimalist'
Plugin 'fneu/breezy'
Plugin 'fugalh/desert.vim'
Plugin 'dracula/vim'
" javascript
Plugin 'jelera/vim-javascript-syntax'           " general javscript syntax improvements
Plugin 'ternjs/tern_for_vim'                    " Tern-based JavaScript editing support.
" html
Plugin 'mattn/emmet-vim'
" R and Python
Plugin 'jalvesaq/Nvim-R'
Plugin 'jalvesaq/vimcmdline'

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

colorscheme dracula

" some overrides
" highlight Normal ctermbg=16
" highlight LineNr ctermbg=16

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
set foldenable                          " sets folding
set foldlevelstart=2                    " open most folds by default
set foldmethod=syntax                   " fold based on indent
" space open/closes folds
autocmd FileType markdown nnoremap <space> za

" the next two in that order turn on hybrid line number;
set relativenumber              " Show relative line numbers
set number      		        " Show line numbers

" set cursorline                " highlight current line
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
set wildmode=list:longest       " show list of all options and autocomplete to longest common string

" keep vim's backup, swap, and undo files in those directories.
set backupdir=~/.config/nvim/backup//
set directory=~/.config/nvim/swap//
set undodir=~/.config/nvim/undo//

let g:tex_flavor = 'latex'
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

" use space for folds
autocmd FileType md nnoremap <space> za
autocmd FileType md vnoremap <space> zf

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
" the following should allow me to use Ctrl-i to inspect
" an element to find out which group it belongs to
" for coloring purposes
nmap <C-i> :call <SID>SynStack()<CR>
function! <SID>SynStack()
    if !exists("*synstack")
        return
    endif
    echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc

" remap tab to C-x C-o for autocompletion
" placed here to happen after Youcompleteme loads because it rewrites tab
" remapping
autocmd FileType python,r,rmd inoremap <tab> <C-x><C-o>

" set a colorcolumn for python
highlight ColorColumn ctermbg=23 guibg=14
autocmd FileType python set colorcolumn=100

" set coneal highlights
" this has to happen at the end, since something in the middle
" probably a colorscheme overrides it
highlight conceal ctermbg=None ctermfg=141

" change the highlight colors for YouCompleteMe autocompletion overlay
highlight Pmenu ctermfg=15 ctermbg=30 guifg=#ffffff guibg=#000000

" change the highlight of the current line number to orange foreground
highlight CursorLineNR ctermfg=172 ctermbg=None

" change color of tilde from white to something darker, and remove pipe
" separator
set fillchars+=vert:\ 
highlight NonText ctermfg=60 ctermbg=None

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
    autocmd Filetype python nmap <buffer> <Space> 0ctr$
    autocmd Filetype python vmap <buffer> <leader>t <Plug>(iron-send-motion)
    autocmd Filetype python nmap <buffer> <leader>p <Plug>(iron-repeat-cmd)
augroup END

" turn relativenumber off when in insert mode, back on when in normal mode
" ref: https://jeffkreeftmeijer.com/vim-number/#hybrid-line-numbers
augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
augroup END

highlight Normal ctermbg=None
highlight Folded ctermbg=None
