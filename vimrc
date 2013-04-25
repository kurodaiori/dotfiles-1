filetype plugin indent on

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
set ambiwidth=double
set fdm=marker
set tags+=tags;
set cscopetag
set fo=1cqwmnB

" key behaviour
source $VIMRUNTIME/macros/matchit.vim
set backspace=2
set virtualedit=all
nmap <Leader>w :set invwrap<CR>:set wrap?<CR>
cnoremap w!! w !sudo tee > /dev/null %
nnoremap <C-p> "*p
ia --- #--------------------------------------------------------------------#
ia TODO: TODO(shin@kojima.org):
ia XXX: XXX(shin@kojima.org):
ia FIXME: FIXME(shin@kojima.org):
nmap <C-_>s :cs find s <C-R>=expand("<cword>")<CR><CR>
nmap <C-_>g :cs find g <C-R>=expand("<cword>")<CR><CR>
nmap <C-_>c :cs find c <C-R>=expand("<cword>")<CR><CR>
nmap <C-_>t :cs find t <C-R>=expand("<cword>")<CR><CR>
nmap <C-_>e :cs find e <C-R>=expand("<cword>")<CR><CR>
nmap <C-_>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
nmap <C-_>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
nmap <C-_>d :cs find d <C-R>=expand("<cword>")<CR><CR>

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
hi Pmenu ctermbg=6
au FileType python setl omnifunc=pythoncomplete#Complete
au FileType ruby,eruby setl omnifunc=rubycomplete#Complete
au FileType html,xhtml setl omnifunc=htmlcomplete#CompleteTags
au FileType css setl omnifunc=csscomplete#CompleteCSS
au FileType xml setl omnifunc=xmlcomplete#CompleteTags
au FileType php setl omnifunc=phpcomplete#CompletePHP
au FileType c setl omnifunc=ccomplete#CompleteCpp

" perl
au FileType perl :compiler perl
let g:perl_compiler_force_warnings = 0
au BufNewFile,BufRead *.psgi setl filetype=perl
au BufNewFile,BufRead *.mt,*.tt setl filetype=xhtml

" html
au FileType html,xhtml setl ts=2 sw=2 sts=2 smc=0

" javascript
au FileType javascript setl ofu=javascriptcomplete#CompleteJS
            \| setl makeprg=jshint\ %
            \| setl efm=%f:\ line\ %l\\,\ col\ %c\\,\ %m,%-G,%-G%s\ error,%-G%s\ errors

" python
let python_highlight_all = 1

" sh
au FileType sh setl ts=4 sw=4 sts=4 noet

" php
au FileType php setl makeprg=php\ -l\ %
au FileType php setl errorformat=%m\ in\ %f\ on\ line\ %l

" asp
let g:filetype_asp = "aspvbs"
au FileType aspvbs setl ts=4 sw=4 sts=4 noet

" go
set rtp+=$GOROOT/misc/vim
au BufNewFile,BufRead *.go setl filetype=go

" auto quickfix mode
au QuickfixCmdPost vimgrep cw
au QuickfixCmdPost make cw

" markdown
au BufNewFile,BufRead *.md setl filetype=markdown

fun! DrawUnderline(c)
    let l:cr= "\n"
    try
        let l:prev = getline(line('.') - 1)
        if strlen(substitute(l:prev, '\s', '', 'g')) < 1
            throw prev_line_is_empty
        endif
        return repeat(a:c, strdisplaywidth(l:prev)) . l:cr
    catch
        return repeat(a:c, 79) . l:cr
    endt
endf

au FileType markdown setl ai tw=79
            \| ia <expr> <buffer> --- DrawUnderline('-')
            \| ia <expr> <buffer> === DrawUnderline('=')
