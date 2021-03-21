call plug#begin('~/.local/share/nvim/plugged/')
  
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'preservim/nerdtree'   
Plug 'preservim/tagbar'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'ryanoasis/vim-devicons'
Plug 'airblade/vim-gitgutter'
Plug 'jreybert/vimagit'
Plug 'flazz/vim-colorschemes'
Plug 'junegunn/fzf.vim'
Plug 'airblade/vim-rooter'
Plug 'scrooloose/nerdtree-project-plugin'
Plug 'lilydjwg/colorizer'
Plug 'tpope/vim-fugitive'
Plug 'jiangmiao/auto-pairs'
Plug 'kvngvikram/rightclick-macros'
Plug 'frazrepo/vim-rainbow'
Plug 'mg979/vim-visual-multi'
Plug 'Shougo/neosnippet.vim'
Plug 'Shougo/neosnippet-snippets'
Plug 'onsails/lspkind-nvim'
Plug 'bpdp/vim-java'
Plug 'uiiaoo/java-syntax.vim'
Plug 'jvenant/vim-java-imports'
Plug 'dense-analysis/ale'
Plug 'tfnico/vim-gradle'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
call plug#end()


"Lua calls
lua require('lspkind').init({})

" may change my mind between owo and onedark themes. they are both very good
let g:airline_theme = 'owo'
set t_Co=256
colorscheme codedark
" SweetCandy Tomorrow-Night 

set iskeyword+=-                      	" treat dash separated words as a word text object"
set formatoptions-=cro                  " Stop newline continution of comments

syntax enable
filetype plugin indent on
set hidden                              " Required to keep multiple buffers open multiple buffers
set nowrap                              " Display long lines as just one line
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

"coc
let g:coc_global_extensions = [
  \ 'coc-snippets',
  \ 'coc-tsserver',
  \ 'coc-eslint', 
  \ 'coc-prettier', 
  \ 'coc-json', 
  \ ]
command! -nargs=0 Prettier :CocCommand prettier.formatFile

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

"Boring binding *yawn
map <C-LeftMouse> esc <C-LeftMouse>

"ale
let b:ale_fixers = ['prettier']
let g:ale_fix_on_save = 1

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


autocmd VimEnter * syntax enable 
autocmd FileType java :set fmr=/**,*/ fdm=marker fdc=1

syn keyword javaExternal native package
syn region foldImports start=/\(^\s*\n^import\)\@<= .\+;/ end=+^\s*$+ transparent fold keepend

"Rainbow brackets
let g:rainbow_active = 1
au FileType c,cpp,objc,objcpp,java,json,kt,vert,frac,html,php,js,ts,css,rs,toml,vim,gradle call rainbow#load()
let g:rainbow_load_separately = [
    \ [ '*' , [['(', ')'], ['\[', '\]'], ['{', '}']] ],
    \ [ '*.tex' , [['(', ')'], ['\[', '\]']] ],
    \ [ '*.cpp' , [['(', ')'], ['\[', '\]'], ['{', '}']] ],
    \ [ '*.{html,htm}' , [['(', ')'], ['\[', '\]'], ['{', '}'], ['<\a[^>]*>', '</[^>]*>']] ],
    \ ]
"Tagbar Configuration
let g:tagbar_singleclick = 1
let g:tagbar_autoshowtag = 0 
