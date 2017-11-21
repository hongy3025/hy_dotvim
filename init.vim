set nocompatible

set encoding=utf-8
set fileencoding=utf-8
set fileencodings=ucs-bom,utf-8,gbk,cp936,latin-1

colorscheme molokai

let g:iswindows = 0
let g:islinux = 0
if(has("win32") || has("win64") || has("win95") || has("win16"))
    let g:iswindows = 1
else
    let g:islinux = 1
endif

if has("gui_running")
    let g:isGUI = 1
else
    let g:isGUI = 0
endif

""
"" pathogen
""
let g:pathogen_disabled = []
execute pathogen#infect()

" -----------------------------------------------------------------------------
" vim-plug {{{
"
call plug#begin('~/.config/nvim/plugged')

if g:islinux
	Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
	Plug 'junegunn/fzf.vim'
endif

Plug 'scrooloose/nerdtree',  { 'on':  'NERDTreeToggle' }
Plug 'terryma/vim-multiple-cursors'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'ntpeters/vim-better-whitespace'
Plug 'vim-airline/vim-airline'
Plug 'mhinz/vim-signify'
Plug 'w0rp/ale'
Plug 'junegunn/vim-slash'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'lokikl/vim-ctrlp-ag'
Plug 'skywind3000/asyncrun.vim'
Plug 'craigemery/vim-autotag'
Plug 'tbastos/vim-lua'
Plug 'fatih/vim-go', { 'for': 'go' }
Plug 'SirVer/ultisnips'
Plug 'easymotion/vim-easymotion'
Plug 'j16180339887/Global.vim'

"{{{
"Plug 'roxma/nvim-completion-manager'
"Plug 'autozimu/LanguageClient-neovim', { 'do': ':UpdateRemotePlugins' }
"Plug 'roxma/ncm-clang'
"Plug 'roxma/nvim-cm-tern',  {'do': 'npm install'}
"}}}

"{{{
Plug 'Shougo/deoplete.nvim'
Plug 'zchee/deoplete-jedi'
Plug 'zchee/deoplete-go', { 'do': 'make'}
"}}}

Plug 'Shougo/neco-vim'
Plug 'Shougo/neco-syntax'
Plug 'Shougo/neoinclude.vim'

Plug 'jsfaint/gen_tags.vim'
Plug 'SirVer/ultisnips'


call plug#end()

" }}} vim-plug

let g:deoplete#enable_at_startup = 1
let g:deoplete#sources#jedi#enable_cache = 1
let g:deoplete#sources#jedi#show_docstring = 1

set sessionoptions=curdir,options
set shortmess+=c

set t_Co=256
"set mouse=a


syntax on
filetype on
filetype plugin on
filetype plugin indent on

set smartindent
set noshowmode
set noinfercase
set wildignore=*.bak,*.o,*.e,*~
set expandtab
set tabstop=4
set shiftwidth=4
set smarttab
set backspace=indent,eol,start
set showbreak=>
set linebreak
set ignorecase
set smartcase
set autoread
set number

