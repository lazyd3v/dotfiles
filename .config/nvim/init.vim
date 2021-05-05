" vim: set sw=2 ts=2 et foldlevel=0 foldmethod=marker:
"
if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
  silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
" Plug 'takac/vim-hardtime'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --no-bash' }
Plug 'junegunn/fzf.vim'
Plug 'scrooloose/nerdtree'
Plug 'jiangmiao/auto-pairs'
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
" Plug 'joshdick/onedark.vim'
" Plug 'Th3Whit3Wolf/one-nvim'
Plug 'airblade/vim-rooter'
"Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
Plug 'djoshea/vim-autoread'
Plug 'bkad/camelcasemotion'
Plug 'tpope/vim-surround'
Plug 'maxbrunsfeld/vim-yankstack'
Plug 'simeji/winresizer'
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/nvim-compe'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
" Plug 'christianchiarulli/nvcode-color-schemes.vim'
Plug 'smarquez1/nvcode-color-schemes.vim', { 'branch': 'patch-1' }
Plug 'alexaandru/nvim-lspupdate'
call plug#end()

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

" Change leader key timeout
set timeoutlen=1500

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

" Remap autopair to prevent conflict with yarn-stack
let g:AutoPairsShortcutToggle = '<M-q>'


" Import LSP configs
lua require('lsp-config')

" nvim-compe
set completeopt=menuone,noselect
let g:compe = {}
let g:compe.enabled = v:true
let g:compe.autocomplete = v:true
let g:compe.debug = v:false
let g:compe.min_length = 1
let g:compe.preselect = 'enable'
let g:compe.throttle_time = 80
let g:compe.source_timeout = 200
let g:compe.incomplete_delay = 400
let g:compe.max_abbr_width = 100
let g:compe.max_kind_width = 100
let g:compe.max_menu_width = 100
let g:compe.documentation = v:true

let g:compe.source = {}
let g:compe.source.path = v:true
let g:compe.source.buffer = v:true
let g:compe.source.calc = v:true
let g:compe.source.nvim_lsp = v:true
let g:compe.source.nvim_lua = v:true
let g:compe.source.vsnip = v:true

" Show diagnostics in popup
autocmd CursorHold * lua vim.lsp.diagnostic.show_line_diagnostics()
autocmd CursorHoldI * silent! lua vim.lsp.buf.signature_help()

let g:winresizer_start_key = '<Leader><C-r>' 

