call plug#begin()
Plug 'vimwiki/vimwiki'
Plug 'scrooloose/nerdtree'
Plug 'suan/vim-instant-markdown', {'for': 'markdown'}
call plug#end()

set nocompatible " vim settings rather than Vi

set history=50 " command history
set ruler " show cursor position at all times
set showcmd " display incomplete command
set laststatus=2 " always show status bar
set autowrite " automatically run :write before running commands
set autoread " reload files automatically when changed outside vim
set cursorline " highlight current cursor line
set visualbell

" better tab completion for filenames
set wildmenu " not yet sure what this does
set wildmode=list:longest,full

" search
set hlsearch
nnoremap <silent> <leader>, :noh<cr> " Stop highlight after searching

" Softtabs, 2 spaces
set tabstop=2
set shiftwidth=2
set shiftround
set expandtab

" Display extra whitespaces
set list listchars=tab:»·,trail:·,nbsp:·

" Make it obvious where 100 characters is
set textwidth=100

" ================ Scrolling ========================

set scrolloff=8         "Start scrolling when we're 8 lines away from margins
set sidescrolloff=15
set sidescroll=1

" Numbers
set number
set numberwidth=5

set rnu
function! ToggleNumbersOn()
    set nu!
    set rnu
endfunction
function! ToggleRelativeOn()
    set rnu!
    set nu
endfunction
autocmd FocusLost * call ToggleRelativeOn()
autocmd FocusGained * call ToggleRelativeOn()
autocmd InsertEnter * call ToggleRelativeOn()
autocmd InsertLeave * call ToggleRelativeOn()

filetype plugin indent on

" AUTOCOMMANDS - Do stuff

" Save whenever switching windows or leaving vim. This is useful when running
" the tests inside vim without having to save all files first.
au FocusLost,WinLeave * :silent! wa

" automatically rebalance windows on vim resize
autocmd VimResized * :wincmd =

"update dir to current file
autocmd BufEnter * silent! cd %:p:h

" vimwiki
let g:vimwiki_list = [{'path': '~/notes', 'syntax': 'markdown', 'ext': '.md'},
                    \ {'path': '~/personal_notes', 'syntax': 'markdown', 'ext': '.md'}]

" vim-instant-markdown
let g:instant_markdown_port = 8888
let g:instant_markdown_open_to_the_world = 1
