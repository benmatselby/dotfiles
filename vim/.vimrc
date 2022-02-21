"""
" Plugin management
"""
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
call plug#begin()
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'preservim/nerdtree'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'skanehira/preview-markdown.vim'
call plug#end()


"""
" User interface
"""
colorscheme elflord

" have syntax highlighting in terminals which can display colours:
if has('syntax') && (&t_Co > 2)
  syntax on
endif


"""
" Settings
"""
set mouse=a                         " Mouse support
set history=50                      " History of commands
set wildmode=list:longest,full      " Command-line completion
set shortmess+=c                    " Don't pass messages to |ins-completion-menu|
set ruler                           " Set the ruler at the bottom right hand side of the window
set incsearch                       " Shows the match whilst typing
set hlsearch                        " Highlight found searches
set ignorecase                      " Seaching is case insensitive
set smartcase                       " ... except when the search includes capitals
set backspace=indent,eol,start      " Makes backspace key more powerful
set wrap                            " It's all about the wrapping
set softtabstop=2                   " Use 2 spaces
set shiftwidth=2                    " Use 2 spaces
set expandtab                       "
set smartindent                     "
set autoindent                      "
set showmatch                       "
set noshowmode

filetype plugin indent on           " Enable file type detection

autocmd BufWritePre * %s/\s\+$//e   " Trim whitespace on save


"""
" Mappings
"""

nnoremap <leader><space> :nohlsearch<CR>
nnoremap <leader><Left> :tabp<CR>
nnoremap <leader><Right> :tabn<CR>
cmap w!! w !sudo tee > /dev/null %  " Allows to save as sudo


"""
" Language specifics
"""

au FileType make set noexpandtab shiftwidth=2
au FileType gitcommit setlocal tw=72 spell spelllang=en_gb
au BufNewFile,BufRead *.md setlocal spell spelllang=en_gb
au BufNewFile,BufRead *.go setlocal noet ts=4 sw=4 sts=4

"""
" Plugins
"""

"""
" Nerdtree
"""
map <C-n> :NERDTreeToggle<CR>
noremap <Leader>n :NERDTreeToggle<cr>
noremap <Leader>f :NERDTreeFind<cr>
" If more than one window and previous buffer was NERDTree, go back to it.
autocmd BufEnter * if bufname('#') =~# "^NERD_tree_" && winnr('$') > 1 | b# | endif
let NERDTreeShowHidden=1


"""
" fzf
"""
nnoremap <c-p> :Files<cr>
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }
let g:fzf_layout = { 'down': '~40%' }


"""
" Airline
"""

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'


"""
" Glow Markdown
"""
let g:preview_markdown_parser = 'glow'
let g:preview_markdown_vertical = 1
let g:preview_markdown_auto_update = 1
nmap <C-m> :PreviewMarkdown right<CR>
