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
set fo=1cqmnBj

colorscheme lucius
LuciusLightHighContrast

" key behaviour
source $VIMRUNTIME/macros/matchit.vim
set backspace=2
set virtualedit=all
nnoremap <Leader>w :set invwrap<CR>:set wrap?<CR>
nnoremap gm :make<CR>:botright copen
cnoremap w!! w !sudo tee > /dev/null %
cnoremap <C-p> <Up>
cnoremap <C-n> <Down>
nnoremap <C-p> "*p
nnoremap <C-l> <C-l>:syntax sync fromstart<CR>
vnoremap <C-w><C-]> "vy:stj <C-r>v<CR>
vnoremap <C-w>} "vy:ptag <C-r>v<CR>

" search
set wrapscan
set ignorecase
set smartcase
set hlsearch
set incsearch
set diffopt+=iwhite

" command
set showcmd
set laststatus=2

" character encoding and file format
set encoding=utf-8
set fencs=utf-8,iso-2022-jp,cp932,euc-jp,gb2312,latin1
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
set cot=longest,menuone

" ruby
au FileType ruby,eruby setl omnifunc=rubycomplete#Complete

" c
au FileType c setl omnifunc=ccomplete#CompleteCpp

" xml
au FileType xml setl omnifunc=xmlcomplete#CompleteTags

" perl
au FileType perl :compiler perl
let g:perl_compiler_force_warnings = 0
au BufNewFile,BufRead *.psgi setl filetype=perl
au BufNewFile,BufRead *.mt,*.tt setl filetype=xhtml

" html/css
au BufNewFile,BufRead *.html setl filetype=xhtml
au FileType html,xhtml setl noai ts=2 sw=2 sts=2 ofu=htmlcomplete#CompleteTags
au FileType css setl omnifunc=csscomplete#CompleteCSS

" javascript
au FileType javascript setl ofu=javascriptcomplete#CompleteJS
            \| setl makeprg=jshint\ %
            \| setl efm=%f:\ line\ %l\\,\ col\ %c\\,\ %m,%-G,%-G%s\ error,%-G%s\ errors

" python
let python_highlight_all = 1
au FileType python setl ofu=pythoncomplete#Complete
            \| setl makeprg=pep8\ %
            \| setl errorformat=%f:%l:%c:\ %m

" sh
au FileType sh setl ts=4 sw=4 sts=4 noet

" php
au FileType php setl ofu=phpcomplete#CompletePHP
            \| setl makeprg=php\ -l\ %
            \| setl errorformat=%m\ in\ %f\ on\ line\ %l

" asp
let g:filetype_asp = "aspvbs"
au FileType aspvbs setl ts=4 sw=4 sts=4 noet

" go
set rtp+=$GOROOT/misc/vim
au BufNewFile,BufRead *.go setl filetype=go ts=4 sw=4 sts=4 noet
            \| setl makeprg=go\ build\ %
            \| setl errorformat=%f:%l:\ %m,%-G,%-G\#%s

" quickfix
au BufRead quickfix setl modifiable
            \| silent exe "%!perl -ple '@l = split qr{[|]}, $_, 3; $_ = $l[1] =~ qr{col} ? sprintf q{\\%s|\\%3s \\%s \\%2s|\\%s}, $l[0], split(qr{[ ]}, $l[1]), $l[2] : sprintf q{\\%s|\\%3s|\\%s}, @l'"
            \| setl nomodifiable

" markdown
au BufNewFile,BufRead *.md,*.mkd setl filetype=markdown
au FileType markdown setl pvh=3
