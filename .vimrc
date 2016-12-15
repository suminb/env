" vim:ft=vim:et:ts=2:sw=2:sts=2:

" vundle requires
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/Vundle.vim'
" plugins ---------------------------------------------------------------------

" syntax highlighters
Plugin 'plasticboy/vim-markdown'
Plugin 'Jinja'
Plugin 'othree/html5.vim'
if version < 704
  Plugin 'JulesWang/css.vim'
endif
Plugin 'cakebaker/scss-syntax.vim'
Plugin 'stephpy/vim-yaml'

" function extensions
Plugin 'scrooloose/syntastic'
Plugin 'tpope/vim-commentary'
Plugin 'sjl/gundo.vim'
Plugin 'rhysd/committia.vim'
Plugin 'Valloric/YouCompleteMe'

" Python extensions
Plugin 'fisadev/vim-isort'

Plugin 'tpope/vim-obsession'

" File browsing
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'

" Searching
Plugin 'kien/ctrlp.vim'

" Git integration
Plugin 'tpope/vim-fugitive'

"Powerline
Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}


" -----------------------------------------------------------------------------
" vundle requires
call vundle#end()
filetype plugin indent on

" Syntax highlighting.
syntax on

" Softtab -- use spaces instead tabs.
set expandtab
set tabstop=4 shiftwidth=4 sts=4
set autoindent
highlight HardTab cterm=underline
autocmd BufWinEnter * 2 match HardTab /\t\+/

" I dislike CRLF.
set fileformat=unix

" Make backspace works like most other applications.
set backspace=2

" Detect modeline hints.
set modeline

" Prefer UTF-8.
set encoding=utf-8 fileencodings=ucs-bom,utf-8,cp949,korea,iso-2022-kr

" Ignore case in searches.
set ignorecase

" Highlight searching keyword
set hlsearch

" Keep 80 columns and dense lines.
set colorcolumn=81
highlight ColorColumn cterm=underline ctermbg=none
autocmd BufWinEnter * match Error /\%>80v.\+\|\s\+$\|^\s*\n\+\%$/

" Some additional syntax highlighters.
au! BufRead,BufNewFile *.wsgi setfiletype python
au! BufRead,BufNewFile *.sass setfiletype sass
au! BufRead,BufNewFile *.haml setfiletype haml
au! BufRead,BufNewFile *.less setfiletype less
au! BufRead,BufNewFile *go setfiletype golang
au! BufRead,BufNewFile *rc setfiletype conf

" These languages have their own tab/indent settings.
au FileType cpp        setl ts=2 sw=2 sts=2
au FileType javascript setl ts=2 sw=2 sts=2
au FileType ruby       setl ts=2 sw=2 sts=2
au FileType xml        setl ts=2 sw=2 sts=2
au FileType yaml       setl ts=2 sw=2 sts=2
au FileType html       setl ts=2 sw=2 sts=2
au FileType htmldjango setl ts=2 sw=2 sts=2
au FileType lua        setl ts=2 sw=2 sts=2
au FileType haml       setl ts=2 sw=2 sts=2
au FileType css        setl ts=2 sw=2 sts=2
au FileType sass       setl ts=2 sw=2 sts=2
au FileType less       setl ts=2 sw=2 sts=2
au Filetype rst        setl ts=3 sw=3 sts=3
au FileType golang     setl noet
au FileType make       setl ts=4 sw=4 sts=4 noet

" Markdown-related configurations.
augroup mkd
  autocmd BufRead *.markdown set formatoptions=tcroqn2 comments=n:> spell
  autocmd BufRead *.mkdn     set formatoptions=tcroqn2 comments=n:> spell
  autocmd BufRead *.mkd      set formatoptions=tcroqn2 comments=n:> spell
augroup END

" English spelling checker.
setlocal spelllang=en_us

" Pathogen
silent! call pathogen#infect()

" Syntastic
autocmd VimEnter *
\ if exists(':SyntasticCheck')
\|  let g:syntastic_cpp_compiler_options = ' -std=c++11'
\|  let g:syntastic_python_checkers=['flake8']
\|  let g:syntastic_python_flake8_args='--ignore=E301'
\|  cabbrev E Explore
\|endif

" Gundo
autocmd VimEnter *
\ if exists(':Gundo')
\|  nnoremap <F5> :GundoToggle<CR>
\|endif

" YouCompleteMe
autocmd VimEnter *
\ if exists('g:ycm_goto_buffer_command')
\|  let g:ycm_goto_buffer_command = 'new-tab'
\|  nnoremap <F12> :YcmCompleter GoToDefinition<CR>
\|endif

" NetRW tree style listing
let g:netrw_liststyle = 3

colorscheme maui

" Split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree

