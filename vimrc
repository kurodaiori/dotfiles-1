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
set fo=1tcqwmnB

" key behaviour
set backspace=2
set virtualedit=all
map <Leader>w :set invwrap<CR>:set wrap?<CR>
imap <C-f> <C-x><C-o>
cmap w!! w !sudo tee > /dev/null %
nnoremap <C-p> "*p
:ab <html> <html><CR><Tab><head><CR><Tab><meta http-equiv="Content-Type" content="text/html; charset=utf-8" /><CR><title>Site Title</title><CR><BS></head><CR><body><CR></body><CR><BS></html><Esc>:set ft=html<CR>4k4w
:ab --- #--------------------------------------------------------------------#
:ab TODO: TODO(shin@kojima.org):
:ab XXX: XXX(shin@kojima.org):
:ab FIXME: FIXME(shin@kojima.org):
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
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType ruby,eruby setlocal omnifunc=rubycomplete#Complete
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html,xhtml setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
autocmd FileType php setlocal omnifunc=phpcomplete#CompletePHP
autocmd FileType c setlocal omnifunc=ccomplete#CompleteCpp

" perl
autocmd FileType perl :compiler perl
let g:perl_compiler_force_warnings = 0
au BufNewFile,BufRead *.psgi setlocal filetype=perl
au BufNewFile,BufRead *.mt setlocal filetype=html

" html
autocmd FileType html,xhtml setlocal ts=2 sw=2 sts=2

" python
let python_highlight_all = 1

" sh
autocmd FileType sh setlocal ts=4 sw=4 sts=4 noet

" auto quickfix mode
autocmd QuickfixCmdPost vimgrep cw
