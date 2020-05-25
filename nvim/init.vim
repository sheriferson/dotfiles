" vim-plug
call plug#begin('~/.config/nvim/bundle/')

Plug 'godlygeek/tabular'
Plug 'tpope/vim-fugitive'
Plug 'vim-pandoc/vim-pandoc',
Plug 'vim-pandoc/vim-pandoc-syntax', { 'for': ['md', 'markdown', 'pandoc'] }
Plug 'airblade/vim-gitgutter'
Plug 'tomtom/tcomment_vim'
Plug 'tpope/vim-surround'
Plug 'scrooloose/nerdtree'
Plug 'itchyny/lightline.vim'
Plug 'junegunn/goyo.vim'
Plug 'dhruvasagar/vim-table-mode'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'easymotion/vim-easymotion'
Plug 'vim-pandoc/vim-criticmarkup'
Plug 'ChesleyTan/wordCount.vim'
Plug 'maverickg/stan.vim'
Plug 'dearrrfish/vim-applescript'
Plug 'ntpeters/vim-better-whitespace'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() } }
Plug 'ekalinin/Dockerfile.vim'
Plug 'dag/vim-fish', { 'for': 'fish' }
Plug 'sirver/UltiSnips'
Plug 'honza/vim-snippets'
Plug 'mattn/emmet-vim', { 'for': ['html', 'javascript'] }
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'thiagoalessio/rainbow_levels.vim'
Plug 'liuchengxu/vista.vim'
Plug 'chrisbra/Colorizer'
Plug 'liuchengxu/vim-clap', { 'do': ':Clap install-binary!' }
Plug 'ryanoasis/vim-devicons'
Plug 'goerz/jupytext.vim'
Plug 'rrethy/vim-hexokinase', { 'do': 'make hexokinase' }
" colorschemes
Plug 'blerins/flattown'
Plug 'sjl/badwolf'
Plug 'reedes/vim-colors-pencil'
Plug 'scwood/vim-hybrid'
Plug 'Haron-Prime/Antares'
Plug 'dracula/vim'
Plug 'NLKNguyen/papercolor-theme'
" javascript
Plug 'jelera/vim-javascript-syntax', { 'for': 'javascript' }
" R and Python
Plug 'jalvesaq/Nvim-R', { 'for': ['r', 'rmd'] }
Plug 'jalvesaq/vimcmdline', { 'for': 'python' }

call plug#end()


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
let g:gitgutter_sign_added = '⭘'
let g:gitgutter_sign_modified = '⭘'
let g:gitgutter_sign_removed = '⭘'
let g:gitgutter_sign_modified_removed = '⭘'

" ## vim-pandoc
let g:pandoc#folding#fdc = 0
let g:pandoc#spell#enabled = 0
let g:pandoc#syntax#codeblocks#embeds#langs = ['yaml', 'sh', 'html', 'sql', 'python', 'fish']

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
let cmdline_app['python'] = 'ipython'
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
    \             [ 'fugitive', 'filename', 'filetype' ],
    \             [ 'cocstatus' ] ],
    \   'right': [['wordcount'], ['lineinfo'] ]
    \ },
    \ 'component_function': {
    \   'cocstatus' : 'coc#status',
    \   'fugitive'  : 'MyFugitive',
    \   'readonly'  : 'MyReadonly',
    \   'filename'  : 'MyFilename',
    \   'filetype'  : 'MyFiletype',
    \   'modified'  : 'MyModified',
    \   'wordcount' : 'MyWordCount'
    \ }
    \ }

" vista
let g:vista#renderer#icons = {
\   "function": "\uf794",
\   "variable": "\uf71b",
\   "chapter" : "📖",
\  }

let g:vista_executive_for = {
      \ 'vimwiki': 'markdown',
      \ 'pandoc': 'markdown',
      \ 'markdown': 'toc',
      \ }

let g:vista_sidebar_width = 40

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
  if exists("*FugitiveHead")
    let _ = FugitiveHead()
    return strlen(_) ? ""." "._ : ''
  endif
  return ''
