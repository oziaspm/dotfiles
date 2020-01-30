" ┌─────────────┐
" │   Plugins   │
" └─────────────┘
call plug#begin('~/.vim/plugged')
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  Plug 'liuchengxu/vista.vim'
  Plug 'w0rp/ale'
  Plug 'puremourning/vimspector'

  " Display function signatures in command line
  Plug 'Shougo/echodoc.vim'

  " Colorscheme
  " Plug 'jmoggee/mirage.vim'
  Plug 'morhetz/gruvbox'

  " Pretty statusline
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'

  " Support for many languages
  Plug 'sheerun/vim-polyglot'

  " Fuzzy finding
  Plug '/usr/local/opt/fzf'
  Plug 'junegunn/fzf.vim'

  " Git
  Plug 'tpope/vim-fugitive'
  " Plug 'airblade/vim-gitgutter'
  Plug 'shumphrey/fugitive-gitlab.vim'

  " Automatically add end structures
  Plug 'tpope/vim-endwise'
  Plug 'rstacruz/vim-closer'

  " Fancy icons
  Plug 'ryanoasis/vim-devicons'

  " Indentation lines
  Plug 'Yggdroot/indentLine'

  " Commentry
  Plug 'tpope/vim-commentary'

  " Testing
  Plug 'janko/vim-test'
  Plug 'kassio/neoterm'

  " Better tabs
  Plug 'gcmt/taboo.vim'

  " Match tmux with airline
  Plug 'sainnhe/tmuxline.vim'

  " Dirvish
  Plug 'justinmk/vim-dirvish'

  " Some surgar for filesystem commands
  Plug 'tpope/vim-eunuch'

  " Handle surrounds like parens, brackets, quotes, html tags, ect...
  Plug 'tpope/vim-surround'

  " Visible marks
  Plug 'kshenoy/vim-signature'
call plug#end()

" ┌────────────┐
" │   Colors   │
" └────────────┘
set termguicolors
set background=dark

" let g:mirage_terminal_italics=1
" colorscheme mirage 

let g:gruvbox_italic=1
let g:gruvbox_italicize_comments=1
colorscheme gruvbox

" ┌────────────┐
" │  General   │
" └────────────┘
set title
set laststatus=2
" Enable line numbers
set number

" Enable relative line numbers
set relativenumber number

" No line numbers in :terminal or quickfix
autocmd TermOpen * setlocal nonumber norelativenumber
autocmd FileType qf setlocal nonumber norelativenumber

" Automatically re-read file if changed outside vim
set autoread

" Disable the mouse
set mouse=

" Use spaces for tabs
set expandtab

" Change number of spaces that a <Tab> counts for during editing
set softtabstop=2

" Indentation amount for < and > commands.
set shiftwidth=2

" Set backups
set undofile
set undolevels=3000
set undoreload=10000
set backupdir=~/.vim/backups
set backup
set noswapfile

" Don't show useless completion messages
set shortmess+=c

" More natural split openings
set splitbelow
set splitright

" Don't show current mode in the command line
set noshowmode

" Always show the sign column
set signcolumn=yes

" Line length
" set textwidth=80
" set colorcolumn=+1

" ┌─────────────────┐
" │   Keybindings   │
" └─────────────────┘
let mapleader = "\<space>"

" ESC with 'jk'
imap jk <Esc>

" Simplify movement between window splits
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Fuzzy finding
nnoremap <leader>ff :Files<cr>
nnoremap <leader>fg :GFiles<cr>
nnoremap <leader>fa :Ag<cr>
nnoremap <leader>fb :Buffers<cr>

" Testing
nnoremap <leader>ts :TestSuite<cr>
nnoremap <leader>tn :TestNearest<cr>
nnoremap <leader>tf :TestFile<cr>
nnoremap <leader>tl :TestLast<cr>

" Tabs
nnoremap <tab> :tabnext<cr>
nnoremap <s-tab> :tabprevious<cr>
nnoremap <leader>bn :tabnext<cr>
nnoremap <leader>bp :tabprevious<cr>
nnoremap <leader>bc :tabnew<cr>
nnoremap <leader>bd :tabclose<cr>
nnoremap <leader>br :TabooRename<space>

" Arrow keys
nnoremap <Left> <nop>
nnoremap <Right> <nop>
nnoremap <Down> <nop>
nnoremap <Up> <nop>
" inoremap <Left> <nop>
" inoremap <Right> <nop>
" inoremap <Down> <nop>
" inoremap <Up> <nop>
vnoremap <Left> <nop>
vnoremap <Right> <nop>
vnoremap <Down> <nop>
vnoremap <Up> <nop>

" netrw
let g:netrw_liststyle = 3
" let g:netrw_browse_split = 4
let g:netrw_banner = 0

" ┌─────────┐
" │   Coc   │
" └─────────┘
hi! link CocErrorSign WarningMsg
hi! link CocWarningSign Number
hi! link CocInfoSign Type

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" Vista
let g:vista_default_executive = 'coc'

" Echodoc
let g:echodoc#enable_at_startup = 1

" Vue
autocmd FileType vue syntax sync fromstart

" Airline
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme = 'gruvbox'
" Don't display buffers in tabline
let g:airline#extensions#tabline#show_buffers = 0
let g:airline#extensions#tabline#show_splits = 0

" Gitgutter
" Shorten vim's update time, so things like gitgutter can display more real
" time
set updatetime=100

" Ale
" Only run linters explicitly defined
let g:ale_linters_explicit = 1

" Signs
let g:ale_sign_error = '•'
let g:ale_sign_warning = '•'
hi! link ALEErrorSign WarningMsg
hi! link AleWarningSign Number

let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'

let g:ale_linters = {}
let g:ale_linters.elixir = ['credo']

" IndentLine
let g:indentLine_char = '│'
" let g:indentLine_color_gui = '#2e3c5b'
let g:indentLine_fileType = ['elixir', 'eelixir', 'javascript', 'javascriptreact', 'vue']

" Pop up menu with pretty translucency
set wildmenu
set winblend=20
set pumblend=20

" Testing
let test#strategy = 'neoterm'

" Neoterm
let g:neoterm_autoscroll = 1
let g:neoterm_size = 12
let g:neoterm_fixedsize = 1
let g:neoterm_keep_term_open = 1
let g:neoterm_term_per_tab = 1
let g:neoterm_default_mod = 'botright'

" Diffing
set diffopt=filler,internal,algorithm:histogram,indent-heuristic

" Try and speed vue syntax up
let g:polyglot_disabled = ['vue']
let g:vue_pre_processors = 'detect_on_enter'
