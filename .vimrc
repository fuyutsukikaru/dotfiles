set nocompatible      " be iMproved, required
filetype off          " required

" ============= Plugins =============
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

" UI
Plug 'scrooloose/nerdtree'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'bling/vim-airline'

" Utils
Plug 'tpope/vim-fugitive'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'

" Syntax
Plug 'scrooloose/syntastic'
Plug 'jelera/vim-javascript-syntax', { 'for': 'javascript' }
Plug 'keith/tmux.vim', { 'for': 'tmux' }
Plug 'OrangeT/vim-csharp', { 'for': 'cs' }
Plug 'fatih/vim-go', { 'for': 'go', 'do': ':GoInstallBinaries' }
Plug 'udalov/kotlin-vim', { 'for': 'kotlin' }

" All of your Plugins must be added before the following line
call plug#end()
filetype plugin on    " required

" =============== NERDTree ================
" map <C-n> :NERDTreeToggle<CR>
map <C-n> <plug>NERDTreeTabsToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" ================ General ================
set history=200
set backspace=indent,eol,start
set showcmd
set nowrap
set nostartofline

" Optimizations
set ttyfast
set timeoutlen=50

" Undos
set undofile
set undolevels=5000
set undodir=$HOME/.vim_undo_files

" Mouse mode
set mouse=a
set ttymouse=xterm2
set cursorline

" Disable backup
set noswapfile
set nobackup
set nowb

" Error messages
set noerrorbells
autocmd FocusLost * silent! wa

" ========== Indents and whitespace ==========
set shiftwidth=2
set tabstop=2
set softtabstop=2
set expandtab
set smarttab
set autoindent
set smartindent
set copyindent
set preserveindent

" Auto indent pasted text
nnoremap p p=`]<C-o>
nnoremap P P=`]<C-o>

" Remove extra whitespace on save
autocmd BufWritePre * :%s/\s\+$//e

" ================ Search =================
set smartcase
set ignorecase
set incsearch
set hlsearch
command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --no-ignore --hidden --follow --glob "!.git/*" --color "always" '.shellescape(<q-args>).'| tr -d "\017"', 1, <bang>0)

" ============== UI settings ==============
set background=dark
syntax on
set showmatch
set scrolloff=4
hi Normal ctermbg=NONE

" Split settings for panes
set splitright
set splitbelow

" Line numbering
set number relativenumber
autocmd InsertEnter * :set number norelativenumber
autocmd InsertLeave * :set number relativenumber
highlight LineNr ctermfg=grey ctermbg=NONE

" ========== Syntastic settings ===========
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

"let g:syntastic_always_populate_loc_list=1
"let g:syntastic_auto_loc_list=1
"let g:syntastic_check_on_open=1
"let g:syntastic_check_on_wq=0

" =========== Airline settings ============
set laststatus=2
set noshowmode
set notitle
