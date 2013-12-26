" command to run at startup
autocmd vimenter * NERDTree
autocmd vimenter * wincmd l
autocmd vimenter * if !argc() | NERDTree | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

set t_Co=256
set nocp
set nowrap                       " dont wrap lines

"vertical/horizontal scroll off settings
set scrolloff=5
set sidescrolloff=7
set sidescroll=1

set confirm                      " get a dialog when :q, :w, or :wq fails
set copyindent

" Display unprintable chars. Override vim-sensible defaults
set list
set listchars=tab:▸\ ,extends:❯,precedes:❮,nbsp:␣
set showbreak=↪

" Case insensitive search
set ignorecase
set smartcase
set tabstop=4
set shiftwidth=4
set expandtab
set nu
set rnu
set title
set hlsearch
" Make regex a little easier to type
set magic
set mouse=in               " use mouse in visual,insert and normal mode
set viminfo='10,\"100,:20,%,n~/.viminfo
set wildignore+=*.o,*.obj,.git,node_modules,*.png,*.jpg,*.gif,*.jpeg,*.log,logs,npm-debug.log

"undo files
set undodir=~/.vim/undodir
set undofile
set undolevels=1000 
set undoreload=10000
set cursorline

" fold conf
set foldmethod=indent
set foldlevelstart=1
" set nofoldenable

" Writes to the unnamed register also writes to the * and + registers. This
" makes it easy to interact with the system clipboard
if has ('unnamedplus')
  set clipboard=unnamedplus
else
  set clipboard=unnamed
endif
set pastetoggle=<F3>
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" for things that are particular to this user/computer,
" you can add commands to a .local_vim file in your home dir
" and uncommenting the following
" source .local_vim

" set vb
set background=light
let g:solarized_termtrans=1
let g:solarized_termcolors=256
let g:solarized_contrast="high"
let g:solarized_visibility="low"
colorscheme solarized

" let g:dbgPavimPort = 9081
let g:JSLintHighlightErrorLine=0
let g:html_indent_inctags="html,body,head,tbody"
let g:used_javascript_libs = 'jquery,angularjs'
" journal dir
let g:journal_directory = "~/Dropbox/important"
let g:journal_extension = "markdown"

"Enhanced commentify
let g:EnhCommentifyRespectIndent = 'Yes'
let g:EnhCommentifyPretty = 'Yes'
" session configs
let g:session_autoload='prompt'
let g:session_autosave='true'
let g:session_command_aliases=1
let g:UltiSnipsExpandTrigger="<c-j>"
let g:ycm_seed_identifiers_with_syntax = 1
let g:ycm_add_preview_to_completeopt = 0
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_min_num_of_chars_for_completion = 2

" crtlp keymap
let g:ctrlp_map = '<c-p>'

" vim dict
let g:dict_hosts = [ ["dict.org", ["all"]] ]
" zen coding
let g:user_emmet_mode='inv'
let g:use_emmet_complete_tag = 1
" let g:user_zen_leader_key = '<c-y>'
let g:user_emmet_expandabbr_key='<C-e>'
" pymode settings
let g:pymode_rope = 0
" Documentation
let g:pymode_doc = 1
let g:pymode_doc_key = 'K'
"Linting
let g:pymode_lint = 1
let g:pymode_lint_checker = "pyflakes,pep8"
" Auto check on save
let g:pymode_lint_write = 1
" Support virtualenv
let g:pymode_virtualenv = 1
" Enable breakpoints plugin
let g:pymode_breakpoint = 1
let g:pymode_breakpoint_key = '<leader>b'
" syntax highlighting
let g:pymode_syntax = 1
let g:pymode_syntax_all = 1
let g:pymode_syntax_indent_errors = g:pymode_syntax_all
let g:pymode_syntax_space_errors = g:pymode_syntax_all

" remove trailing whitespace
autocmd FileType c,cpp,java,php autocmd BufWritePre <buffer> :%s/\s\+$//e
" omni complete
autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType ejs set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
autocmd FileType php set omnifunc=phpcomplete#CompletePHP
" autocmd FileType php set ft=php.laravel
autocmd FileType c set omnifunc=ccomplete#Complete
" Git commits.
autocmd FileType gitcommit setlocal spell