set cindent
set cinoptions=:0g0t0(sus

set path=.,**
set grepprg=ag\ --vimgrep
set makeprg=make
set completeopt=menu,preview,longest

set history=1000
set clipboard=unnamed,unnamedplus
set viminfo+=!

set showmatch
set hlsearch
set incsearch
set listchars=tab:>-,trail:-
set visualbell t_vb=
set showtabline=1
set formatoptions=tcrqmB

set laststatus=2
set cmdheight=1
set wrap
set shortmess=atI

set backup
set backupext=.bak
if g:iswindows
	set directory=c:/temp
	set backupdir=c:/temp
else
	set directory=~/temp
	set backupdir=~/temp
endif


autocmd FileType python setlocal smarttab
autocmd FileType python setlocal shiftwidth=4
autocmd FileType python setlocal expandtab
autocmd FileType python setlocal iskeyword-=
autocmd FileType python setlocal wrap
autocmd FileType python autocmd BufEnter <buffer> EnableStripWhitespaceOnSave

autocmd Filetype go command! Fmt call Goformat()
autocmd FileType go autocmd BufEnter <buffer> EnableStripWhitespaceOnSave

autocmd FileType lua autocmd BufEnter <buffer> EnableStripWhitespaceOnSave


let g:NERDTreeMapPreview = '<SPACE>'
let g:NERDTreeMapActivateNode = 'e'

"-------------------------------------------------------------------------------
" mapping
noremap <F1> <esc>:NERDTreeToggle<CR>

noremap <f2>    :call AutoHighlight_Toggle()<cr>
noremap <s-f2>  :call AutoHighlight_ToggleLock()<cr>

nmap <f3> :Xg "\b<C-R>=expand("<cword>")<CR>\b"<CR>
nmap <f4> :Xg "\b<C-R>=expand("<cword>")<CR>\b"<CR>

noremap <f5>	:cprev<cr>
noremap <f6>    :cnext<cr>


" noremap <F7>	:.w !pbcopy<CR><CR>
" vnoremap <F7>	:w !pbcopy<CR><CR>
" noremap <s-F7>	:set paste<CR>:r !pbpaste<CR>:set nopaste<CR>


noremap <right> <c-w>l
noremap <left>  <c-w>h
noremap <up>    <c-w>k
noremap <down>  <c-w>j

"noremap ,f		:Files<cr>
"noremap ,b		:Buffers<cr>
"noremap ,m		:Marks<cr>
"noremap ,w		:Windows<cr>
"noremap ,q		:History<cr>
"noremap ,:		:History:<cr>
"noremap ,/		:History/<cr>
"noremap ,i 		:Lines \b<c-r>=expand("<cword>")<cr>\b<cr>

noremap ,f		:CtrlP<cr>
noremap ,r		:CtrlPTag<cr>
noremap ,s		:CtrlPBufTag<cr>
noremap ,q		:CtrlPMRUFiles<cr>
noremap ,b		:CtrlPBuffer<cr>
noremap ,a      :CtrlPQuickfix<cr>
noremap ,h      :CtrlPChangeAll<cr>
noremap ,l      :CtrlPLine %<cr>

noremap <f9>    :CtrlPBookmarkDir<cr>

noremap ,,		gt
noremap ,z		gT

noremap Q		gQ
noremap L		<c-w>l
noremap H		<c-w>h
noremap F		:bn<cr>
noremap B		:bp<cr>

nnoremap <silent> ,x :Kwbd<cr>


function! SvnDiffInNewTab(args)
	tabnew
	exec "read !svn diff " . a:args
   	setfiletype diff
	setlocal nomodifiable
	setlocal buftype=nofile
	normal gg
endfunction

function! SvnBlameInNewTab(file)
	tabnew
	exec "read !svn blame " . a:file
   	setfiletype lua
	setlocal nomodifiable
	setlocal buftype=nofile
	normal gg
endfunction

function! OpenInNewTab(args)
	let tabnr = tabpagenr()
	let buflist = tabpagebuflist(tabnr)
	let newtab = 0
	for bnr in buflist
		if bufname(bnr) != ''
			let newtab = 1
		endif
	endfor
	if newtab != 0
		exec "tabedit " . a:args
	else
		exec "edit " . a:args
	endif
endfunction


function! Ag(args)
	exec "AsyncRun! ag --vimgrep  " . a:args
endfunction


function! Xg(args)
	copen
	silent! wincmd w
	exec "AsyncRun! ag --vimgrep --batch --cc --coffee --cpp --go --hh --ini --js --java --lua --make --objc --objcpp --python " . a:args
endfunction


command! -nargs=* -complete=file Svndiff call SvnDiffInNewTab(<q-args>)
command! Svnblame call SvnBlameInNewTab(expand("%"))
command! -nargs=* -complete=file Ag call Ag(<q-args>)
command! -nargs=* -complete=file Xg call Xg(<q-args>)

let g:netrw_preview=1

let g:ale_sign_column_always = 1
let g:ale_lint_on_text_changed = 1
let g:ale_lint_on_enter = 1
let g:ale_lint_on_save = 1
let g:ale_set_loclist = 1
let g:ale_set_quickfix = 0

let g:ale_linters = { 'go': ['golint', 'gotype', 'gofmt', 'gobuild', 'govet', 'staticcheck',] }
let g:ale_go_gometalinter_args = "--disable=staticcheck --disable=govet --disable=gotype --disable=golint"

set shellxescape-=\>
set shellxescape-=\&

let g:airline#extensions#tabline#enabled = 0
let g:airline_powerline_fonts = 1
let g:bufferline_echo = 0

let g:signify_vcs_list = [ 'git', 'svn' ]

let g:EasyMotion_do_mapping = 0
let g:EasyMotion_smartcase = 1
nmap <space> <Plug>(easymotion-overwin-f)
map <space>j <Plug>(easymotion-j)
map <space>k <Plug>(easymotion-k)

"
" {{{ fzf
"

let g:fzf_layout = { 'down': '~35%' }

command! -bang -nargs=* Ag
  \ call fzf#vim#ag(<q-args>,
  \                 <bang>0 ? fzf#vim#with_preview('up:60%')
  \                         : fzf#vim#with_preview('right:50%'),
  \                 <bang>0)

command! -bang -nargs=? -complete=dir Files
  \ call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)

command! -bang History
  \ call fzf#vim#history(fzf#vim#with_preview(), <bang>0)

" fzf }}}
"
"
