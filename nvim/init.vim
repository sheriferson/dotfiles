"######### Vundle start #########
set nocompatible                " be iMproved, required
filetype off                    " required - Vundle

" set the runtime path to include Vundle and initialize
set shell=bash
set rtp+=~/.config/nvim/bundle/Vundle.vim
call vundle#begin('~/.config/nvim/bundle/')

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
Plugin 'junegunn/goyo.vim'
Plugin 'dhruvasagar/vim-table-mode'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'easymotion/vim-easymotion'
Plugin 'vim-pandoc/vim-criticmarkup'
Plugin 'ChesleyTan/wordCount.vim'
Plugin 'maverickg/stan.vim'
Plugin 'dearrrfish/vim-applescript'
Plugin 'ntpeters/vim-better-whitespace'
Plugin 'iamcco/mathjax-support-for-mkdp'
Plugin 'iamcco/markdown-preview.vim'
Plugin 'ekalinin/Dockerfile.vim'
Plugin 'dag/vim-fish'
Plugin 'sirver/UltiSnips'
Plugin 'honza/vim-snippets'
Plugin 'mattn/emmet-vim'
Plugin 'neoclide/coc.nvim'
Plugin 'thiagoalessio/rainbow_levels.vim'
Plugin 'mengelbrecht/lightline-bufferline'
" colorschemes
Plugin 'blerins/flattown'
Plugin 'sjl/badwolf'
Plugin 'reedes/vim-colors-pencil'
Plugin 'scwood/vim-hybrid'
Plugin 'Haron-Prime/Antares'
Plugin 'dracula/vim'
Plugin 'NLKNguyen/papercolor-theme'
" javascript
Plugin 'jelera/vim-javascript-syntax'           " general javscript syntax improvements
" R and Python
Plugin 'jalvesaq/Nvim-R'
Plugin 'jalvesaq/vimcmdline'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

"######### Vundle end #########

"######### Goyo functions #########

function! s:goyo_enter()
    autocmd! numbertoggle
    set norelativenumber
    set nonumber
endfunction

function! s:goyo_leave()
    set relativenumber
    set number

    " need to get things back to normal as much as possible
    " maybe one day I will find a way to re-enable these
    " settings in a nice seamless way without rewriting code
    " if you're reading this and have a better way, please tell me!
    " hi@sherifsoliman.com
    highlight Pmenu ctermfg=15 ctermbg=30 guifg=#ffffff guibg=#000000
endfunction

autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()

"######### Various plugin settings #########

" ## gitgutter
" use • instead of +/-
" https://github.com/statico/dotfiles/blob/master/.vim/vimrc
let g:gitgutter_sign_added = '●'
let g:gitgutter_sign_modified = '●'
let g:gitgutter_sign_removed = '●'
let g:gitgutter_sign_modified_removed = '●'

" ## vim-pandoc
let g:pandoc#folding#fdc = 0
let g:pandoc#spell#enabled = 0

" ## markdown preview
let vim_markdown_preview_pandoc = 1
let vim_markdown_preview_hotkey = '<C-M>'

" ## nvim-R
let g:R_app = 'radian'
let g:R_cmd = 'R'
let g:R_hl_term = 0
let R_bracketed_paste = 1
let R_assign_map = "--"                  " -- to insert <-
let R_min_editor_width = 100
let R_rconsole_width = 1000              " make sure the console is at the bottom by making it really wide
let R_show_args = 0                      " do not show the preview window with function explanation
let R_objbr_opendf = 0                   " Don't expand a dataframe to show columns by default
let R_auto_scroll = 1                    " Scroll to end of output in console
" press space bar to send lines to cnosole
vmap <Space> <Plug>RDSendSelection
nmap <Space> <Plug>RDSendLine

" ## vimcmdline
let cmdline_app = {}
let cmdline_app['python'] = 'bpython'
let cmdline_term_height = 20 " Initial height of interpreter window or pane

" ## Ultisnips
let g:UltiSnipsExpandTrigger="<c-a>"
let g:UltiSnipsJumpForwardTrigger="<c-n>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
let g:UltiSnipsSnippetDirectories=[$HOME.'/.config/UltiSnips']

" ## vim-table-mode
let g:table_mode_corner="|"

" ## Ctrl-P
let g:ctrlp_open_multiple_files = 'v'

" ## lightline and lightline-bufferline
let g:lightline = {
    \ 'colorscheme': 'PaperColor',
    \ 'active': {
    \   'left': [ [ 'mode', 'paste' ],
    \             [ 'fugitive', 'filename' ],
    \             [ 'cocstatus' ] ],
    \   'right': [['wordcount'], ['lineinfo'] ]
    \ },
    \ 'component_function': {
    \   'cocstatus': 'coc#status',
    \   'fugitive': 'MyFugitive',
    \   'readonly': 'MyReadonly',
    \   'filename': 'MyFilename',
    \   'modified': 'MyModified',
    \   'wordcount': 'MyWordCount'
    \ }
    \ }

