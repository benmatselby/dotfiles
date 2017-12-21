" * User Interface
set background=dark
colorscheme desert

" have syntax highlighting in terminals which can display colours:
if has('syntax') && (&t_Co > 2)
  syntax on
endif

"show tabs, EOL etc.
set list
set lcs=tab:».    "show tabs
set lcs+=trail:· "show trailing spaces

" Set mouse support off (mouse=a for on)
set mouse=

" have fifty lines of command-line (etc) history:
set history=50
" remember all of these between sessions, but only 10 search terms; also
" remember info for 10 files, but never any on removable disks, don't remember
" marks in files, don't rehighlight old search patterns, and only save up to
" 100 lines of registers; including @10 in there should restrict input buffer
" but it causes an error for me:
set viminfo=/10,'10,r/mnt/zip,r/mnt/floppy,f0,h,\"100

" have command-line completion <Tab> (for filenames, help topics, option names)
" first list the available options and complete the longest common part, then
" have further <Tab>s cycle through the possibilities:
set wildmode=list:longest,full

" use "[RO]" for "[readonly]" to save space in the message line:
set shortmess+=r

" display the current mode and partially-typed commands in the status line:
set showmode
set showcmd

" * Text Formatting -- Specific File Formats

" enable filetype detection:
filetype on

augroup filetype
  autocmd BufNewFile,BufRead *.html set filetype=php
  autocmd BufNewFile,BufRead *.ihtml set filetype=html
  autocmd BufNewFile,BufRead *.txte set filetype=human
  autocmd BufNewFile,BufRead Capfile set filetype=ruby
augroup END

" in human-language files, automatically format everything at 72 chars:
"autocmd FileType mail,human set formatoptions+=t textwidth=72

" for C-like programming, have automatic indentation:
" autocmd FileType c,cpp,slang,php,html set cindent

" for actual C (not C++) programming where comments have explicit end
" characters, if starting a new line in the middle of a comment automatically
" insert the comment leader characters:
autocmd FileType c set formatoptions+=ro

" for Perl programming, have things in braces indenting themselves:
autocmd FileType perl set smartindent

" Standard files
autocmd FileType css,cucumber,feature,html,human,ihtml,php,python,ruby,sql,xml set smartindent expandtab shiftwidth=4 softtabstop=4

" in makefiles, don't expand tabs to spaces, since actual tab characters are
" needed, and have indentation at 8 chars to be sure that all indents are tabs
" (despite the mappings later):
autocmd FileType make set noexpandtab shiftwidth=8

" Git files
au FileType gitcommit setlocal tw=72

" * Search & Replace

" make searches case-insensitive, unless they contain upper-case letters:
set ignorecase
set smartcase

" show the `best match so far' as search strings are typed:
set incsearch

augroup php
    au BufNewFile,BufRead *.inc,*.php,*.html,*.ihtml,*.php3 set efm=%E,%C%m\ in\ %f\ on\ line\ %l,%CErrors\ parsing\ %f,%C,%Z
    au BufNewFile,BufRead *.inc,*.php,*.html,*.ihtml,*.php3 set makeprg=php\ -dlog_errors=off\ -ddisplay_errors=on\ -l\ %

    au BufWritePre *.inc,*.php,*.html,*.ihtml,*.php3 :g/\s\+$/s///g
    au BufWritePost *.inc,*.php,*.html,*.ihtml,*.php3 :make
augroup END

" Set the ruler at the bottom right hand side of the window
set ruler
