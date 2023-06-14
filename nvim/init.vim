call plug#begin('~/.config/nvim/bundle/')

Plug 'godlygeek/tabular'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'vim-pandoc/vim-pandoc',
Plug 'vim-pandoc/vim-pandoc-syntax', { 'for': ['md', 'markdown', 'pandoc'] }
Plug 'sheriferson/vim-criticmarkup'
Plug 'dhruvasagar/vim-table-mode'
Plug 'tomtom/tcomment_vim'
Plug 'nvim-tree/nvim-tree.lua'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'easymotion/vim-easymotion'
Plug 'ntpeters/vim-better-whitespace'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() } }
Plug 'dag/vim-fish', { 'for': 'fish' }
Plug 'lukas-reineke/indent-blankline.nvim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'fladson/vim-kitty'
Plug 'rcarriga/nvim-notify'
Plug 'lervag/vimtex'

Plug 'folke/lsp-colors.nvim'
Plug 'folke/trouble.nvim'
Plug 'hrsh7th/nvim-compe'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'onsails/lspkind-nvim'

Plug 'folke/noice.nvim'
Plug 'MunifTanjim/nui.nvim'

Plug 'liuchengxu/vista.vim'
Plug 'liuchengxu/vim-clap', { 'do': ':Clap install-binary!' }
Plug 'ryanoasis/vim-devicons'
Plug 'rrethy/vim-hexokinase', { 'do': 'make hexokinase' }
Plug 'akinsho/nvim-bufferline.lua'
Plug 'karb94/neoscroll.nvim'

Plug 'sonph/onehalf', { 'rtp': 'vim' }

Plug 'jelera/vim-javascript-syntax', { 'for': 'javascript' }
Plug 'jalvesaq/Nvim-R', { 'for': ['r', 'rmd'] }
Plug 'jalvesaq/vimcmdline', { 'for': 'python' }

call plug#end()


" # gitgutter
let g:gitgutter_sign_added = '•'
let g:gitgutter_sign_modified = '•'
let g:gitgutter_sign_removed = '•'
let g:gitgutter_sign_modified_removed = '•'

" # vim-pandoc
let g:pandoc#folding#fdc = 0
let g:pandoc#spell#enabled = 0
let g:pandoc#syntax#codeblocks#embeds#langs = ['yaml', 'sh', 'html', 'sql', 'python', 'fish']

" vimtex
let g:vimtex_complete_enabled = 1

" # nvim-R
let g:R_app = 'radian'
let g:R_cmd = 'R'
let g:R_hl_term = 0
let R_bracketed_paste = 1
let R_assign_map = "--"                  " -- to insert <-
let R_min_editor_width = 100
let R_rconsole_width = 1000              " make sure the console is at the bottom by making it really wide
let R_objbr_opendf = 0                   " Don't expand a dataframe to show columns by default
let R_auto_scroll = 1                    " Scroll to end of output in console
" press space bar to send lines to cnosole
vmap <Space> <Plug>RDSendSelection
nmap <Space> <Plug>RDSendLine

" # vimcmdline
let cmdline_app = {}
let cmdline_app['python'] = 'ipython'
let cmdline_term_height = 20

" # vim-table-mode
let g:table_mode_corner="|"

" # Ctrl-P
let g:ctrlp_open_multiple_files = 'v'
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git'

let g:vista_sidebar_width = 50

" indent_blankline
let g:indent_blankline_char = '│'
let g:indent_blankline_use_treesitter = v:true
let g:indent_blankline_show_current_context = v:true
let g:indent_blankline_space_char_blankline = ' '
let g:indent_blankline_space_char = ' '
let g:indent_blankline_filetype = ['python']
let g:indent_blankline_context_patterns = ['class', 'function', 'method', '^if', '^while', '^for']


"######### Various vim settings #########

syntax on
nnoremap ; :
let mapleader=","  " change from \
set splitbelow  " new splits below and to the right, like god intended
set splitright

