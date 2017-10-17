" vundle:           git clone https://github.com/gmarik/Vundle.vim.git ${HOME}/.vim/bundle/Vundle.vim
" mkdir -p $HOME/.vim/swapfiles/
" neovim location:  ~/.config/nvim/init.vim
" yarn global add js-beautify prettier
" mkdir -p $HOME/src/github.com/tobstarr/
" git clone https://github.com/tobstarr/tobstarr.github.io $HOME/src/github.com/tobstarr/tobstarr.github.io
" ln -nfs ~/src/github.com/tobstarr/tobstrarr.github.io/src/vim-snippets ~/.vim/UltiSnips
" ln -nfs ~/src/github.com/tobstarr/tobstrarr.github.io/src/vim-snippets ~/.config/nvim/UltiSnips
filetype plugin off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'mileszs/ack.vim'
Plugin 'SirVer/ultisnips'
" Plugin 'airblade/vim-gitgutter'
Plugin 'benmills/vimux'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'elzr/vim-json'
Plugin 'fatih/vim-go'
Plugin 'honza/dockerfile.vim'
Plugin 'honza/vim-snippets'
Plugin 'jamessan/vim-gnupg'
Plugin 'kien/ctrlp.vim'
Plugin 'majutsushi/tagbar'
Plugin 'morhetz/gruvbox'
Plugin 'mtth/scratch.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'slim-template/vim-slim'
Plugin 'thinca/vim-localrc'
Plugin 'toyamarinyon/vim-swift'
Plugin 'tpope/vim-abolish'
Plugin 'tpope/vim-dispatch'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-markdown'
Plugin 'tpope/vim-rake'
Plugin 'tpope/vim-rails'
Plugin 'iurifq/ctrlp-rails.vim'
Plugin 'janko-m/vim-test'
Plugin 'Quramy/tsuquyomi'
Plugin 'leafgarland/typescript-vim'
Plugin 'Shougo/vimproc.vim'
Plugin 'uarun/vim-protobuf'
Plugin 'warbear0129/vim-qtpl'
Plugin 'davidhalter/jedi-vim'
Plugin 'ElmCast/elm-vim'
Plugin 'tpope/vim-rhubarb'
"Plugin 'Valloric/YouCompleteMe'
"Plugin 'lambdatoast/elm.vim'
"Plugin 'Shougo/neocomplete'
Plugin 'mattn/emmet-vim'
Plugin 'Shougo/unite.vim'
call vundle#end()
filetype plugin indent on

"call neocomplete#util#set_default_dictionary(
"  \ 'g:neocomplete#sources#omni#input_patterns',
"  \ 'elm',
"  \ '\.')

set directory=$HOME/.vim/swapfiles/

" let g:tsuquyomi_disable_quickfix = 1
let g:syntastic_typescript_checkers = ['tsuquyomi']
let g:typescript_indent_disable = 1

" let g:ycm_semantic_triggers = {
"      \ 'elm' : ['.'],
"      \}

if has('nvim')
  :tnoremap <Esc> <C-\><C-n>
  let g:terminal_scrollback_buffer_size=100000
endif

" colorscheme gruvbox
" set background=dark

let g:vim_json_syntax_conceal = 0

let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

hi CursorLine   cterm=NONE ctermbg=lightgrey ctermfg=black guibg=darkred guifg=white
hi CursorColumn cterm=NONE ctermbg=lightgrey ctermfg=black guibg=darkred guifg=white

set t_Co=256

let g:syntastic_go_go_build_args = "-o /dev/null"

" elm
let g:elm_format_autosave = 1
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:elm_syntastic_show_warnings = 1
let g:elm_make_show_warnings = 1
"

" let g:js_fmt_autosave = 1
" let g:js_fmt_command = "jsfmt"

