" Gwena's .vimrc file
set nocompatible
filetype off   " required  Arhhhh!!
  
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'
Plugin 'Raimondi/delimitMate'
Plugin 'aklt/plantuml-syntax'
Plugin 'ervandew/supertab'
Plugin 'jgdavey/tslime.vim'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'thoughtbot/vim-rspec'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-unimpaired'
Plugin 'tpope/vim-surround'
Plugin 'vim-ruby/vim-ruby'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'majutsushi/tagbar'
Plugin 'altercation/vim-colors-solarized'
Plugin 'dracula/vim'
Plugin 'adimit/prolog.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

" Haskell
Plugin 'dag/vim2hs'
Plugin 'hdevtools/hdevtools'

" Not needed anymore/for the moment 
" if need again PlantUML - https://github.com/aklt/plantuml-syntax
" Plugin 'jakykong/vim-zim'
" Plugin 'vim-scripts/zim-syntax'

call vundle#end()            " required
filetype plugin indent on    " required

" BASIC CONFIG
syntax on             " Enable syntax highlighting
set hidden
set history=2000
" timeoutlen is used for mapping delays, and ttimeoutlen is used for key code delays.
set timeout timeoutlen=1000 ttimeoutlen=100
set hlsearch
set incsearch
noh " clear the initial highlight after sourcing
set ignorecase smartcase
set number
" set relativenumber
" treat all numerals as decimals (when using <C-x>)
set nrformats=
set scrolloff=3
set laststatus=2 " always show the status bar
set noswapfile
set nobackup
set nowritebackup
set nowrap
set backspace=indent,eol,start " allow backspacing over everything in insert mode"
set mouse=a
set t_Co=256
colorscheme molokai   "railsgwenacasts " molokai  " desert256
set background=dark
" Stuff from grb (remove if does not use)
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
" set winwidth=79 " Not for me or will need to put it bigger
set showcmd
set wildmode=longest,list
set wildmenu
" Turn folding off for real, hopefully
set foldmethod=manual
set nofoldenable
" Default global line sub
set gdefault 
" Use of ack instead of grep, see Vim Practical Tip 109
set grepprg=ack\ --nogroup\ --column\ $*
set grepformat=%f:%l:%c:%m
" ~~~~~~~~
" AUTOCMDS
" ~~~~~~~~
augroup vimrcEx
  " Clear all autocmds in the group
  autocmd!
  " Open the file at last cursor position
	:au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif

  " autoindent with two spaces, always expand tabs
  au BufNewFile,BufReadPost * set ai ts=2 sw=2 sts=2 et

  " check for external file changes
  " commented for the moment, was creating conflict with q/
  " autocmd CursorHold,CursorMoved,BufEnter * checktime

  " au BufEnter *.hs compiler ghc
        " commented as remove some plugin before code kata

  " Haskell, Hdevtools
  au FileType haskell nnoremap <buffer> <F1> :HdevtoolsType<CR>
  au FileType haskell nnoremap <buffer> <silent> <F2> :HdevtoolsClear<CR>

  " Zim Wiki - must not expand tabs to spaces
  " au FileType zim setlocal noexpandtab
augroup END

" To be able to use % for not only single character, really really cool!! 
" Work in Ruby and more. Need to have filetype plugin on, and set nocompatible
runtime macros/matchit.vim

" Cursor Color - Need to add shape (but problem with terminator)
if &term =~ "xterm\\|rxvt"
  let &t_SI = "\<Esc>]12;red\x7"
  let &t_EI = "\<Esc>]12;lightblue\x7"
  silent !echo -ne "\033]12;lightblue\007"
  autocmd VimLeave * silent !echo -ne "\033]112\007"
endif

" ~~~~~~~~~~~~
" KEYS MAPPING
" ~~~~~~~~~~~~

" Easier Split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

set pastetoggle=<f5>
" that would be better but use for something else: let mapleader = "\<Space>"
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

nmap <F8> :TagbarToggle<CR>
imap <F8> <Esc>:TagbarToggle<CR>a

"inoremap <c-s> <esc>:w<CR>
"map <c-s> <c-c>:w<CR>

" tslime (tmux stuff)
vmap <leader>ts <Plug>SendSelectionToTmux
nmap <leader>ts <Plug>NormalModeSendToTmux
map <leader>trm <Plug>SetTmuxVars
 
" delimitMate
let delimitMate_expand_cr = 1
let delimitMate_expand_space = 1

" Airline
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1

" Haskell
let g:haskell_conceal_wide = 1
    " needed if want more than 1 character to be change: e.g -> Sum, <- ::

" Cursor shape - for iTerm2 on OS X
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_SR = "\<Esc>]50;CursorShape=2\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"

" RSpec & TMux
"let g:rspec_command = 'call Send_to_Tmux("rspec {spec}\n")'
"map <Leader>t :call RunCurrentSpecFile()<CR>
"map <Leader>s :call RunNearestSpec()<CR>
"map <Leader>l :call RunLastSpec()<CR>
"map <Leader>a :call RunAllSpecs()<CR>

" From https://github.com/vim-ruby/vim-ruby/wiki/VimRubySupport
" if !exists( "*RubyEndToken" )

  " function RubyEndToken()
    " let current_line = getline( '.' )
    " let braces_at_end = '{\s*\(|\(,\|\s\|\w\)*|\s*\)\?$'
    " let stuff_without_do = '^\s*\(class\|if\|unless\|begin\|case\|for\|module\|while\|until\|def\)'
      " let with_do = 'do\s*\(|\(,\|\s\|\w\)*|\s*\)\?$'

      " if match(current_line, braces_at_end) >= 0
        " return "\<CR>}\<C-O>O"
      " elseif match(current_line, stuff_without_do) >= 0
        " return "\<CR>end\<C-O>O"
      " elseif match(current_line, with_do) >= 0
        " return "\<CR>end\<C-O>O"
      " else
        " return "\<CR>"
      " endif
    " endfunction

" endif

" Silver Searcher
if executable('ag')
  set grepprg=ag\ --nogroup\ --nocolor
  " Use ag in CtrlP for listing files.
  let g:ctrlp_user_command = 'ag -Q -l --nocolor --hidden -g "" %s'
  let g:ctrlp_use_caching = 0
  if !exists(":Ag")
    command -nargs=+ -complete=file -bar Ag silent! grep! <args>|cwindow|redraw!
    nnoremap \ :Ag<SPACE>
  endif
endif

" For Haskell to fix highlight with dag/vim2hs
hi clear Conceal

" For Haskell with hasktags (cabal) and Vim's Tagbar
let g:tagbar_type_haskell = {
    \ 'ctagsbin'  : 'hasktags',
    \ 'ctagsargs' : '-x -c -o-',
    \ 'kinds'     : [
        \  'm:modules:0:1',
        \  'd:data: 0:1',
        \  'd_gadt: data gadt:0:1',
        \  't:type names:0:1',
        \  'nt:new types:0:1',
        \  'c:classes:0:1',
        \  'cons:constructors:1:1',
        \  'c_gadt:constructor gadt:1:1',
        \  'c_a:constructor accessors:1:1',
        \  'ft:function types:1:1',
        \  'fi:function implementations:0:1',
        \  'o:others:0:1'
    \ ],
    \ 'sro'        : '.',
    \ 'kind2scope' : {
        \ 'm' : 'module',
        \ 'c' : 'class',
        \ 'd' : 'data',
        \ 't' : 'type'
    \ },
    \ 'scope2kind' : {
        \ 'module' : 'm',
        \ 'class'  : 'c',
        \ 'data'   : 'd',
        \ 'type'   : 't'
    \ }
\ }