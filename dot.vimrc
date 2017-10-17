" Pathogen
execute pathogen#infect()

" Basic setup
syntax on
set expandtab
filetype plugin indent on

" Current colorscheme
set bg=light
colorscheme Monokai

" Set mapleader
let mapleader="\<Space>"
" Fonts (powerline)
set guifont=Source\ Code\ Pro\ for\ Powerline:h12
" Get rid of scrollbars
set guioptions=emg

set wrap			" show all the lines even if they overflow out of the screen
set sw=4			" shiftwidth
set ts=4			" tabstop
set number		    " show line numbers
set colorcolumn=100 " 100 columns
set nofoldenable    " disable folding
set cursorline      " highlight cursor line
set hlsearch        " highlight last search matches
set incsearch       " show matches as soon as possible
set wrapscan
set autoread        " watch for file changes by other programs
set ignorecase      " ignore case when searching
set smartcase       " ... except if there is one uppercase character
set showmatch       " show the matching bracket when inserting
set smartindent     " enable smart indentation
set nowrap          " do not split the line if it is too long
set cpoptions+=ces$ " make the 'cw' and like commands put a $ at the end
set backspace=2     " enable backspace
set scrolloff=8     " keep at least 8 lines after the cusor when scrolling
set wildmenu        " better command line completion menu

" key mapping
" --------------------------------------
" Map H and L to quickly switch tabs
nnoremap H :tabp<CR>
nnoremap L :tabn<CR>
" Map T to quickly add a new tab
nnoremap T :tabe<CR>
" Fix moving around wrapped lines
map j gj
map k gk

" vim-localvimrc
" --------------------------------------
let g:localvimrc_ask=0

" syntastic
" --------------------------------------
" Toggle the file tree of the current file
nnoremap <c-f> :TagbarToggle<CR>
" Auto open for TagBar
autocmd VimEnter * nested :call tagbar#autoopen(1)
let g:tagbar_ctags_bin = '/usr/bin/ctags'
" let g:syntastic_debug=1 " useful when debugging syntastic
" --------------------------------------
let g:syntastic_check_on_open=1
let g:syntastic_enable_signs=1
let g:syntastic_always_populate_loc_list=1
let g:syntastic_auto_loc_list=2
let g:syntastic_python_checkers=['flake8']
let g:syntastic_javascript_checkers = ['jshint']
let g:syntastic_json_checkers = ['jsonlint']
let g:syntastic_cpp_compiler_options=' -std=c++11 -stdlib=libc++'
"
au FileType javascript setl omnifunc=nodejscomplete#CompleteJS
au FileType markdown   setl omnifunc=htmlcomplete#CompleteTags formatoptions=tcroqn2 comments=n:>

" YCM
" --------------------------------------
set completeopt-=preview
let g:ycm_global_ycm_extra_conf = '~/.vim/ycm_default.py'
let g:ycm_add_preview_to_completeopt = 1
let g:ycm_confirm_extra_conf = 0
let g:ycm_register_as_syntastic_checker = 1
let g:ycm_collect_identifiers_from_tags_files = 1
let g:ycm_cache_omnifunc = 0
let g:ycm_key_detailed_diagnostics = ''
let g:ycm_key_invoke_completion = ''
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_error_symbol = 'E>'
let g:ycm_warning_symbol = 'W>'
let g:ycm_collect_identifiers_from_comments_and_strings = 1
let g:ycm_collect_identifiers_from_tags_files = 1
let g:ycm_seed_identifiers_with_syntax = 1
let g:ycm_complete_in_strings = 1

" vim-airline setup
" --------------------------------------
set laststatus=2 								" force display of status bar
let g:airline_powerline_fonts = 1 				" powerline for status bar or tabline
let g:airline#extensions#tabline#enabled = 1	" make tab looks like vim in terminal

" ctrl-p
" --------------------------------------
set runtimepath^=~/.vim/bundle/ctrlp.vim
let g:ctrlp_custom_ignore = '\v[\/](node_modules|target|dist)|(\.(sw.|ico|git|svn))$'
"let g:ctrlp_working_path_mode = 'c'

" NERDTree (removed)
" -------------------------------------------
" Close NerdTree at opening
let NERDTreeQuitOnOpen = 1
" Toggle nerd-tree
nnoremap <C-n> :NERDTreeTabsToggle<CR>
" NERDTreeIgnore (deprecated)
let NERDTreeIgnore=[]
let NERDTreeIgnore+=['\.o$[[file]]']
let NERDTreeIgnore+=['\.txt$[[file]]']
let NERDTreeIgnore+=['\.cmake$[[file]]']
let NERDTreeIgnore+=['\(\.eliomi\)\\1$[[file]]']
let NERDTreeIgnore+=['\(\.eliom\)\\1$[[file]]']
let NERDTreeIgnore+=['\(\.mli\)\\1$[[file]]']
let NERDTreeIgnore+=['\(\.ml\)\\1$[[file]]']
let NERDTreeIgnore+=['\(\.h\)\\1$[[file]]']
let NERDTreeIgnore+=['\(\.c\)\\1$[[file]]']
let NERDTreeIgnore+=['\(\.cpp\)\\1$[[file]]']
let NERDTreeIgnore+=['\(\.hpp\)\\1$[[file]]']
let NERDTreeIgnore+=['\(\.hh\)\\1$[[file]]']

" Languages configs
au FileType cpp setlocal sw=2 ts=2
au FileType python setl shiftwidth=4 softtabstop=4 tabstop=4 expandtab
au FileType * hi MatchParen cterm=bold ctermbg=none ctermfg=magenta
" Remove trailling whitespaces
autocmd FileType c,cpp,java,php,ocaml,python,javascript autocmd BufWritePre <buffer> :%s/\s\+$//e
" boost.build missing ftdetect
au BufNewFile,BufRead Jamfile.v2 setlocal filetype=bbv2
au BufNewFile,BufRead Jamroot.v2 setlocal filetype=bbv2
" Show trailing spaces
highlight WhitespaceEOL ctermbg=DarkYellow guibg=DarkYellow
" Whitespace at the end of a line. This suppresses whitespace that has just been typed.
au BufWinEnter * let w:m1=matchadd('WhitespaceEOL', '\s\+$', -1)

" Highlight cursor line
au VimEnter * hi CursorLine cterm=bold
au InsertEnter * setl nocursorline 	" do not highlight in insert mode
au InsertLeave * setl cursorline 	" highlight out of insert mode
hi CursorLine cterm=reverse ctermbg=4 guibg=#3A3A3A

" Fonts (https://coderwall.com/p/yiot4q)
set t_Co=256
set encoding=utf-8
let g:Powerline_symbols = 'fancy'
set fillchars+=stl:\ ,stlnc:\
"
if has("gui_running")
else
	set term=xterm-256color
	set termencoding=utf-8
endif