" lightline-bufferline setup
let g:lightline#bufferline#show_number = 2
let g:lightline#bufferline#unicode_symbols = 1
let g:lightline#bufferline#shorten_path = 0
let g:lightline.tabline          = {'left': [['buffers']], 'right': [[]]}
let g:lightline.component_expand = {'buffers': 'lightline#bufferline#buffers'}
let g:lightline.component_type   = {'buffers': 'tabsel'}

let g:lightline#bufferline#number_map = {
\ 0: '⁰', 1: '¹', 2: '²', 3: '³', 4: '⁴',
\ 5: '⁵', 6: '⁶', 7: '⁷', 8: '⁸', 9: '⁹'}

nmap <Leader>1 <Plug>lightline#bufferline#go(1)
nmap <Leader>2 <Plug>lightline#bufferline#go(2)
nmap <Leader>3 <Plug>lightline#bufferline#go(3)
nmap <Leader>4 <Plug>lightline#bufferline#go(4)
nmap <Leader>5 <Plug>lightline#bufferline#go(5)
nmap <Leader>6 <Plug>lightline#bufferline#go(6)
nmap <Leader>7 <Plug>lightline#bufferline#go(7)
nmap <Leader>8 <Plug>lightline#bufferline#go(8)
nmap <Leader>9 <Plug>lightline#bufferline#go(9)
nmap <Leader>0 <Plug>lightline#bufferline#go(10)

set showtabline=2

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


"######### Various vim settings #########

syntax on            		    " syntax highlighting

" change the mapleader from \ to ,
let mapleader=","

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

filetype indent on                      " OPTIONAL This enables automatic indentation as you type.
set autoread                            " read changes to file that happen on disk
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
autocmd FileType markdown nnoremap <space> za

" the next two in that order turn on hybrid line number;
set relativenumber              " Show relative line numbers
set number      		        " Show line numbers

set scrolloff=8	    	        " Maintain 8 lines while scrolling
set nosmartindent		        " Automatically indent with curly bracket
set nospell                     " Spell check is off by default
set spelllang=en_us             " American dictionary
set showmatch                   " set show matching parentheses
set inccommand=nosplit

" tabs
set expandtab                   " Convert tabs into spaces
set tabstop=4	            	" Specifies the number of spaces in a tab
set softtabstop=4               " when editing
set shiftwidth=4
set smarttab

" for R/SQL files, 2 spaces
autocmd Filetype sql setlocal tabstop=2 softtabstop=0 shiftwidth=2
autocmd Filetype r,rmd setlocal tabstop=2 softtabstop=0 shiftwidth=2

autocmd BufRead,BufNewFile *.md set filetype=markdown    " this is to make markdown syn-hi work for .md

set undofile                    " create a file that contains undo information
set wrap                        " The following two lines wrap lines without breaking the word
set wildmenu                    " file autocomplete will show up in menu
set wildmode=list:longest       " show list of all options and autocomplete to longest common string

" keep vim's backup, swap, and undo files in those directories.
set backupdir=~/.config/nvim/backup//
set directory=~/.config/nvim/swap//
set undodir=~/.config/nvim/undo//

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

map <C-c> :NERDTreeToggle<CR>

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

" set a colorcolumn for python
highlight ColorColumn ctermbg=172 guibg=14
autocmd FileType python set colorcolumn=100

" change color of tilde from white to something darker, and remove pipe
" separator
set fillchars+=vert:\ 

" Be able to escape to Normal mode in Terminal
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


" from jvns
" https://github.com/jvns/vimconfig/blob/master/vimrc
" Return to last edit position when opening files<Paste>
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

function! s:patch_papercolor()
    " Make the background nicer
    highlight Normal guibg=None
    highlight Folded guibg=None

    " change the highlight of the current line number to orange foreground
    highlight CursorLineNR guifg=#a500ff guibg=None

    " GitGutterChange isn't read from the colorscheme well
    " for some reason
    highlight GitGutterChange guifg=#ffa500 guibg=None

    " turn relativenumber off when in insert mode, back on when in normal mode
    " ref: https://jeffkreeftmeijer.com/vim-number/#hybrid-line-numbers
    augroup numbertoggle
      autocmd!
      autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
      autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
    augroup END

    set fcs=eob:\ 
endfunction

autocmd! ColorScheme PaperColor call s:patch_papercolor()

set termguicolors
colorscheme papercolor
set background=light

" coc settings

set nobackup
set nowritebackup

" Smaller updatetime for CursorHold & CursorHoldI
set updatetime=300

" don't give |ins-completion-menu| messages.
set shortmess+=c

" always show signcolumns
set signcolumn=yes

"  .ooooo.   .ooooo.   .ooooo.
" d88' `"Y8 d88' `88b d88' `"Y8
" 888       888   888 888
" 888   .o8 888   888 888   .o8
" `Y8bod8P' `Y8bod8P' `Y8bod8P'

set pyxversion=3
set signcolumn=auto:2 " so we can see the signs of messages in addition to git signs

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" Use `[c` and `]c` to navigate diagnostics
nmap <silent> [c <Plug>(coc-diagnostic-prev)
nmap <silent> ]c <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Remap for format selected region
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

autocmd BufNew,BufEnter *.py,*.vim, execute "silent! CocEnable"
autocmd BufNew,BufEnter *.md,*.markdown,*.txt, execute "silent! CocDisable"