" Copy to clipboard
" from: https://www.reddit.com/r/neovim/comments/3fricd/easiest_way_to_copy_from_neovim_to_system/
vnoremap <leader>y  "+y
nnoremap <leader>Y  "+yg_
nnoremap <leader>y  "+y
nnoremap <leader>yy  "+yy

filetype plugin indent on                                   " enables automatic indentation as you type
set autoread                                         " read changes to file that happen on disk
set hidden                                           " Makes vim not complain when there are hidden buffers
                                                     " search
set ignorecase                                       " Ignore case in search
set incsearch                                        " search as characters are entered
set hlsearch                                         " Highlights all search matches at the same time

set linebreak

set foldenable                                       " sets folding
set foldlevelstart=2                                 " open most folds by default
set foldmethod=syntax                                " fold based on indent
autocmd FileType markdown,pandoc nnoremap <space> za
" use space for folds
autocmd FileType md nnoremap <space> za
autocmd FileType md vnoremap <space> zf

set relativenumber                                   " Show relative line numbers
set number                                           " Show line numbers

set scrolloff=8                                      " Maintain 8 lines while scrolling
set nosmartindent                                    " Automatically indent with curly bracket
set nospell                                          " Spell check is off by default
set spelllang=en_us                                  " American dictionary
set showmatch                                        " set show matching parentheses
set inccommand=nosplit
set laststatus=1
                                                     " tabs
set expandtab                                        " Convert tabs into spaces
set tabstop=4                                        " Specifies the number of spaces in a tab
set softtabstop=4                                    " when editing
set shiftwidth=4
set smarttab

set undofile                                         " create a file that contains undo information
set wrap                                             " The following two lines wrap lines without breaking the word
set wildmenu                                         " file autocomplete will show up in menu
set wildmode=list:longest                            " show list of all options and autocomplete to longest common string

" for R/SQL files, 2 spaces
autocmd Filetype r,rmd,sql,html,htmldjango,scss,css,pandoc,tex setlocal tabstop=2 softtabstop=0 shiftwidth=2

" keep vim's backup, swap, and undo files in those directories.
set backupdir=~/.config/nvim/backup/
set directory=~/.config/nvim/swap/
set undodir=~/.config/nvim/undo//

" leader + f will erase whitespace at end of line
map <leader>w :s/\s\+$//<CR>
let g:better_whitespace_guicolor='None'

" unsets the 'last search pattern' register by hitting return
nnoremap <CR> :noh<CR><CR>
" move around lines visually
nnoremap j gj
nnoremap k gk

map <C-c> :NvimTreeToggle<CR>
map <M-o> :Clap files<CR>

nmap <leader>t i<C-R>=strftime("%Y-%m-%dT%H:%M:%S%z")<CR><Esc>

" telescope.nvim Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>

" bufferline config here because it's related
nnoremap <silent> gb :BufferLinePick<CR>

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

" from jvns
" https://github.com/jvns/vimconfig/blob/master/vimrc
" Return to last edit position when opening files<Paste>
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

function! s:patch_theme()
    highlight VertSplit gui=None guibg=None guifg=#5F8787
    highlight Normal guibg=None
    highlight Folded guibg=None
    highlight NonText guibg=None
    highlight CursorLineNR guibg=None
    highlight LineNR guibg=None
    highlight SignColumn guibg=None

    highlight StatusLine guibg=#e5c07b guifg=black cterm=bold
    highlight StatusLineNC guibg=#e5c07b guifg=black cterm=bold

    " don't make comments italic, because I want to see PragmataPro's [TODO] ligature
    highlight Comment gui=None
    highlight Todo guifg=#a0a1a7

    " GitGutter
    highlight GitGutterAdd guibg=None
    highlight GitGutterChange guibg=None
    highlight GitGutterDelete guibg=None
    highlight GitGutterChangeDelete guibg=None

    " Markdown/pandoc syntax highlighting improvements
    highlight conceal guibg=None
    highlight pandocAtxHeader guifg=#ff69b4
    highlight Pmenu guifg=#426370 guibg=#dcffed

    highlight GitGutterChange guifg=#ffa500 guibg=None

    " CriticMarkup
    highlight criticHighlight guibg=#F2C136
    highlight criticComment guibg=#AFCEDB
    highlight criticMeta guibg=#AFCEDB

    " turn relativenumber off when in insert mode, back on when in normal mode
    " ref: https://jeffkreeftmeijer.com/vim-number/#hybrid-line-numbers
    augroup numbertoggle
      autocmd!
      autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
      autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
    augroup END

    set fcs=eob:\ 

