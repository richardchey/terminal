" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

Plug 'fatih/vim-go'
Plug 'SirVer/ultisnips'
Plug 'Valloric/YouCompleteMe'
Plug 'vim-syntastic/syntastic'
Plug 'tpope/vim-surround'
Plug 'jiangmiao/auto-pairs'
Plug 'majutsushi/tagbar'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-git'
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'kien/ctrlp.vim'
Plug 'ludovicchabant/vim-gutentags'
Plug 'vim-php/tagbar-phpctags.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-unimpaired'
Plug 'shawncplus/phpcomplete.vim'
Plug 'ervandew/supertab'
Plug 'scrooloose/nerdcommenter'


" Initialize plugin system
call plug#end()



" set mapleader
let mapleader = "\<Space>"


" vim-go custom mappings
au FileType go nmap <Leader>s <Plug>(go-implements)
au FileType go nmap <Leader>i <Plug>(go-info)
au FileType go nmap <Leader>gd <Plug>(go-doc)
au FileType go nmap <Leader>gv <Plug>(go-doc-vertical)
au FileType go nmap <leader>r <Plug>(go-run)
au FileType go nmap <leader>b <Plug>(go-build)
au FileType go nmap <leader>t <Plug>(go-test)
au FileType go nmap <leader>c <Plug>(go-coverage)
au FileType go nmap <Leader>ds <Plug>(go-def-split)
au FileType go nmap <Leader>dv <Plug>(go-def-vertical)
au FileType go nmap <Leader>dt <Plug>(go-def-tab)
au FileType go nmap <Leader>e <Plug>(go-rename)


" vim-go settings
let g:go_fmt_command = "goimports"
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_operators = 1
colorscheme slate


" YCM settings
let g:ycm_complete_in_strings = 0
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']

" let g:ycm_filetype_specific_completion_to_disable = {
"      \ 'gitcommit': 1,
"      \ 'php': 1
"      \}

nnoremap <leader>jd :YcmCompleter GoToDefinitionElseDeclaration<CR>


" UltiSnips settings
let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"


" supertab
let g:SuperTabDefaultCompletionType = "<c-x><c-o>"

autocmd FileType php setlocal completefunc=phpcomplete#CompletePHP



" syntastic
" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*
"
" let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_auto_loc_list = 1
" let g:syntastic_check_on_open = 1
" let g:syntastic_check_on_wq = 0

autocmd FileType go autocmd BufWritePre <buffer> Fmt


" nerdcommenter
let g:NERDSpaceDelims = 1
let g:NERDCompactSexyComs = 1
let g:NERDDefaultAlign = 'left'
let g:NERDCommentEmptyLines = 1
let g:NERDTrimTrailingWhitespace = 1



" tagbar
nmap <F9> :TagbarToggle<CR>
let g:tagbar_type_go = {
    \ 'ctagstype' : 'go',
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


" nerdtree
nmap <F8> :NERDTreeToggle<CR>



" gutentags
let g:gutentags_cache_dir = '~/.vim/gutentags'
let g:gutentags_ctags_exclude = ['*.css', '*.html', '*.js', '*.json', '*.xml',
                            \ '*.phar', '*.ini', '*.rst', '*.md',
                            \ '*vendor/*/test*', '*vendor/*/Test*',
                            \ '*vendor/*/fixture*', '*vendor/*/Fixture*',
                            \ '*var/cache*', '*var/log*']


" airline
set laststatus=2
if !has('gui_running')
  set t_Co=256
endif
set noshowmode
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme = 'behelit'



" ctrlp
let g:ctrlp_clear_cache_on_exit = 0

" supertab
let g:SuperTabDefaultCompletionType = "<c-x><c-o>"


"remember last update or view postion"
 " Only do this part when compiled with support for autocommands 
 if has("autocmd")
 " In text files, always limit the width of text to 78 characters 
 autocmd BufRead *.txt set tw=78
 " When editing a file, always jump to the last cursor position 
 autocmd BufReadPost *
 \ if line("'\"") > 0 && line ("'\"") <= line("$") |
 \ exe "normal g'\"" |
 \ endif
 endif

 
set incsearch number noexpandtab
set showmatch  matchtime=1 completeopt=longest,menu
autocmd FileType go set sw=8 ts=8 sts=8
autocmd FileType php,python,c,java,perl,shell,bash,vim,ruby,cpp set sw=4 ts=4 sts=4
autocmd FileType html,css,xml,yaml,javascript set sw=2 ts=2 sts=2


set pastetoggle=<F10>
