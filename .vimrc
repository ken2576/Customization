set nocompatible              " be iMproved, required

" vim-plug (https://github.com/junegunn/vim-plug) settings
" Automatically install vim-plug and run PlugInstall if vim-plug not found
if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
                \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

"Plug Vim-sensible

Plug 'tpope/vim-sensible'

"Plug NERDtree

Plug 'scrooloose/nerdtree'

"Plug Tagbar

Plug 'majutsushi/tagbar'

"Plug HTML5

Plug 'othree/html5.vim'

"Plug indent

Plug 'ciaranm/detectindent'

"Plug unite

Plug 'Shougo/unite.vim'

Plug 'altercation/vim-colors-solarized'

Plug 'octol/vim-cpp-enhanced-highlight'

Plug 'bling/vim-airline'

Plug 'terryma/vim-multiple-cursors'

Plug 'mxw/vim-jsx'

Plug 'easymotion/vim-easymotion'

Plug 'Shougo/neomru.vim'

Plug 'Shougo/vimproc.vim'

Plug 'scrooloose/syntastic'

Plug 'Shougo/neocomplete.vim'

Plug 'honza/vim-snippets'

Plug 'Shougo/neosnippet'

Plug 'Shougo/neosnippet-snippets'

Plug 'tpope/vim-fugitive'

Plug 'myusuf3/numbers.vim'

Plug 'vasconcelloslf/vim-interestingwords'

Plug 'vim-airline/vim-airline-themes'

call plug#end()

nmap <F8> :TagbarToggle<CR>
nmap <F5> :NERDTreeToggle<CR>

set tabstop=8 softtabstop=0 expandtab shiftwidth=4 smarttab

set tags=./tags,../tags
set number

"Custom highlight
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
" imap <expr><TAB>
" \ pumvisible() ? "\<C-n>" :
" \ neosnippet#expandable_or_jumpable() ?
" \    "\<TAB>" : "\<Plug>(neosnippet_expand_or_jump)"
" smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
" \ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

" Tell Neosnippet about the other snippets
let g:neosnippet#snippets_directory='~/.vim/bundle/vim-snippets/snippets'

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Exclusion for Numbers
let g:numbers_exclude = ['tagbar',  'unite', 'nerdtree', 'diffpanel']

" Syntastic
let g:syntastic_cpp_check_header = 1

" Toggle Numbers
nnoremap <F3> :NumbersToggle<CR>
nnoremap <F2> :NumbersOnOff<CR>

set background=dark
colorscheme solarized
