set noerrorbells novisualbell t_vb=
autocmd GUIEnter * set vb t_vb=
:imap jj <Esc>
:let mapleader = ","
:nmap <leader>w :w<cr>
:nmap <leader>e :NERDTreeToggle<cr>
:nmap <leader>q :q<cr>
:nmap <leader>b :CtrlPBuffer<cr>
:nmap <leader>t :TagbarToggle<cr>
:nmap <leader>z :ZoomWin<cr>

"autocmd BufEnter * lcd %:p:h
"autocmd BufEnter * if &modifiable | NERDTreeFind | wincmd p | endif
"autocmd BufEnter * lcd %:p:h

set nu

highlight SpecialKey ctermfg=1
set list
set listchars=tab:T>

set guifont=Inconsoata:h14

set nocompatible
set cc=100
set cuc
set cul
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Bundle 'daylerees/colour-schemes', {"rtp": "vim/"}
Plugin 'terryma/vim-multiple-cursors'
Plugin 'majutsushi/tagbar'
Plugin 'Shougo/neocomplcache.vim'
"Plugin 'Valloric/YouCompleteMe'
Plugin 'tomasr/molokai'
Plugin 'bling/vim-airline'
Plugin 'maksimr/vim-jsbeautify'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/nerdcommenter'
Plugin 'kien/ctrlp.vim'
Plugin 'mileszs/ack.vim'
Plugin 'chriskempson/vim-tomorrow-theme'
Plugin 'tpope/vim-surround'
Plugin 'scrooloose/syntastic'
Plugin 'airblade/vim-gitgutter'
Plugin 'tpope/vim-fugitive'
Plugin 'altercation/vim-colors-solarized'
Plugin 'vim-scripts/Align'
Plugin 'bronson/vim-trailing-whitespace'
Plugin 'zeis/vim-kolor'
Plugin 'lokaltog/vim-easymotion'
Plugin 'vim-scripts/vibrantink'
Plugin 'vim-scripts/ZoomWin'
call vundle#end()
filetype plugin indent on
let g:vundle_default_git_proto = 'git'


set expandtab
set shiftwidth=4
set softtabstop=4
set tabstop=4
set autoindent
set nowrap 

filetype plugin indent on

"colorscheme Tomorrow
"colorscheme molokai
colorscheme vibrantink
"colorscheme solarized
"colorscheme desert

syntax enable
set background=dark
set t_Co=256
"let g:solarized_termcolors=256
"let g:solarized_visibility = "high"
"let g:solarized_contrast = "high"
"colorscheme Tomorrow-Night-Bright
"colorscheme Tomorrow-Night-Eighties
"colorscheme solarized


map <leader>f :call JsBeautify()<cr>
autocmd FileType javascript noremap <buffer> <leader>f :call JsBeautify()<cr>
autocmd FileType html noremap <buffer> <leader>f :call HtmlBeautify()<cr>
autocmd FileType css noremap <buffer> <leader>f :call CSSBeautify()<cr>
autocmd FileType javascript vnoremap <buffer>f  <leader>b :call RangeJsBeautify()<cr>
autocmd FileType html vnoremap <buffer> <leader>f :call RangeHtmlBeautify()<cr>
autocmd FileType css vnoremap <buffer> <leader>f :call RangeCSSBeautify()<cr>

set pastetoggle=<F2>
set clipboard=unnamed

let g:syntastic_javascript_checkers = ['jshint']
"let g:syntastic_html_checkers = ['jshint']
"let g:syntastic_javascript_jshint_conf="~/.jshintrc"
let g:syntastic_check_on_open=1
let g:syntastic_enable_signs=1

set ttimeoutlen=50

"Note: This option must set it in .vimrc(_vimrc).  NOT IN .gvimrc(_gvimrc)!
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplcache.
let g:neocomplcache_enable_at_startup = 1
" Use smartcase.
let g:neocomplcache_enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'

" Enable heavy features.
" Use camel case completion.
"let g:neocomplcache_enable_camel_case_completion = 1
" Use underbar completion.
"let g:neocomplcache_enable_underbar_completion = 1

" Define dictionary.
let g:neocomplcache_dictionary_filetype_lists = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
        \ }

" Define keyword.
if !exists('g:neocomplcache_keyword_patterns')
    let g:neocomplcache_keyword_patterns = {}
endif
let g:neocomplcache_keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplcache#undo_completion()
inoremap <expr><C-l>     neocomplcache#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return neocomplcache#smart_close_popup() . "\<CR>"
  " For no inserting <CR> key.
  "return pumvisible() ? neocomplcache#close_popup() : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplcache#close_popup()
inoremap <expr><C-e>  neocomplcache#cancel_popup()
" Close popup by <Space>.
"inoremap <expr><Space> pumvisible() ? neocomplcache#close_popup() : "\<Space>"

" For cursor moving in insert mode(Not recommended)
"inoremap <expr><Left>  neocomplcache#close_popup() . "\<Left>"
"inoremap <expr><Right> neocomplcache#close_popup() . "\<Right>"
"inoremap <expr><Up>    neocomplcache#close_popup() . "\<Up>"
"inoremap <expr><Down>  neocomplcache#close_popup() . "\<Down>"
" Or set this.
"let g:neocomplcache_enable_cursor_hold_i = 1
" Or set this.
"let g:neocomplcache_enable_insert_char_pre = 1

" AutoComplPop like behavior.
"let g:neocomplcache_enable_auto_select = 1

" Shell like behavior(not recommended).
"set completeopt+=longest
"let g:neocomplcache_enable_auto_select = 1
"let g:neocomplcache_disable_auto_complete = 1
"inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplcache_omni_patterns')
  let g:neocomplcache_omni_patterns = {}
endif
let g:neocomplcache_omni_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
let g:neocomplcache_omni_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
let g:neocomplcache_omni_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

" For perlomni.vim setting.
" https://github.com/c9s/perlomni.vim
let g:neocomplcache_omni_patterns.perl = '\h\w*->\h\w*\|\h\w*::'


let g:ctrlp_custom_ignore = 'portal\-build\|node_modules\|bower_components\|lib\|dist|\.localized\'

autocmd FileType javascript vnoremap <buffer> <leader>f :call RangeJsBeautify()<cr>
autocmd FileType html vnoremap <buffer> <leader>f :call RangeHtmlBeautify()<cr>
autocmd FileType css vnoremap <buffer> <leader>f :call RangeCSSBeautify()<cr>

map <space> /
map <c-space> ?
map <silent> <leader><cr> :noh<cr>
set mouse=a
