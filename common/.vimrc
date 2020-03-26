" User Interface
set background=dark
colorscheme desert

" have syntax highlighting in terminals which can display colours:
if has('syntax') && (&t_Co > 2)
  syntax on
endif

" show tabs, EOL etc.
set list
set lcs=tab:».    "show tabs
set lcs+=trail:· "show trailing spaces

" Set mouse support off (mouse=a for on)
set mouse=a

" have fifty lines of command-line (etc) history:
set history=50

" have command-line completion <Tab> (for filenames, help topics, option names)
" first list the available options and complete the longest common part, then
" have further <Tab>s cycle through the possibilities:
set wildmode=list:longest,full

" use "[RO]" for "[readonly]" to save space in the message line:
set shortmess+=r

" enable filetype detection:
filetype on

" Standard files
autocmd FileType css,cucumber,feature,html,human,ihtml,php,python,ruby,sql,sh,xml,zsh set smartindent expandtab shiftwidth=2 softtabstop=2

" in makefiles, don't expand tabs to spaces, since actual tab characters are
" needed, and have indentation at 8 chars to be sure that all indents are tabs
" (despite the mappings later):
autocmd FileType make set noexpandtab shiftwidth=2

" Git files
au FileType gitcommit setlocal tw=72

" make searches case-insensitive, unless they contain upper-case letters:
set ignorecase
set smartcase

" show the `best match so far' as search strings are typed:
set incsearch

" Set the ruler at the bottom right hand side of the window
set ruler