endfunction

function! MyFilename()
  return ('' != MyReadonly() ? MyReadonly() . ' ' : '') .
       \ ('' != expand('%:t') ? expand('%:t') : '[No Name]') .
       \ ('' != MyModified() ? ' ' . MyModified() : '')
endfunction

function! MyFiletype()
  return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype . WebDevIconsGetFileTypeSymbol() : 'no ft') . ' ' : ''
endfunction

function! MyWordCount()
    let _ = ['pandoc', 'text', 'md', 'markdown', 'markdown.pandoc']
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
autocmd FileType markdown,pandoc nnoremap <space> za

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
autocmd Filetype r,rmd,sql,html,pandoc setlocal tabstop=2 softtabstop=0 shiftwidth=2

set undofile                    " create a file that contains undo information
set wrap                        " The following two lines wrap lines without breaking the word
set wildmenu                    " file autocomplete will show up in menu
set wildmode=list:longest       " show list of all options and autocomplete to longest common string

" keep vim's backup, swap, and undo files in those directories.
set backupdir=~/.config/nvim/backup//
set directory=~/.config/nvim/swap//
set undodir=~/.config/nvim/undo//

" leader + f will erase whitespace at end of line
map <leader>w :s/\s\+$//<CR>

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
map <M-o> :Clap files<CR>

" 2013/12/2
" the following should allow me to use Ctrl-i to inspect
" an element to find out which group it belongs to
" for coloring purposes
nmap <C-x> :call <SID>SynStack()<CR>
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
set listchars=tab:▸\ ,eol:¬,space:·

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
    " Better split lines
    highlight VertSplit gui=None guibg=None guifg=#5F8787
    " Make the background nicer
    highlight Normal guibg=None
    highlight Folded guibg=None

    " change the highlight of the current line number to orange foreground
    highlight CursorLineNR guibg=None

    " fix more of the line number area
    highlight LineNR guibg=None

    " GitGutterChange isn't read from the colorscheme well
    " for some reason
    highlight GitGutterChange guifg=#ffa500 guibg=None

    " No background for NonText
    highlight NonText guibg=None

    " turn relativenumber off when in insert mode, back on when in normal mode
    " ref: https://jeffkreeftmeijer.com/vim-number/#hybrid-line-numbers
    augroup numbertoggle
      autocmd!
      autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
      autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
    augroup END

    set fcs=eob:\ 

    " Markdown/pandoc syntax highlighting improvements
    highlight conceal guibg=None
    highlight pandocAtxHeader guifg=#ff69b4
    highlight Pmenu guibg=#426370
endfunction

autocmd! ColorScheme PaperColor call s:patch_papercolor()

set termguicolors
colorscheme papercolor
set background=light

"  .ooooo.   .ooooo.   .ooooo.
" d88' `"Y8 d88' `88b d88' `"Y8
" 888       888   888 888
" 888   .o8 888   888 888   .o8
" `Y8bod8P' `Y8bod8P' `Y8bod8P'

" if hidden is not set, TextEdit might fail.
set hidden

" Some servers have issues with backup files, see #649
set nobackup
set nowritebackup

" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300

" don't give |ins-completion-menu| messages.
set shortmess+=c

" always show signcolumns
set signcolumn=yes

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
nmap <silent> {c <Plug>(coc-diagnostic-prev)
nmap <silent> }c <Plug>(coc-diagnostic-next)

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

" Use <tab> for select selections ranges, needs server support, like: coc-tsserver, coc-python
nmap <silent> <TAB> <Plug>(coc-range-select)
xmap <silent> <TAB> <Plug>(coc-range-select)
xmap <silent> <S-TAB> <Plug>(coc-range-select-backword)

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" use `:OR` for organize import of current buffer
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add status line support, for integration with other plugin, checkout `:h coc-status`
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Using CocList
" Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>

autocmd BufNew,BufEnter *.json,*.md execute "silent! CocDisable"