endfunction

autocmd! ColorScheme onehalflight call s:patch_theme()

set termguicolors
colorscheme onehalflight

" lsp diagnostics
sign define LspDiagnosticsSignError text= texthl=LspDiagnosticsSignError linehl= numhl=
sign define LspDiagnosticsSignWarning text= texthl=LspDiagnosticsSignWarning linehl= numhl=
sign define LspDiagnosticsSignInformation text= texthl=LspDiagnosticsSignInformation linehl= numhl=
sign define LspDiagnosticsSignHint text= texthl=LspDiagnosticsSignHint linehl= numhl=

lua << EOF
require'lspconfig'.jedi_language_server.setup{}
require'lspconfig'.pylsp.setup{}
require'lspconfig'.texlab.setup{}
require'lspkind'.init({})
require'lspconfig'.tsserver.setup{}
require'notify'.setup({
  background_colour = "#000000",
})

vim.notify = require("notify")
require("telescope").load_extension("notify")

require("trouble").setup {
    auto_close = true, -- automatically close the list when you have no diagnostics
}

require'bufferline'.setup {
    options = {
        show_buffer_close_icons = false,
        max_name_length = 40
    },
    highlights = {
        fill = {
            guifg = 'black',
            guibg = '#b2b2b2'
        }
    }
}

vim.o.completeopt = "menuone,noselect"

require'compe'.setup {
  enabled = true;
  autocomplete = true;
  debug = false;
  min_length = 1;
  preselect = 'enable';
  throttle_time = 80;
  source_timeout = 200;
  incomplete_delay = 400;
  max_abbr_width = 100;
  max_kind_width = 100;
  max_menu_width = 100;
  documentation = true;

  source = {
    path = true;
    nvim_lsp = true;
  };
}

local t = function(str)
  return vim.api.nvim_replace_termcodes(str, true, true, true)
end

local check_back_space = function()
    local col = vim.fn.col('.') - 1
    if col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') then
        return true
    else
        return false
    end
end

-- Use (s-)tab to:
--- move to prev/next item in completion menuone
--- jump to prev/next snippet's placeholder
_G.tab_complete = function()
  if vim.fn.pumvisible() == 1 then
    return t "<C-n>"
  elseif check_back_space() then
    return t "<Tab>"
  else
    return vim.fn['compe#complete']()
  end
end
_G.s_tab_complete = function()
  if vim.fn.pumvisible() == 1 then
    return t "<C-p>"
  else
    return t "<S-Tab>"
  end
end

vim.api.nvim_set_keymap("i", "<Tab>", "v:lua.tab_complete()", {expr = true})
vim.api.nvim_set_keymap("s", "<Tab>", "v:lua.tab_complete()", {expr = true})
vim.api.nvim_set_keymap("i", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})
vim.api.nvim_set_keymap("s", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})

require'nvim-treesitter.configs'.setup {
  ensure_installed = "all", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  ignore_install = {'php', 'phpdoc', 'tex', 'latex'},
  highlight = {
    enable = true,              -- false will disable the whole extension
    disable = { "c", "rust", "latex", "tex" },  -- list of language that will be disabled
  },
  indent = {
    enable = true
  }
}

require('telescope').setup{
    set_env = { ['COLORTERM'] = 'truecolor' }
}

require('nvim-tree').setup{}
require("noice").setup{}

EOF
