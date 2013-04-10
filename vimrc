" vimrc file for following the coding standards specified in PEP 7 & 8.
"
" To use this file, source it in your own personal .vimrc file (``source
" <filename>``) or, if you don't have a .vimrc file, you can just symlink to it
" (``ln -s <this file> ~/.vimrc``).  All options are protected by autocmds
" (read below for an explanation of the command) so blind sourcing of this file
" is safe and will not affect your settings for non-Python or non-C files.
"
"
" All setting are protected by 'au' ('autocmd') statements.  Only files ending
" in .py or .pyw will trigger the Python settings while files ending in *.c or
" *.h will trigger the C settings.  This makes the file "safe" in terms of only
" adjusting settings for Python and C files.
"
" Only basic settings needed to enforce the style guidelines are set.
" Some suggested options are listed but commented out at the end of this file.

" Number of spaces that a pre-existing tab is equal to.
" For the amount of space used for a new tab use shiftwidth.
au BufRead,BufNewFile *py,*pyw,*.c,*.h,*html,*js,*ejs set tabstop=8

" What to use for an indent.
" This will affect Ctrl-T and 'autoindent'.
" Python: 4 spaces
" C: tabs (pre-existing files) or 4 spaces (new files)
au BufRead,BufNewFile *.py,*pyw,*.html,*.js,*.ejs set shiftwidth=4
au BufRead,BufNewFile *.py,*.pyw,*.html,*.js,*.ejs set expandtab
fu Select_c_style()
    if search('^\t', 'n', 150)
        set shiftwidth=8
        set noexpandtab
    el 
        set shiftwidth=4
        set expandtab
    en
endf
au BufRead,BufNewFile *.c,*.h call Select_c_style()
au BufRead,BufNewFile Makefile* set noexpandtab

" Use the below highlight group when displaying bad whitespace is desired.
highlight BadWhitespace ctermbg=red guibg=red
" Hightlight mappings
nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>

" Display tabs at the beginning of a line in Python mode as bad.
au BufRead,BufNewFile *.py,*.pyw match BadWhitespace /^\t\+/
" Make trailing whitespace be flagged as bad.
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

" Wrap text after a certain number of characters
" Python: No limit
" C: 79
" Uncomment this if you want to limit your textwidth in python
" can be very annoying ..
" au BufRead,BufNewFile *.py,*.pyc set textwidth=79
au BufRead,BufNewFile *.c,*.h set textwidth=79

" Turn off settings in 'formatoptions' relating to comment formatting.
" - c : do not automatically insert the comment leader when wrapping based on
"    'textwidth'
" - o : do not insert the comment leader when using 'o' or 'O' from command mode
" - r : do not insert the comment leader when hitting <Enter> in insert mode
" Python: not needed
" C: prevents insertion of '*' at the beginning of every line in a comment
au BufRead,BufNewFile *.c,*.h set formatoptions-=c formatoptions-=o formatoptions-=r

" Use UNIX (\n) line endings.
" Only used for new files so as to not force existing files to change their
" line endings.
" Python: yes
" C: yes
au BufNewFile *.py,*.pyw,*.c,*.h set fileformat=unix


" ----------------------------------------------------------------------------
" The following section contains suggested settings.  While in no way required
" to meet coding standards, they are helpful.

" Set the default file encoding to UTF-8: 
set encoding=utf-8

" Puts a marker at the beginning of the file to differentiate between UTF and
" UCS encoding (WARNING: can trick shells into thinking a text file is actually
" a binary file when executing the text file): ``set bomb``

" For full syntax highlighting:
let python_highlight_all=1
syntax on

" Folding based on indentation: 
set foldmethod=indent
set nofoldenable

""""""""""""""""""""""""""""""""
" END http://svn.python.org/projects/python/trunk/Misc/Vim/vimrc
""""""""""""""""""""""""""""""""

filetype plugin on
"set iskeyword+=.

autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType ejs set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
" au FileType javascript set dictionary+=$HOME/.vim/dict/node.dict

autocmd vimenter * NERDTree
autocmd vimenter * if !argc() | NERDTree | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
" inoremap <Nul> <C-x><C-o>

set background=light     " you can use `dark` or `light` as your background
set t_Co=256
set nocp
set nowrap              " dont wrap lines
set scrolloff=5   " 5 lines above/below cursor when scrolling
set confirm             " get a dialog when :q, :w, or :wq fails
set autoindent
set copyindent
set smartcase
set tabstop=4
set shiftwidth=4
set expandtab
set ruler
set number
set title
set hlsearch
set incsearch               " search incremently (search while typing)
set mouse=vin               " use mouse in visual,insert and normal mode
set viminfo='10,\"100,:20,%,n~/.viminfo
set wildignore+=*.o,*.obj,.git,node_modules,*.png,*.jpg,*.gif,*.jpeg,*.log,logs,npm-debug.log

" configure tags - add additional tags here or comment out not-used ones
" set tags+=~/.vim/tags/cpp
" set tags+=~/.vim/tags/gl
" set tags+=~/.vim/tags/sdl
set tags+=~/.vim/tags/tags

"undo files
set undodir=~/.vim/undodir
set undofile
set undolevels=1000 
set undoreload=10000
set cursorline
set laststatus=2
"set clipboard=unnamed
"set go+=a
"vnoremap y "+y
"set paste
se nu

"http://vim.wikia.com/wiki/In_line_copy_and_paste_to_system_clipboard
"sudo apt-get install xclip
vmap <C-c> y: call system("xclip -i -selection clipboard", getreg("\""))<CR>
nmap <C-v> :call setreg("\"",system("xclip -o -selection clipboard"))<CR>p


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

" autocmd FileType javascript :setlocal omnifunc=jscomplete#CompleteJS
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
