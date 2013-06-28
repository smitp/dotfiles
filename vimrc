" Set the default file encoding to UTF-8: 
set encoding=utf-8

syntax on
" fold conf
set foldmethod=indent
set foldlevelstart=1
" set nofoldenable

" command to run at startup
autocmd vimenter * NERDTree
autocmd vimenter * wincmd l
autocmd vimenter * if !argc() | NERDTree | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

"allow backspacing over everything in insert mode
set backspace=indent,eol,start
set t_Co=256
set nocp
set nowrap                       " dont wrap lines

"vertical/horizontal scroll off settings
set scrolloff=5
set sidescrolloff=7
set sidescroll=1

set confirm                      " get a dialog when :q, :w, or :wq fails
set autoindent
set copyindent

" Display unprintable chars
set list
set listchars=tab:▸\ ,extends:❯,precedes:❮,nbsp:␣
set showbreak=↪

" Case insensitive search
set ignorecase
set smartcase
set tabstop=4
set shiftwidth=4
set expandtab
set smarttab
set ruler
set number
set title
set hlsearch
set incsearch               " search incremently (search while typing)
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
set laststatus=2
set autochdir
" show line numbers
se nu

" Writes to the unnamed register also writes to the * and + registers. This
" makes it easy to interact with the system clipboard
if has ('unnamedplus')
  set clipboard=unnamedplus
else
  set clipboard=unnamed
endif

"http://vim.wikia.com/wiki/In_line_copy_and_paste_to_system_clipboard
"sudo apt-get install xclip
" vmap <C-c> y: call system("xclip -i -selection clipboard", getreg("\""))<CR>
" nmap <C-v> :call setreg("\"",system("xclip -o -selection clipboard"))<CR>p


"This should be in /etc/vim/vimrc or wherever you global vimrc is.
"But, if not, I for one can't live without it.
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" for things that are particular to this user/computer,
" you can add commands to a .local_vim file in your home dir
" and uncommenting the following
" source .local_vim

" set vb
call pathogen#infect()

syntax enable
set background=light
" let g:solarized_termcolors=256
colorscheme mango
" let g:Powerline_symbols = 'fancy'
let g:Powerline_theme='fancy'
" let g:Powerline_colorscheme='solarized256_light'

filetype plugin indent on
let g:dbgPavimPort = 9081
let g:JSLintHighlightErrorLine=0
let g:html_indent_inctags="html,body,head,tbody"
let g:used_javascript_libs = 'jquery,angularjs'
" let g:html_indent_script1 = "inc"
" let g:html_indent_style1 = "inc"

" let g:node_usejscomplete=1
" let g:jscomplete_use = ['dom'] ", 'moz', 'es6th']
"Enhanced commentify
let g:EnhCommentifyRespectIndent = 'Yes'
let g:EnhCommentifyPretty = 'Yes'
" session configs
let g:session_autoload='prompt'
let g:session_autosave='true'
let g:session_command_aliases=1
let g:UltiSnipsExpandTrigger="<c-j>"
let g:ycm_key_select_completion='<Tab>'
let g:ycm_seed_identifiers_with_syntax = 1
let g:ycm_add_preview_to_completeopt = 0
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_min_num_of_chars_for_completion = 2

" crtlp keymap
let g:ctrlp_map = '<c-f>'

" vim dict
let g:dict_hosts = [ ["dict.org", ["all"]] ]
" zen coding
let g:user_zen_mode='inv'
let g:use_zen_complete_tag = 1
" let g:user_zen_leader_key = '<c-y>'
let g:user_zen_expandabbr_key='<C-e>'

" remove trailing whitespace
autocmd FileType c,cpp,java,php autocmd BufWritePre <buffer> :%s/\s\+$//e
" omni complete
autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType ejs set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
autocmd FileType php set omnifunc=phpcomplete#CompletePHP
autocmd FileType c set omnifunc=ccomplete#Complete


" js sytaxComplate
autocmd BufReadPre *.js let b:javascript_lib_use_jquery = 1
autocmd BufReadPre *.js let b:javascript_lib_use_angularjs = 1
" php omnicomplete config
let php_sql_query=1
let php_htmlInStrings=1

map <C-F12> :!ctags -R --sort=yes --c++-kinds=+p --fields=+iaS --extra=+q .<CR>
map <C-b> :NERDTreeToggle<CR>
" window resize commands
map - <C-W><
map + <C-W>>
nmap <silent> <C-h> :wincmd h<CR>
nmap <silent> <C-j> :wincmd j<CR>
nmap <silent> <C-k> :wincmd k<CR>
nmap <silent> <C-l> :wincmd l<CR>

" Indent mappings
vnoremap <Tab> ==

" Hightlight mappings
nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>
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
" Tab: Indent
xmap <Tab> >

" shift-tab: unindent
xmap <s-tab> <

" automatically open and close the popup menu / preview window
au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif
set completeopt=menuone,menu,longest,preview

set rtp+=~/.vim/bundle/vundle/
set rtp+=$HOME/.local/lib/python2.7/site-packages/powerline/bindings/vim/
call vundle#rc()
" Bundles
Bundle 'gmarik/vundle'
Bundle 'gmarik/github-search.vim'
Bundle 'gmarik/sudo-gui.vim'
Bundle 'tpope/vim-fugitive'
Bundle 'Lokaltog/vim-easymotion'
" Bundle 'git://git.wincent.com/command-t.git'
Bundle 'scrooloose/nerdtree'
Bundle 'scrooloose/syntastic'
Bundle 'airblade/vim-gitgutter'
Bundle 'git://github.com/jistr/vim-nerdtree-tabs.git'
Bundle 'Valloric/YouCompleteMe'
Bundle 'EasyGrep'
Bundle 'terryma/vim-multiple-cursors'
Bundle 'DBGPavim'
Bundle 'kien/ctrlp.vim'
Bundle 'altercation/vim-colors-solarized'
Bundle 'othree/javascript-libraries-syntax.vim'
Bundle 'SirVer/ultisnips'
Bundle 'koron/nyancat-vim'
Bundle 'Raimondi/delimitMate'
" Bundle 'Lokaltog/powerline'
Bundle 'stephenmckinney/vim-solarized-powerline'
Bundle 'gregsexton/MatchTag'
Bundle 'szw/vim-dict'
Bundle 'tpope/vim-abolish'
Bundle 'tpope/vim-sleuth'
Bundle 'LargeFile'
Bundle 'TwitVim'
Bundle 'spf13/PIV'
Bundle 'mattn/zencoding-vim'
Bundle 'YankRing.vim'
Bundle 'nginx.vim'
" Bundle 'nanotech/jellybeans.vim'
