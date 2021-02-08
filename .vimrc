" Gwena's .vimrc file, with the help of GitHub's repos, Practical Vim, etc.
set nocompatible

call plug#begin('~/.vim/plugged')
Plug 'tomasr/molokai'
" Plug 'ervandew/supertab'
" Plug 'jgdavey/tslime.vim'
" Plug 'ctrlpvim/ctrlp.vim'
" Plug 'scrooloose/nerdtree'
" Plug 'scrooloose/syntastic'
" Plug 'thoughtbot/vim-rspec'
Plug 'tpope/vim-commentary'
" Plug 'tpope/vim-unimpaired'
" Plug 'tpope/vim-surround'
" Plug 'Lokaltog/vim-easymotion'
" Plug 'brooth/far.vim'
" Plug 'altercation/vim-colors-solarized'
" Plug 'dracula/vim'
" Plug 'vim-airline/vim-airline'
" Plug 'vim-airline/vim-airline-themes'
call plug#end()

"" BASIC CONFIG
colorscheme molokai
syntax on
set hidden
set history=2000
"" timeoutlen is used for mapping delays, and ttimeoutlen is used for key code delays.
set timeout timeoutlen=1000 ttimeoutlen=100
set hlsearch
set incsearch
"" clear the initial highlight after sourcing
noh
set ignorecase smartcase
set number
"" treat all numerals as decimals (when using <C-x>)
set nrformats=
set scrolloff=3
set laststatus=2
set noswapfile
set nobackup
set nowritebackup
set nowrap
set backspace=indent,eol,start " allow backspacing over everything in insert mode"
set mouse=a
set t_Co=256
set background=dark
set showmatch
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4
set autoindent
set cursorline
set cmdheight=1
set switchbuf=useopen
set showtabline=2
set showcmd
set wildmode=longest,list
set wildmenu
set foldmethod=manual
set nofoldenable
"" Default global line sub
set gdefault
set grepformat=%f:%l:%c:%m

"" AUTOCMDS
augroup vimrcEx
  "" Clear all autocmds in the group
  autocmd!
  " Open the file at last cursor position
	:au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif

  "" autoindent with two spaces, always expand tabs
  au BufNewFile,BufReadPost * set ai ts=2 sw=2 sts=2 et
augroup END

"" To be able to use % for not only single character, really really cool!!
"" Work in Ruby and more. Need to have filetype plugin on, and set nocompatible
runtime macros/matchit.vim

"" Cursor Color - Need to add shape (but problem with terminator)
if &term =~ "xterm\\|rxvt"
  let &t_SI = "\<Esc>]12;red\x7"
  let &t_EI = "\<Esc>]12;lightblue\x7"
  silent !echo -ne "\033]12;lightblue\007"
  autocmd VimLeave * silent !echo -ne "\033]112\007"
endif

"" KEYS MAPPING

" Fast/Slow Finger: still on shift while typing w
nnoremap ; :
command WQ wq
command Wq wq
command W w

"" Easier Split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

set pastetoggle=<f5>
let mapleader = ','
" Remap of ; to be used as well as : is a bad idea as then wont be able to do
" next after a f{char}

set clipboard=unnamed
vmap <C-c> "+y
noremap <C-v> p

" to be able to use C-s to save - heah, that was a long time
" and now in both cases after saving I stay Esc, as more logical
inoremap <C-s> <esc>:w<cr><esc>
nnoremap <C-s> :w<cr>
" from Practical Vim about putting current path
cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%'
" grd had similar with 2 extra mapping
" cnoremap %% <C-R>=expand('%:h').'/'<cr>
" See DAS 013 - still useful with CTRL-T plugin, maybe not so much with CTRLP
map <leader>e :edit %%
map <leader>v :view %%

" nmap <F8> :TagbarToggle<CR>
" imap <F8> <Esc>:TagbarToggle<CR>a

"inoremap <c-s> <esc>:w<CR>
"map <c-s> <c-c>:w<CR>

" Cursor shape - for iTerm2 on OS X
" let &t_SI = "\<Esc>]50;CursorShape=1\x7"
" let &t_SR = "\<Esc>]50;CursorShape=2\x7"
" let &t_EI = "\<Esc>]50;CursorShape=0\x7"
