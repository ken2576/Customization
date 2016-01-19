set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
"Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
"Plugin 'L9'
" Git plugin not hosted on GitHub
"Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
"Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
"Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Avoid a name conflict with L9
"Plugin 'user/L9', {'name': 'newL9'}

"Plugin YouCompleteMe

"Plugin 'Valloric/YouCompleteMe'

"Plugin Supertab

"Plugin 'ervandew/supertab'

"Plugin Vim-sensible

Plugin 'tpope/vim-sensible'

"Plugin NERDtree

Plugin 'scrooloose/nerdtree'

"Plugin vim-javascript-syntax

"Plugin 'jelera/vim-javascript-syntax'

"Plugin Tagbar

Plugin 'majutsushi/tagbar'

"Plugin YCM generator

"Plugin 'rdnetto/YCM-Generator'

"Plugin HTML5

"Plugin 'othree/html5.vim'

"Plguin Javascript

"Plugin 'pangloss/vim-javascript'

"Plugin indent

Plugin 'ciaranm/detectindent'

"Plugin unite

Plugin 'Shougo/unite.vim'

Plugin 'altercation/vim-colors-solarized'

Plugin 'octol/vim-cpp-enhanced-highlight'

Plugin 'bling/vim-airline'

Plugin 'terryma/vim-multiple-cursors'

"Plugin 'mxw/vim-jsx'

Plugin 'easymotion/vim-easymotion'

Plugin 'Shougo/neomru.vim'

Plugin 'Shougo/vimproc.vim'

"Plugin 'scrooloose/syntastic'

"Plugin 'mbbill/undotree'

Plugin 'Shougo/neocomplete.vim'

"Plugin 'honza/vim-snippets'

Plugin 'Shougo/neosnippet'

Plugin 'Shougo/neosnippet-snippets'

Plugin 'tpope/vim-fugitive'

Plugin 'myusuf3/numbers.vim'

Plugin 'vasconcelloslf/vim-interestingwords'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

nmap <F8> :TagbarToggle<CR>
nmap <F5> :NERDTreeToggle<CR>
"nmap <F4> :UndotreeToggle<CR>
set tabstop=8 softtabstop=0 expandtab shiftwidth=4 smarttab

set tags=./tags,../tags
set number
hi Visual ctermfg=brown ctermbg=gray gui=bold guifg=brown guibg=gray

let g:cpp_class_scope_highlight = 1
let g:jsx_ext_required = 0
let g:neocomplete#enable_at_startup = 1

match ErrorMsg '\s\+$'

"Unite
call unite#filters#matcher_default#use(['matcher_fuzzy'])
call unite#filters#sorter_default#use(['sorter_rank'])
"call unite#custom#source('file_rec/async','sorters','sorter_rank', )
"" replacing unite with ctrl-p
let g:unite_data_directory='~/.vim/.cache/unite'
let g:unite_enable_start_insert=1
let g:unite_source_history_yank_enable=1
let g:unite_prompt='» '
let g:unite_split_rule = 'botright'
if executable('ag')
    let g:unite_source_grep_command='ag'
    let g:unite_source_grep_default_opts='--nocolor --nogroup -S -C4'
    let g:unite_source_grep_recursive_opt=''
endif
nnoremap <silent> <C-p> :Unite -auto-resize file file_mru file_rec<cr>
nnoremap <Leader>f :<C-u>Unite -buffer-name=files -start-insert file<CR>
nnoremap <leader>r :<C-u>Unite -buffer-name=line -start-insert line<cr>
nnoremap <space>s :Unite -quick-match buffer<cr>

nnoremap <Leader>rtw :%s/\s\+$//e<CR>

"Plugin key-mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
imap <expr><TAB>
\ pumvisible() ? "\<C-n>" :
\ neosnippet#expandable_or_jumpable() ?
\    "\<TAB>" : "\<Plug>(neosnippet_expand_or_jump)"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

" Tell Neosnippet about the other snippets
let g:neosnippet#snippets_directory='~/.vim/bundle/vim-snippets/snippets'

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Exclusion for Numbers
let g:numbers_exclude = ['tagbar',  'unite', 'nerdtree', 'undotree', 'diffpanel']

" Syntastic
let g:syntastic_cpp_check_header = 1

" Toggle Numbers
nnoremap <F3> :NumbersToggle<CR>
nnoremap <F2> :NumbersOnOff<CR>

set background=dark
colorscheme solarized
