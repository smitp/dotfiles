au BufRead,BufNewFile *py,*pyw,*.c,*.h,*html,*js,*ejs set tabstop=8

" What to use for an indent.
" This will affect Ctrl-T and 'autoindent'.
" Python: 4 spaces
" C: tabs (pre-existing files) or 4 spaces (new files)
au BufRead,BufNewFile *.py,*pyw,*.html,*.js,*.ejs set shiftwidth=4
au BufRead,BufNewFile *.py,*.pyw,*.html,*.js,*.ejs set expandtab
au BufRead,BufNewFile Makefile* set noexpandtab

" Use the below highlight group when displaying bad whitespace is desired.
highlight BadWhitespace ctermbg=red guibg=red
" Hightlight mappings
nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>

" Use UNIX (\n) line endings for new files
au BufNewFile *.py,*.pyw,*.c,*.h set fileformat=unix

" Set the default file encoding to UTF-8: 
set encoding=utf-8

syntax on
" fold conf
set foldmethod=syntax
set nofoldenable

autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType ejs set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS

" command to run at startup
autocmd vimenter * NERDTree
autocmd vimenter * wincmd l
autocmd vimenter * if !argc() | NERDTree | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

set background=light             " you can use `dark` or `light` as your background
set t_Co=256
set nocp
set nowrap                       " dont wrap lines
set scrolloff=5                  " 5 lines above/below cursor when scrolling
set confirm                      " get a dialog when :q, :w, or :wq fails
set autoindent
set copyindent

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
set mouse=in               " use mouse in visual,insert and normal mode
set viminfo='10,\"100,:20,%,n~/.viminfo
set wildignore+=*.o,*.obj,.git,node_modules,*.png,*.jpg,*.gif,*.jpeg,*.log,logs,npm-debug.log

" configure tags - add additional tags here or comment out not-used ones
" set tags+=~/.vim/tags/cpp
" set tags+=~/.vim/tags/gl
" set tags+=~/.vim/tags/sdl
" set tags+=~/.vim/tags/tags

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

set vb

color mango
call pathogen#infect()
filetype plugin indent on
let g:dbgPavimPort = 9081 
let g:JSLintHighlightErrorLine=0
let g:html_indent_inctags="html,body,head,tbody"
" let g:html_indent_script1 = "inc"
" let g:html_indent_style1 = "inc"

" let g:node_usejscomplete=1
" let g:jscomplete_use = ['dom'] ", 'moz', 'es6th']
"Enhanced commentify
let g:EnhCommentifyRespectIndent = 'Yes'
let g:EnhCommentifyPretty = 'Yes'
" Command-t mappings
let g:CommandTCancelMap='<Esc>'
" session configs
let g:session_autoload='prompt'
let g:session_autosave='true'
let g:session_command_aliases=1

" remove trailing whitespace
autocmd FileType c,cpp,java,php autocmd BufWritePre <buffer> :%s/\s\+$//e
" omni complete
autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
autocmd FileType php set omnifunc=phpcomplete#CompletePHP
autocmd FileType c set omnifunc=ccomplete#Complete

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

" automatically open and close the popup menu / preview window
au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif
set completeopt=menuone,menu,longest,preview

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
" Bundles
Bundle 'gmarik/vundle'
Bundle 'gmarik/github-search.vim'
Bundle 'gmarik/sudo-gui.vim'
Bundle 'tpope/vim-fugitive'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'git://git.wincent.com/command-t.git'
Bundle 'scrooloose/nerdtree'
Bundle 'scrooloose/syntastic'
Bundle 'airblade/vim-gitgutter'
Bundle 'git://github.com/jistr/vim-nerdtree-tabs.git'
Bundle 'Valloric/YouCompleteMe'
Bundle 'EasyGrep'
Bundle 'terryma/vim-multiple-cursors'
Bundle 'DBGPavim'
