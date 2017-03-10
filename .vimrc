call plug#begin('~/.vim/plugged')
Plug 'scrooloose/nerdtree'
Plug 'neomake/neomake'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'airblade/vim-gitgutter'
Plug 'mhartington/oceanic-next'
Plug 'kien/ctrlp.vim'
Plug 'scrooloose/nerdcommenter'
Plug 'tpope/vim-fugitive'
Plug 'mileszs/ack.vim'
Plug 'terryma/vim-multiple-cursors'
Plug 'heavenshell/vim-jsdoc'
Plug 'majutsushi/tagbar'
Plug 'mattn/webapi-vim'
Plug 'mattn/gist-vim'
Plug 'tpope/vim-obsession'

call plug#end()

autocmd! BufWritePost * Neomake
let g:neomake_javascript_enabled_makers = ['eslint']
let g:neomake_html_enabled_makers = []
syntax enable
"colorscheme OceanicNext
"let g:airline_theme='oceanicnext'



"se noerrorbells novisualbell t_vb=
"autocmd GUIEnter * set vb t_vb=
 
"set termguicolors
:imap jj <Esc>
:let mapleader = ","
:nmap <leader>w :w<cr>
:nmap <leader>e :NERDTreeToggle<cr>
:nmap <leader>q :q<cr>
:nmap <leader>b :CtrlPBuffer<cr>
:nmap <leader>t :TagbarToggle<cr>
:nmap <leader>z :ZoomWin<cr>
":nmap P "0p 
":nmap > @qj0
"set term=screen-256color
set laststatus=2  " Always display the status line
set guioptions=T

set nocompatible
source /usr/share/vim/google/google.vim
Glug critique
Glug easygoogle
Glug ft-javascript
Glug ft-python
Glug google-filetypes
Glug google-logo
Glug googlestyle
Glug whitespace

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
"
hi Normal ctermfg=252 ctermbg=none

set pastetoggle=<F2>
set clipboard=unnamed

let g:ctrlp_custom_ignore = 'portal\-build\|node_modules\|bower_components\|lib\|dist|\.localized\'

hi clear SpellBad
hi SpellBad ctermfg=red


function! Git5Diff()
  let x=system("git5 status --base")
  execute ":Gdiff " . x
endfunction
command! -nargs=0 Git5Diff call Git5Diff()

:hi ColorColumn ctermbg=grey guibg=grey
colorscheme OceanicNext


let g:deoplete#enable_at_startup = 1
if !exists('g:deoplete#omni#input_patterns')
  let g:deoplete#omni#input_patterns = {}
endif
" let g:deoplete#disable_auto_complete = 1
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif

" omnifuncs
augroup omnifuncs
  autocmd!
  autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
  autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
  autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
  autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
  autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
augroup end
" tern
"if exists('g:plugs["tern_for_vim"]')
  "let g:tern_show_argument_hints = 'on_hold'
  "let g:tern_show_signature_in_pum = 1
  "autocmd FileType javascript setlocal omnifunc=tern#Complete
"endif

"deoplete tab-complete
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
" tern
"autocmd FileType javascript nnoremap <silent> <buffer> gb :TernDef<CR>
nmap <silent> <C-l> <Plug>(jsdoc)

set noerrorbells visualbell t_vb=
autocmd GUIEnter * set visualbell t_vb=









