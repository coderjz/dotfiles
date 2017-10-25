set nocompatible
filetype off                  " required for Vundle


set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

"Plugin list
Plugin 'VundleVim/Vundle.vim'
Plugin 'mileszs/ack.vim'
Plugin 'chrisbra/csv.vim'
Plugin 'kien/ctrlp.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'python-mode/python-mode'
Plugin 'vim-syntastic/syntastic'
Plugin 'majutsushi/tagbar'
Plugin 'vim-airline/vim-airline'
Plugin 'Valloric/YouCompleteMe'
Plugin 'easymotion/vim-easymotion'
Plugin 'tpope/vim-speeddating'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'alvan/vim-closetag' "Automatically close HTML tags
Plugin 'will133/vim-dirdiff' "For diffs with :DirDiff

"Language specific
Plugin 'fatih/vim-go'             "golang
Plugin 'pangloss/vim-javascript'  "React / JavaScript
Plugin 'othree/yajs.vim'          "es6
Plugin 'mxw/vim-jsx'              "jsx
Plugin 'ternjs/tern_for_vim'      "javascript
Plugin 'leafgarland/typescript-vim'  "typescript
Plugin 'Quramy/tsuquyomi'  "typescript
Plugin 'posva/vim-vue'  "Vue JS

call vundle#end()

filetype plugin indent on
syntax on
set ai
colorscheme torte
set background=dark
set autoindent
set hlsearch
set showmatch
set backspace=indent,eol,start
set cul
set laststatus=2 "Always display status line
set expandtab
set tabstop=4       " numbers of spaces of tab character
set shiftwidth=4
set shiftround
set autoread
set clipboard=unnamed
set wildmenu
set wildmode=longest,list,full
set nrformats-=octal
set number

"Two lines below
if !&scrolloff
    set scrolloff=2
endif

"For asian characters
set enc=utf-8
set guifontwide=NSimsun:h12

if &history < 1000
    set history=1000
endif

"C-L will remove the highlighting on serach
if maparg('<C-L>', 'n') ==# ''
    nnoremap <silent> <C-L> :nohlsearch<CR><C-L>
endif

"Keyboard remaps
nmap <F2> :SemanticHighlightToggle<CR>
"
autocmd FileType go nmap <F3> :GoTestFunc<CR>
"Formatting full file
map <F4> mzgg=G`z
map <C-T> :tabnew<CR>
map <C-Q> :tabclose<CR>



"Make space leader
let mapleader = "\<Space>"

"Configure syntastic
let g:syntastic_check_on_open=1
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_aggregate_errors=1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_wq = 0

let g:syntastic_error_symbol = 'x'
let g:syntastic_warning_symbol = '>'
let g:syntastic_style_error_symbol = '~'
let g:syntastic_style_warning_symbol = '!'

let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_typescript_checkers = ['tslint']
let g:syntastic_sh_checkers = ['shellcheck']


"let g:tsuquyomi_disable_quickfix = 1
""let g:syntastic_typescript_checkers = ['tsuquyomi'] " You shouldn't use 'tsc' checker.




" CTRL P
nmap <Leader>p :CtrlPBuffer<CR>
let g:ctrlp_custom_ignore = 'build'
let g:ctrlp_working_path_mode = ''


" Semantic highlighting
:nnoremap <Leader>s :SemanticHighlightToggle<cr>

" NERD tree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
" ctrl-N to toggle nerd tree
nmap <C-N> :NERDTreeToggle<CR>

" Tagbar Toggle  (requires ctags setup)
nmap <C-b> :TagbarToggle<CR>

"Ack
"Always use Ack!, which will NOT by default open the first result in my window
"Requires ack tool to be installed and on path
cnoreabbrev Ack Ack!

"vim-closetag: Control the filenames that will automatically close tags 
let g:closetag_filenames = "*.html,*.xhtml,*.vue"

"Vim-JSX - allow JSX on JavaScript files
let g:jsx_ext_required = 0


"Ulti snippets
let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<c-l>"
let g:UltiSnipsJumpBackwardTrigger="<c-h>"

"Map ; character to : so i stop pressing shift so often
"http://vim.wikia.com/wiki/Map_semicolon_to_colon
map ; :

"Let <space>j be go to definition (requires ctags setup)
nmap <Leader>j <C-]>
"Let <space>k be to go back from definition (requires ctags setup)
nmap <leader>k <C-t>
"Let <space>w be to change windows
nmap <Leader>w <C-w><C-w>

":set paste allows for proper/sane pasting with Command-V
"But it breaks YouCompleteMe, so map it to <F10>
:set pastetoggle=<F10>


"To format JSON in vim
"Usage  :FormatJSON
"Source: https://coderwall.com/p/faceag/format-json-in-vim
com! FormatJSON %!python -m json.tool

" vim-go configuration
let g:go_fmt_command = "goimports"
let g:go_highlight_types = 1
let g:go_metalinter_autosave = 1




"Integrate tagbar with gotags
"https://github.com/jstemmer/gotags
let g:tagbar_type_go =
            \ {  'ctagstype' : 'go',
            \ 'kinds'     : [
            \ 'p:package',
            \ 'i:imports:1',
            \ 'c:constants',
            \ 'v:variables',
            \ 't:types',
            \ 'n:interfaces',
            \ 'w:fields',
            \ 'e:embedded',
            \ 'm:methods',
            \ 'r:constructor',
            \ 'f:functions'
            \ ],
            \ 'sro' : '.',
            \ 'kind2scope' : {
            \ 't' : 'ctype',
            \ 'n' : 'ntype'
            \ },
            \ 'scope2kind' : {
            \ 'ctype' : 't',
            \ 'ntype' : 'n'
            \ },
            \ 'ctagsbin'  : 'gotags',
            \ 'ctagsargs' : '-sort -silent'
            \ }


"Avoid pressing escape all the time!
:imap <ESC> <nop>
:inoremap jj <ESC>


".vue requires tabspacing of 2
au FileType vue setl shiftwidth=2 tabstop=2 
