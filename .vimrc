" This is mostly copied from https://github.com/sublee/sub.sh

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

" Powerline
Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}

"Async linter
Plugin 'w0rp/ale'

Plugin 'integralist/vim-mypy'

"Golang plugin
Plugin 'fatih/vim-go'

" TypeScript syntax highlighting
Plugin 'leafgarland/typescript-vim'

Plugin 'junegunn/fzf'
Plugin 'junegunn/fzf.vim'


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

" Avoid using CRLF.
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
  let g:vim_markdown_folding_disabled = 1
augroup END

" English spelling checker.
setlocal spelllang=en_us

" Pathogen
silent! call pathogen#infect()

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

" For some reason, arrow keys and mouse inputs insert A, B, C, D letters
" This is a workaround that I found on
" http://vim.wikia.com/wiki/Fix_arrow_keys_that_display_A_B_C_D_on_remote_shell
nmap OA k
nmap OB j
nmap OC l
nmap OD h


" Split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

nnoremap <C-[> :cprev<CR>
nnoremap <C-]> :cnext<CR>

nnoremap <C-P> :call fzf#vim#files('', fzf#vim#with_preview('right'))<CR><CR>
if executable('rg')
  command! -bang -nargs=* Rg
          \ call fzf#vim#grep('rg ' .
          \   '--color=always ' .
          \   '--glob "!.git/*" ' .
          \   '--ignore-case ' .
          \   '--line-number ' .
          \   '--column ' .
          \   '--no-heading ' .
          \   '--hidden ' .
          \   '--ignore-file=.gitignore ' .
          \   '--follow ' .
          \   <q-args>, 1,
          \   fzf#vim#with_preview('right:50%'),
          \   <bang>0)
endif

let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree

" NOTE: For some reason, the vim-xkbswitch plugin does not work as intended.
" We will come back to this issue in the future.
"
" Plugin 'lyokha/vim-xkbswitch'
" let g:XkbSwitchEnabled = 1
" let g:XkbSwitchLib = '/usr/local/lib/libInputSourceSwitcher.dylib'
" let g:XkbSwitchAssistNKeymap = 1
" let g:XkbSwitchNLayout = 'us'

" NOTE: Instead of using vim-xkbswitch plugin, we will use the following
" method
if has('macunix') && filereadable('/usr/local/lib/libInputSourceSwitcher.dylib')
  " According to :help i_CTRL-C,
  "
  " CTRL-C  Quit insert mode, go back to Normal mode.  Do not check for
  "         abbreviations.  Does not trigger the |InsertLeave| autocommand
  "         event.
  "
  " And therefore we need to map <C-C> to <Esc>. This is primarily for my new
  " MacBook Pro that comes with a TouchBar (and a virtual ECS key)
  ino <C-C> <Esc>

  " This input source switcher requires:
  " https://github.com/vovkasm/input-source-switcher
  autocmd InsertLeave * call
    \ libcall('/usr/local/lib/libInputSourceSwitcher.dylib',
      \  'Xkb_Switch_setXkbLayout', 'com.apple.keylayout.US')
endif
