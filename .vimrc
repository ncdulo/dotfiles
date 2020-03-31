" ncdulo: Nov 8, 2019
" Starting off my own config here, migrating to vim from emacs! :D
"
" Source for many of these options:
"   https://vim.fandom.com/wiki/Example_vimrc

" -----------------------------------------------
" General usability
" -----------------------------------------------

" Ensure we are in 256-color mode
" Disabling -- not a fan of how it looks on TTY
" Workaround: Find & set TTY specific color theme
"set t_Co=256

" I am setting this for both console and gui mode for consistent colors.
" It also provides a useful way to quickly tell if the vim instance in a
" terminal is running as my user or root account. User will use zenburn,
" root will load whatever the default is (it is not zenburn)
colors zenburn

" Set color theme for lightline
let g:lightline = {
	\ 'colorscheme': 'seoul256',
	\ }

" If running in gui mode, set our font. Console mode will use
" whichever defaults are pulled in from the parent terminal.
if has('gui_running')
	colors zenburn
	set guifont=xos4\ Terminus\ 10

	"set guioptions-=m " Remove menu bar
	set guioptions-=T " Remove tool bar
	set guioptions-=r " Remove RH scroll bar
	set guioptions-=L " Remove LH scroll bar
endif

" Session related options
set ssop-=options    " do not store global and local values in a session
set ssop-=folds      " do not store folds

" Reload files changed outside of Vim
set autoread

" Set default encoding to UTF-8
set encoding=utf-8
set fileencoding=utf-8

" Use Unix line endings. Try reading Unix line endings first, then DOS
set fileformat=unix
set fileformats=unix,dos

" Set maximum line width. Note that this *will* insert line breaks into the
" text. Pay attention when writing code or line break sensitive content.
"set textwidth=79
" I am disabling line wrap because it is getting annoying :)
set textwidth=0
set wrapmargin=0

" Visual indication for column 80
set colorcolumn=80

" Splits open to right or bottom. Just feels better this way.
set splitbelow
set splitright

" Attempt to determine the type of a file based on its name and possibly its
" contents. Use this to allow intelligent auto-indenting for each filetype,
" and for plugins that are filetype specific.
filetype indent plugin on
 
" Enable syntax highlighting
syntax on

" Highlight search results
set hlsearch

" Enable incremental search
set incsearch

" Show partial commands in the last line of the screen
set showcmd

" Higlight our current line
set cursorline

" Better command-line completion
set wildmenu
set wildmode=full

" Use case insensitive search unless we specifically use captial letters
set ignorecase
set smartcase

" Allow backspacing over autoindent, line breaks and start of insert action
set backspace=indent,eol,start
 
" When opening a new line and no filetype-specific indenting is enabled, keep
" the same indent as the line you're currently on. Useful for READMEs, etc.
set autoindent
 
" Stop certain movements from always going to the first character of a line.
" While this behaviour deviates from that of Vi, it does what most users
" coming from other editors would expect.
"set nostartofline
 
" Display the cursor position on the last line of the screen or in the status
" line of a window
set ruler
 
" Always display the status line, even if only one window is displayed
set laststatus=2
 
" Instead of failing a command because of unsaved changes, instead raise a
" dialogue asking if you wish to save changed files.
set confirm
 
" Use visual bell instead of beeping when doing something wrong
set visualbell
 
" And reset the terminal code for the visual bell. If visualbell is set, and
" this line is also included, vim will neither flash nor beep. If visualbell
" is unset, this does nothing.
"set t_vb=
 
" Enable use of the mouse for all modes
set mouse=a
 
" Set the command window height to 2 lines, to avoid many cases of having to
" "press <Enter> to continue"
set cmdheight=2
 
" Display line numbers on the left
set number
 
" Quickly time out on keycodes, but never time out on mappings
"set notimeout ttimeout ttimeoutlen=200
 
" Use <F11> to toggle between 'paste' and 'nopaste'
"set pastetoggle=<F11>

" Enable Crawl map file syntax highlighting
au BufRead,BufNewFile *.des set syntax=levdes

" -----------------------------------------------
" Plugins
" -----------------------------------------------

" Nerd Tree - open a NerdTree window upon start
"autocmd vimenter * NERDTree

" -----------------------------------------------
" Keybinds
" -----------------------------------------------
let mapleader = ","

" <leader>ss|sr for session save/restore using global session directory
let g:session_dir = '~/dev/vim_sessions'
exec 'nnoremap <leader>ss :mks! ' . g:session_dir . '/*.vim<C-D><BS><BS><BS><BS><BS>'
exec 'nnoremap <leader>sr :so ' . g:session_dir. '/*.vim<C-D><BS><BS><BS><BS><BS>'

" <leader>q and <leader>w bound to prev/next buffer
noremap <leader>q :bp<CR>
noremap <leader>w :bn<CR>
" Toggle for Nerd Tree
map <C-n> :NERDTreeToggle<CR>

" Split navigation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" This unsets the last search pattern register by hitting RET
nnoremap <CR> :noh<CR><CR>

