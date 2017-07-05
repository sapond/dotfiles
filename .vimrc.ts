source /usr/share/vim/google/glug/bootstrap.vim

syntax on

set nocompatible
filetype off
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" Your Vundle plugins go here.
Plugin 'Shougo/vimproc.vim'          " Force install a dependency of tsuquyomi.
Plugin 'leafgarland/typescript-vim'  " enables TypeScript syntax-highlighting.
Plugin 'Quramy/tsuquyomi'            " enables TypeScript auto-completion.
Plugin 'tomasr/molokai'
Plugin 'scrooloose/nerdtree'
Plugin 'airblade/vim-gitgutter'
Plugin 'kien/ctrlp.vim'
Plugin 'scrooloose/nerdcommenter'
Plugin 'tpope/vim-fugitive'
Plugin 'mileszs/ack.vim'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'chriskempson/base16-vim'
call vundle#end()

" TypeScript plugin setup
let g:tsuquyomi_use_dev_node_module = 2
let g:tsuquyomi_tsserver_path = '/google/src/head/depot/google3/third_party/javascript/node_modules/typescript/stable/lib/tsserver.js'

nnoremap <silent> <leader>h :echo tsuquyomi#hint()<CR>

Glug youcompleteme-google

nnoremap <leader>jd :YcmCompleter GoToDefinition<CR>
if !exists("g:ycm_semantic_triggers")
   let g:ycm_semantic_triggers = {}
endif
let g:ycm_semantic_triggers['typescript'] = ['.']

Glug codefmt
Glug codefmt-google

augroup autoformat_settings
  au FileType typescript AutoFormatBuffer clang-format
augroup END



colorscheme molokai

let g:molokai_original = 1
let g:rehash256 = 1


:imap jj <Esc>
:let mapleader = ","

set laststatus=2  " Always display the status line
set guioptions=T
:nmap <leader>w :w<cr>
:nmap <leader>e :NERDTreeToggle<cr>
:nmap <leader>q :q<cr>
:nmap <leader>b :CtrlPBuffer<cr>
:nmap <leader>t :TagbarToggle<cr>
:nmap <leader>z :ZoomWin<cr>

set nu

highlight SpecialKey ctermfg=1
set list
set listchars=tab:T>
set nohlsearch
set nocompatible
set cc=80
set cuc
set spell spelllang=en_us

set expandtab
set shiftwidth=2
set softtabstop=2
set tabstop=2
set autoindent
set nowrap

filetype plugin indent on
syntax enable

hi Normal ctermfg=252 ctermbg=none

set pastetoggle=<F2>
set clipboard=unnamed

let g:ctrlp_custom_ignore = 'portal\-build\|node_modules\|bower_components\|lib\|dist|\.localized\'

hi clear SpellBad
hi SpellBad ctermfg=red

set noerrorbells visualbell t_vb=
autocmd GUIEnter * set visualbell t_vb=
