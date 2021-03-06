call plug#begin('~/.local/share/nvim/plugged/')

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'junegunn/vim-emoji'    
Plug 'preservim/nerdtree'   
Plug 'preservim/tagbar'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'ryanoasis/vim-devicons'
Plug 'airblade/vim-gitgutter'
Plug 'jreybert/vimagit'
Plug 'HerringtonDarkholme/yats.vim'
Plug 'flazz/vim-colorschemes'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'airblade/vim-rooter'
Plug 'scrooloose/nerdtree-project-plugin'
Plug 'prettier/vim-prettier', {
  \ 'do': 'yarn install',
  \ 'branch': 'release/0.x'
  \ }
Plug 'rust-lang/rust.vim'
Plug 'lilydjwg/colorizer'
Plug 'tpope/vim-fugitive'
Plug 'puremourning/vimspector'
Plug 'tpope/vim-rhubarb'
Plug 'jiangmiao/auto-pairs'
Plug 'kvngvikram/rightclick-macros'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'frazrepo/vim-rainbow'
Plug 'terryma/vim-multiple-cursors'
Plug 'Shougo/neosnippet.vim'
Plug 'Shougo/neosnippet-snippets'
Plug 'vim-scripts/ctags.vim'
Plug 'akinsho/nvim-bufferline.lua'

call plug#end()
let g:airline_theme = 'owo'
" may change my mind between owo and onedark themes. they are both very good

set t_Co=256
colorscheme codedark
" SweetCandy Tomorrow-Night 

set iskeyword+=-                      	" treat dash separated words as a word text object"
set formatoptions-=cro                  " Stop newline continution of comments

syntax enable
filetype plugin indent on
set hidden                              " Required to keep multiple buffers open multiple buffers
set nowrap                              " Display long lines as just one line
"set whichwrap+=<,>,[,],h,l set encoding=UTF-8                      " The encoding displayed
set pumheight=10                        " Makes popup menu smaller
set fileencoding=utf-8                  " The encoding written to file
set ruler              			" Show the cursor position all the time
set cmdheight=2                         " More space for displaying messages
set mouse=nv                            " Enable your mouse
set splitbelow                          " Horizontal splits will automatically be below
set splitright                          " Vertical splits will automatically be to the right
set conceallevel=0
set expandtab                           " Converts tabs to spaces
set smartindent                         " Makes indenting smart
set autoindent                          " Good auto indent
set laststatus=2                        " Always display the status line
set number                              " Line numbers
set background=dark                     " tell vim what the background color looks like
set showtabline=2                       " Always show tabs
set nobackup                            " This is recommended by coc
set nowritebackup                       " This is recommended by coc
set shortmess+=c                        " Don't pass messages to |ins-completion-menu|.
set signcolumn=yes                      " Always show the signcolumn, otherwise it would shift the text each time
set updatetime=300                      " Faster completion
set timeoutlen=100                      " By default timeoutlen is 1000 ms
set clipboard=unnamedplus                   " Copy paste between vim and everything else
set incsearch
set guifont=JetfrainsMono\ Nerd\ Font
set laststatus=2
set showtabline=2
set noshowmode
set mousemodel=popup
                
set termguicolors
lua require'bufferline'.setup{}

let g:yats_host_keyword = 1
let g:rooter_patterns = ['=.git', '=Makefile']
let g:rooter_patterns = ['>docs', '>.config']

"Airline customization
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ''
let g:airline#extensions#tabline#left_alt_sep = ''
let g:airline#extensions#tabline#right_sep = ''
let g:airline#extensions#tabline#right_alt_sep = ''

"Function key bindings
map <F5> :NERDTreeToggle<CR>
nmap <F6> :TagbarToggle<CR>
map <F7> :Windows<CR>
map <F8> :Files<CR>
map <F10> :!cargo build <CR>
map <F11> :!cargo run <CR>

"Boring binding *yawn
map <C-LeftMouse> esc <C-LeftMouse>

"ctrl p stuff :3 let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'r'
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']

"Caps lock really does this to a mf
nnoremap <leader>p "+p
vnoremap <leader>p "+p
nnoremap <leader>P "+P
vnoremap <leader>P "+P
nnoremap <leader>y "+y
vnoremap <leader>y "+y
nnoremap <leader>Y "+y$

nnoremap <expr> <C-p> (len(system('git rev-parse')) ? ':Files' : ':GFiles --exclude-standard --others --cached')."\<cr>"

"RightClick Macros
let g:rightclick_normal_items =  ['save' , 'quit' , 'undo' , 'redo' , 'paste', 'spell' , 'nospell']
let g:rightclick_normal_macros = [':w^M' , ':wq!' , 'u'    , '^R'   , 'p' , ':set spell', ' :set nospell']

let g:rightclick_visual_items =  ['copy' , 'cut' , 'paste']
let g:rightclick_visual_macros = ['y'    , 'd'   , 'p'    ]


"Rainbow brackets
au FileType c,cpp,objc,objcpp,java,json,kt,vert,frac,html,php,js,ts,css,rs,toml,vim,gradle call rainbow#load()

function! OutlineToggle()
  if (! exists ("b:outline_mode"))
    let b:outline_mode = 0
  endif
  if (b:outline_mode == 0)
    syn region myFold start="{" end="}" transparent fold
    syn sync fromstart
    set foldmethod=syntax
    silent! exec "%s/{{{/<<</"
    silent! exec "%s/}}}/>>>/"
    let b:outline_mode = 1
  else
    set foldmethod=marker
    silent! exec "%s/<<</{{{/"
    silent! exec "%s/>>>/}}}/"
    let b:outline_mode = 0
  endif
endfunction
autocmd FileType vim setlocal foldmethod=marker
autocmd FileType java setlocal foldmethod=expr
autocmd FileType java setlocal foldexpr=JSFolds()

"Man dont you just hate java immports?
function! JSFolds()
  let thisline = getline(v:lnum)
  if thisline =~? '\v^\s*$'
    return '-1'
  endif

  if thisline =~ '^import.*$'
    return 1
  else
    return indent(v:lnum) / &shiftwidth
  endif
endfunction

"Tagbar Configuration
let g:tagbar_singleclick = 1
let g:tagbar_autoshowtag = 0 