set relativenumber
set number " seems to work only in vim >= 7.4
set nolinebreak
set showmatch
set showcmd
set ruler
set incsearch
set backspace=indent,eol,start
set wildmenu
set wildignore+=tmp/*,*.o,*.obj,.git
set nocompatible
set nofoldenable
" set dir=/tmp
let $BASH_ENV = "~/.bash_aliases"
set shell=/bin/bash\ -l
let g:ackprg = 'rg --nocolor --nogroup --column'
let g:ctrlp_custom_ignore = '\v[\/]Godeps\/_workspace'
let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden -g ""'

command! -nargs=1 Silent execute ':silent !'.<q-args> | execute ':redraw!'

let mapleader=","

au BufRead,BufNewFile *.md setlocal textwidth=80
autocmd BufNewFile,BufRead *.ego set ft=html
autocmd BufNewFile,BufRead *.elm set ft=elm
autocmd BufNewFile,BufRead *.elm set shiftwidth=4 softtabstop=4 autoindent
autocmd BufNewFile,BufRead *.tsx set ft=typescript formatprg=prettier
autocmd BufNewFile,BufRead *.ts set ft=typescript
autocmd BufNewFile,BufRead *.qtpl set ft=html
autocmd BufNewFile,BufRead Dockerfile.* set ft=dockerfile
autocmd BufNewFile,BufRead Jenkinsfile set ft=groovy
autocmd BufNewFile,BufRead *.go set ft=go
autocmd BufNewFile,BufRead *.json set ft=json nolist tabstop=2 shiftwidth=2 expandtab autoindent
autocmd BufNewFile,BufRead *.swift set ft=swift
autocmd BufNewFile,BufRead *.md set ft=markdown noexpandtab

autocmd FileType go nnoremap <buffer> K :GoDoc<cr>
autocmd FileType go nmap ,i <Plug>(go-info)
autocmd FileType go set makeprg=make
autocmd FileType go nmap ,e <Plug>(go-rename)
autocmd FileType go set tabstop=4 shiftwidth=4
autocmd FileType go map <C-]> gd
autocmd FileType go map ,rn :GoRename<CR>
autocmd FileType go map ,d :GoDeclsDir<CR>
autocmd FileType go nnoremap <buffer> gd :GoDef<cr>
autocmd FileType go map gt :w<CR>:GoTestCompile<CR>
autocmd FileType go map ga :w<CR>:GoAlternate<CR>
autocmd FileType go map gb :w<CR>:GoBuild<CR>
autocmd FileType go map gv :w<CR>:GoVet<CR>
autocmd FileType html set expandtab tabstop=4 shiftwidth=4 autoindent
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
autocmd FileType ruby map ,d :CtrlPTag<CR>
autocmd FileType ruby map ,rm :CtrlPModel<CR>
autocmd FileType ruby map ,rc :CtrlPControllers<CR>
autocmd FileType ruby map ,rs :CtrlPSpecs<CR>
autocmd FileType ruby map ,f :!ctags -R --languages=ruby --exclude=.git --exclude=log<CR>
autocmd FileType ruby set expandtab
autocmd FileType ruby set shiftwidth=2
autocmd FileType ruby set tabstop=2
autocmd FileType make set noexpandtab nolist shiftwidth=4 tabstop=4 softtabstop=4 
" autocmd FileType typescript set makeprg=make
autocmd FileType typescript map ,rn :TsuRenameSymbol<CR>
autocmd FileType javascript.jsx,javascript setlocal formatprg=prettier\ --stdin\ --trailing-comma=all\ --no-semi
autocmd FileType html setlocal formatprg=html-beautify
autocmd FileType json setlocal formatprg=jq\ .
autocmd FileType elm map ,b :ElmMake %<CR>
autocmd FileType elm map K :ElmShowDocs<CR>
autocmd FileType elm map ,d :CtrlPTag<CR>

let g:elm_format_autosave = 1
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:elm_syntastic_show_warnings = 1

function! GenerateCtags()
  :!ctags -R --languages=ruby --exclude=.git --exclude=log .
endfunction
 
command! GenerateCtags call GenerateCtags()

" expand to current directory
cnoremap %% <C-R>=expand('%:h').'/'<CR>

nnoremap <A-a> <C-a>
map tf :TestFile<CR>
map tl :TestLast<CR>
map tn :TestNearest<CR>
map tv :TestVisit<CR>

filetype plugin on
set ignorecase
set smartcase
set hidden

set laststatus=2

set tw=0
syntax on
set history=10000
set expandtab
set tabstop=2
set shiftwidth=2
set softtabstop=2
set smartindent
set grepprg=ack
let g:ackprg = 'ag --nogroup --nocolor --column'
set vb 

set backupdir=/tmp

set gfn=Monaco:h16

map <Left> <Nop>
map <Right> <Nop>
map <Up> <Nop>
map <Down> <Nop>

scriptencoding utf-8
set encoding=utf-8

" from https://github.com/garybernhardt/dotfiles/blob/master/.vimrc#L182
function! RenameFile()
    let old_name = expand('%')
    let new_name = input('New file name: ', expand('%'), 'file')
    if new_name != '' && new_name != old_name
        exec ':saveas ' . new_name
        exec ':silent !rm ' . old_name
        redraw!
    endif
endfunction

map ,, :w<CR>:VimuxRunLastCommand<CR>
map ,. :w<CR>:Silent touch wip.run<CR>
map ,/ :VimuxRunLastCommand<CR>
map ,c :set relativenumber!<CR>:set number!<CR>
map ,ff :CtrlPClearCache<CR>
map ,g :normal gg=G<CR>
map ,l :File<CR>
map ,n :call RenameFile()<cr>
map ,p :set paste!<CR>
map ,q :q<CR>
map ,t :CtrlP .<CR>
map ,v :VimuxPromptCommand<CR>
map ,w :w<CR>
map ,x :x<CR>
map ,i :normal gggqG<CR>

command! -nargs=* Make make <args> | cwindow 3
command! -nargs=* Todoist :!td create <args><CR>

autocmd QuickFixCmdPost [^l]* nested cwindow
autocmd QuickFixCmdPost    l* nested lwindow

let g:godef_split=0
let g:go_auto_sameids=1
let g:go_fmt_command='goimports'
let g:go_autodetect_gopath = 0

" set spell spelllang=en_us
map ,s :setlocal spell!<CR>
set nohlsearch

command! File normal :echo expand('%:p')<CR>
command! ReformatJson normal :%!jq . %<CR>
command! -range AddJsonTags <line1>,<line2>normal ^vEyA `json:""crsA,omitempty"`^j
command! -range AddSQLTags <line1>,<line2>normal ^vEyA `sql:""crsA"`^j
command! -range AddXmlTags <line1>,<line2>normal ^vEyA `xml:""guawA,attr"`^j
command! -range JsonToStruct <line1>,<line2>normal ^wvi"yI" string `json:f:s` //^crmj^
command! -range StructToMap <line1>,<line2>normal vEyI"": m.Ea, CI"lcrsj^
command! -range XmlToStruct <line1>,<line2>normal ^xvt>yI" string `xml:"f>s"` //^crmj
command! -range InlineErr <line1>,<line2>normal ^wi:Iif A; err != nil {jdd
