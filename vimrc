filetype plugin indent on
set t_Co=256

" appearance
syntax on
set number
set ruler
set shiftwidth=4
set softtabstop=4
set tabstop=8
set expandtab
set scrolloff=3
set wildmode=list,full
set title
set fdm=marker
set tags+=tags;
set cscopetag

set fo=1cqmnB
if v:version >= 704 || has("patch550")
    set fo+=j
endif

silent! colorscheme github

" key behaviour
source $VIMRUNTIME/macros/matchit.vim
set backspace=2
set virtualedit=all
nnoremap <Leader>w :set invwrap<CR>:set wrap?<CR>
nnoremap gM :silent make\|redraw!\|:if len(getqflist())\|:botright copen 3\|else\|ccl\|endif\|cc<CR>
nnoremap gG :grep '\b<cword>\b'<CR>\|:if len(getqflist())\|:botright copen 3\|else\|ccl\|endif\|cc<CR>
cnoremap w!! w !sudo tee > /dev/null %
cnoremap <C-p> <Up>
cnoremap <C-n> <Down>
nnoremap <C-p> "*p
nnoremap <C-l> <C-l>:syntax sync fromstart<CR>
vnoremap <C-w><C-]> "vy:stj <C-r>v<CR>
vnoremap <C-w>} "vy:ptag <C-r>v<CR>
vnoremap gE s<C-r>=<C-r>"<CR><Esc>

" search
set wrapscan
set ignorecase
set smartcase
set hlsearch
set incsearch
set diffopt+=iwhite
set grepprg=git\ grep\ -n\ $*\ --\ $(git\ rev-parse\ --show-cdup)

" command
set showcmd
set laststatus=2

" character encoding and file format
set encoding=utf-8
set fencs=ucs-bom,utf-8,euc-jp,cp932,gb18030
if !empty($MAIL_EDIT)
    set fencs^=iso-2022-jp
endif
set noimdisable
set iminsert=0
set imsearch=0
set fileformat=unix

" backup
set nobackup
set noswapfile
set nowritebackup
set history=10000

" omni-completion
set cpt=t,i
set splitbelow
set cot=longest,menuone,preview

" ruby
au FileType ruby,eruby setl omnifunc=rubycomplete#Complete

" c
au FileType c setl omnifunc=ccomplete#CompleteCpp

" xml
au FileType xml setl omnifunc=xmlcomplete#CompleteTags

" perl
au FileType perl :compiler perl
            \| setl ep=perltidy
let g:perl_compiler_force_warnings = 0
let &l:path = './lib,./blib/lib,./blib/arch,' . &l:path
let $PERL5LIB = substitute(&l:path, ',', ':', 'g')
au BufNewFile,BufRead *.psgi setl filetype=perl
au BufNewFile,BufRead *.mt,*.tt setl filetype=xhtml

" html/css
au BufNewFile,BufRead *.html,*.hbs setl filetype=xhtml
au BufNewFile,BufRead *.less setl filetype=css
au FileType html,xhtml setl noai ts=2 sw=2 sts=2 ofu=htmlcomplete#CompleteTags
au FileType css setl omnifunc=csscomplete#CompleteCSS

" javascript
au FileType javascript setl ts=2 sw=2 sts=2 ofu=javascriptcomplete#CompleteJS
            \| setl makeprg=jshint\ %
            \| setl efm=%f:\ line\ %l\\,\ col\ %c\\,\ %m,%-G,%-G%s\ error,%-G%s\ errors

" python
let python_highlight_all = 1
au FileType python setl ofu=pythoncomplete#Complete
            \| setl makeprg=pep8\ %
            \| setl errorformat=%f:%l:%c:\ %m

" sh
let g:is_bash = 1
au FileType sh setl ts=4 sw=4 sts=4 noet

" php
au FileType php setl ofu=phpcomplete#CompletePHP
            \| setl makeprg=phpcs\ --report=csv\ --standard=PSR2\ %\ \\\\|tail\ -n\ +2
            \| setl efm=\"%f\"\\,%l\\,%c\\,%t%*[a-zA-Z]\\,\"%m\"\\,%*[a-zA-Z0-9_.-]\\,%*[0-9]

" asp
let g:filetype_asp = "aspvbs"
au FileType aspvbs setl ts=4 sw=4 sts=4 noet

" go
let g:goroot = substitute(system('go env GOROOT'), '\n$', '', '')
if g:goroot != ''
    let &rtp = g:goroot . '/misc/vim,' . &rtp
endif
au BufNewFile,BufRead *.go setl filetype=go ts=4 sw=4 sts=4 noet
            \| setl makeprg=go\ fmt\ %
            \| setl errorformat=%f:%l:%c:\ %m,%-G,%-G\#%s,%-Gexit\ status\ %s

" quickfix
au BufRead quickfix setl modifiable
            \| silent exe "%!perl -ple '
                \my ($file, $pos, $msg) = split qr{[|]}, $_, 3;
                \my $aligned_pos = sub {
                \  my @p = split qr{[ ]}, shift;
                \  return                                        if @p == 0;
                \  return sprintf q{\\%3s}, @p                   if @p == 1;
                \  return sprintf q{\\%3s \\%s}, @p              if @p == 2;
                \  return sprintf q{\\%3s \\%s \\%2s}, @p        if @p == 3;
                \  return sprintf q{\\%3s \\%s \\%2s \\%-8s}, @p if @p == 4;
                \  return join q{ }, @p;
                \}->($pos);
                \$_ = join q{|}, $file, $aligned_pos, $msg;
            \'"
            \| setl nomodifiable

" markdown
au BufNewFile,BufRead *.md,*.mkd setl filetype=markdown
au FileType markdown setl pvh=3