map <C-F12> :!ctags -R --sort=yes --c++-kinds=+p --fields=+iaS --extra=+q .<CR>
map <C-b> :NERDTreeToggle<CR>
" window resize commands
map - <C-W><
map + <C-W>>
" Move tab bindings
nmap <silent> <C-s> :tabmove -1 <CR>
nmap <silent> <C-z> :tabmove +1 <CR>
nmap <silent> <C-h> :wincmd h<CR>
nmap <silent> <C-j> :wincmd j<CR>
nmap <silent> <C-k> :wincmd k<CR>
nmap <silent> <C-l> :wincmd l<CR>

" Indent mappings
vnoremap <Tab> ==

" Hightlight mappings
" Use <Space> to clear the highlighting of :set hlsearch.
if maparg('<Space>', 'n') ==# ''
  nnoremap <silent> <Space> :nohlsearch<CR><Space>
endif
nnoremap <Leader>t :tabnew<CR>
" make Y consistent with C and D
nnoremap Y y$
" <Leader>f: Open Quickfix
nnoremap <silent> <Leader>f :botright copen<CR>
" <Leader>n: NERDTreeFind
nnoremap <silent> <Leader>n :NERDTreeFind<cr>
" U: Redos since 'u' undos
nnoremap U <c-r>
" _ : Quick horizontal splits
nnoremap _ :sp<cr>
" | : Quick vertical splits
nnoremap <bar> :vsp<cr>
" Alt-a: Select all
nnoremap a ggVG
" d: Delete into the blackhole register to not clobber the last yank
nnoremap x "_x
" ;: Command mode
noremap ; :
" c: Change into the blackhole register to not clobber the last yank
nnoremap c "_c
" move line down
nnoremap <silent> <C-Down> :.m+<CR>
" move line up
nnoremap <silent> <C-Up> :-m.<CR>k
" add a semicolon ';' at the end of the line
nnoremap ;; A;<Esc>
" add a comma ',' at the end of the line
nnoremap ;, A,<Esc>
" keep search match or last edit jumps in the moddle of the window
nnoremap n nzzzv
nnoremap N Nzzzv
nnoremap g; g;zz
nnoremap g, g,zz

" Dont move cursor to enxt search
nnoremap * *<c-o>
" Tab: Indent
xmap <Tab> >

" shift-tab: unindent
xmap <s-tab> <

" automatically open and close the popup menu / preview window
au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif
set completeopt=menuone,menu,longest,preview

set rtp+=~/.vim/bundle/vundle/
" TODO: append vim powerline bindings to rtp
set rtp+=/usr/local/lib/python2.7/dist-packages/powerline/bindings/vim/
call pathogen#helptags()
call pathogen#infect()
call vundle#rc()

 " Bundles
Bundle 'gmarik/vundle'
Bundle 'tpope/vim-sensible'
Bundle 'scrooloose/nerdtree'
Bundle 'scrooloose/syntastic'
Bundle 'jistr/vim-nerdtree-tabs.git'
Bundle 'Valloric/YouCompleteMe'
" Bundle 'gmarik/github-search.vim'
Bundle 'gmarik/sudo-gui.vim'
Bundle 'tpope/vim-fugitive'
" Bundle 'Lokaltog/vim-easymotion'
Bundle 'mhinz/vim-signify'
Bundle 'EasyGrep'
Bundle 'terryma/vim-multiple-cursors'
" Bundle 'DBGPavim'
Bundle 'kien/ctrlp.vim'
" Bundle 'altercation/vim-colors-solarized'
" Bundle 'othree/javascript-libraries-syntax.vim'
Bundle 'jelera/vim-javascript-syntax'
Bundle 'SirVer/ultisnips'
Bundle 'koron/nyancat-vim'
Bundle 'Raimondi/delimitMate'
Bundle 'docunext/closetag.vim'
Bundle 'stephenmckinney/vim-solarized-powerline'
Bundle 'gregsexton/MatchTag'
Bundle 'szw/vim-dict'
Bundle 'tpope/vim-abolish'
Bundle 'tpope/vim-repeat'
" Bundle 'tpope/vim-sleuth'
Bundle 'LargeFile'
" Bundle 'TwitVim'
" Bundle 'spf13/PIV'
Bundle 'mattn/emmet-vim'
Bundle 'tpope/vim-surround'
" Bundle 'YankRing.vim'
" Bundle 'teramako/jscomplete-vim'
Bundle 'godlygeek/tabular'
Bundle 'tpope/vim-markdown'
Bundle 'mattn/calendar-vim'
Bundle "marijnh/tern_for_vim"
Bundle 'Keithbsmiley/investigate.vim'
" Bundle 'dbext.vim'
" Bundle 'davidhalter/jedi-vim'
" Bundle 'joonty/vdebug.git'
