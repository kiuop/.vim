set nocompatible
filetype off

" init plugins
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-surround'
Plugin 'Valloric/YouCompleteMe'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/syntastic'
Plugin 'vim-airline/vim-airline'
Plugin 'airblade/vim-gitgutter'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'majutsushi/tagbar'
Plugin 'honza/vim-snippets'
Plugin 'sirver/ultisnips'
Plugin 'tpope/vim-repeat'
Plugin 'sheerun/vim-polyglot'

call vundle#end() 

" generic settings
filetype plugin indent on
syntax on

set backspace=indent,eol,start
set autoindent
set smarttab
set complete-=i
set nrformats-=octal
set incsearch
set hlsearch
set ignorecase
set smartcase
set wildmenu
set wildignore=*.o,*~,*.pyc,*.pyo,*.swp
set laststatus=2
set formatoptions+=j
set autoread
set history=1000
set undolevels=1000
set hidden
set number
set clipboard=unnamed,unnamedplus
set visualbell

" folding
let g:xml_syntax_folding = 1
set foldmethod=syntax
set foldlevel=99
au FileType python setlocal foldmethod=indent
au FileType python setlocal foldnestmax=2

" colors
set t_Co=256
colorscheme koehler
set background=dark

""" mappings
let mapleader = ","

" insert mappings
inoremap jj <Esc>
inoremap kk <Esc>
inoremap jk <Esc>
inoremap <leader>p <Esc>:set invpaste invnumber<bar>sign unplace *<CR>

" normal mappings
nnoremap j gj
nnoremap k gk

nnoremap <silent><C-n> :nohlsearch<CR>

nnoremap <S-k> :bnext<cr>
nnoremap <S-j> :bprevious<cr>

nnoremap <space> za

nnoremap <leader>p :set invpaste invnumber<bar>sign unplace *<CR>
nnoremap <leader>tr :NERDTreeToggle<CR>
nnoremap <leader>g :YcmCompleter GoToDefinitionElseDeclaration<CR>
nnoremap <leader>ta :TagbarToggle<CR>

" splitscreen mappings
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-l> <c-w>l
nnoremap <c-h> <c-w>h

" visual mappings
vnoremap < <gv  " better indentation
vnoremap > >gv  " better indentation
vnoremap . :norm.<CR>

" plugins
let NERDTreeIgnore = ['\.pyc$']
let NERDTreeQuitOnOpen=1

let g:airline#extensions#tabline#enabled = 1

let g:ycm_autoclose_preview_window_after_completion=1

" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<c-space>"
let g:UltiSnipsJumpForwardTrigger="<c-n>"
let g:UltiSnipsJumpBackwardTrigger="<c-b>"

"functions
function! DeleteFile(...)
	if(exists('a:1'))
		let theFile=a:1
	elseif ( &ft == 'help' )
		echohl Error
		echo "Cannot delete a help buffer!"
		echohl None
		return -1
	else
		let theFile=expand('%:p')
	endif
	let delStatus=delete(theFile)
	if(delStatus == 0)
		echo "Deleted " . theFile
	else
		echohl WarningMsg
		echo "Failed to delete " . theFile
		echohl None
	endif
	return delStatus
endfunction

com! Rm call DeleteFile()
com! RM call DeleteFile() <Bar> q!
:map <leader>de :call DeleteFile() <Bar> bd! <CR>
