" vim: set sw=2 ts=2 et foldlevel=0 foldmethod=marker:
"
if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
  silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
" Plug 'takac/vim-hardtime'
"{{{
let g:hardtime_default_on = 1
"}}}
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --no-bash' }
Plug 'junegunn/fzf.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
"{{{
"" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)
"}}}
Plug 'scrooloose/nerdtree'
Plug 'jiangmiao/auto-pairs'
Plug 'tomasiser/vim-code-dark'
Plug 'itchyny/lightline.vim'
" {{{
if 0 " toggle 0/1 for powerline
  let g:lightline = {
        \ 'colorscheme': 'seoul256',
        \ 'separator': { 'left': '', 'right': '' },
        \ 'subseparator': { 'left': '', 'right': '' },
        \ 'component': {
        \   'readonly': '%{&readonly?"":""}',
        \ }
        \ }
else
  let g:lightline = {
        \ 'colorscheme': 'solarized',
        \ 'subseparator': { 'left': '>', 'right': '' }
        \ }
  " \ 'separator': { 'left': '▓▒░', 'right': '░▒▓' },
endif
" }}}
"Plug 'yuezk/vim-js'
"Plug 'maxmellon/vim-jsx-pretty'
""{{{
"let g:polyglot_disabled = ['jsx']
""}}}
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'joshdick/onedark.vim'
Plug 'airblade/vim-rooter'
"Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
Plug 'lyokha/vim-xkbswitch'
Plug 'djoshea/vim-autoread'
Plug 'bkad/camelcasemotion'
Plug 'junegunn/vim-peekaboo'
call plug#end()

" Automatic keyboard config
let g:XkbSwitchLib = '/usr/local/lib/libxkbswitch.dylib'
let g:XkbSwitchEnabled = 1

" Color scheme configuration
set termguicolors
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
colorscheme onedark

" Relative line numbers + current line as absolute
set number relativenumber
set nu rnu

" Open NERDTree when directory is opened
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif

" Execute NERDTreeFind on ctrl+n
function MyNerdToggle()
    if &filetype == 'nerdtree' || exists("g:NERDTree") && g:NERDTree.IsOpen()
        :NERDTreeToggle
    else
        :NERDTreeFind
    endif
endfunction
nnoremap <C-n> :call MyNerdToggle()<CR>
let g:NERDTreeMapActivateNode = ''
let g:NERDTreeMapOpenInTab = 't'
let g:NERDTreeWinPos = "left"
nmap ,n :NERDTreeToggle<CR>

" Space as leader
let mapleader = " "

" Two spaces for fzf
nnoremap <silent> <Leader><Space> :Files<CR>

" Enable syntax highlight
syntax on

" if hidden is not set, TextEdit might fail.
set hidden
set lazyredraw
set tabstop=2

set shiftwidth=2
set shiftround

" Some servers have issues with backup files, see #649
set nobackup
set nowritebackup

" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300

" don't give |ins-completion-menu| messages.
set shortmess+=c

" always show signcolumns
set signcolumn=yes

" Use system buffer
set clipboard+=unnamedplus

" Save on focus loose
:au FocusLost * :wa

" Spaces instead of tabs
set tabstop=4
set shiftwidth=4
set expandtab

" Enable mouse clicks
set mouse=a
map <ScrollWheelUp> <C-Y>
map <ScrollWheelDown> <C-E>

" Open git status after space gst
nnoremap <silent> <Leader>gst :GFiles?<CR>

" Start searching before pressing enter
set incsearch

" Use camel case motion for words
map <silent> w <Plug>CamelCaseMotion_w
map <silent> b <Plug>CamelCaseMotion_b
map <silent> e <Plug>CamelCaseMotion_e
map <silent> ge <Plug>CamelCaseMotion_ge
sunmap w
sunmap b
sunmap e
sunmap ge
