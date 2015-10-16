"===============================================================================
"
"          File:  .vimrc
"
"   Description:
"
"   VIM Version:  7.0+
"        Author:  Hörmetjan Yiltiz (hyiltiz), hyiltiz@gmail.com
"  Organization:  Peking University, Beijing, China
"       Version:  1.0
"       Created:  10/16/15 00:18
"      Revision:  ---
"       License:  Copyright (c) 2015, Hörmetjan Yiltiz
" VERSION 0.3.1
"===============================================================================
"


"##### OS specific options, they may affect things after them ########{{{1
if has("win32")
  set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe  " Windows
  set shellslash
  source $VIMRUNTIME/mswin.vim
  set directory=$TEMP,. "for swapfile
else
  set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux
  set shell=/bin/sh
  set grepprg=grep\ -nH\ $*
  set directory=~/tmp,/tmp,$TEMP "for swapfile
"   source ~/.vim/autocorrect.vim
  endif
"}}}1
"##### Vim settings, for comfortable administration ##################{{{1
"----------------settings concerning vim to user----------------------{{{2
set nocompatible " Use Vim settings, rather than Vi settings (much better!).
set complete=.,w,b,u,U,t,i,d	" do lots of scanning on tab completion
set history=5000				" keep 3000 lines of command line history
set restorescreen=on " restore screen contents when vim exits -  disable withset t_ti= t_te=
set novisualbell
set noerrorbells
set vb t_vb=    "No visual bell or beep on errors.
if has('mouse')
  set mousehide		" Hide the mouse when typing text
  set mouse=a
endif
set maxmem=25123	" 24 MB -  max mem in Kbyte to use for one buffer.  Max is 2000000
set tags=./tags;$HOME
set autowrite					" DO automagically write on :next(default)
set backupdir=~/tmp,.,~/.vim/backup
"set noswapfile "do not use swap files
set swapfile "USE Swap files!
set updatecount=250		" switch every 250 chars, save swap
set updatetime=5000    "update every 5,000 milliseconds (5s) of no-type period
if has('persistent_undo')      "check if your vim version supports it
  set undofile                 "turn on the feature
  set undodir=$HOME/.vim/undo  "directory where the undo files will be stored
endif
set autochdir
set autoread					" read file changed outside vim
set undolevels=50		" 50 undos - saved in memory
"}}}2
"----------------settings concerning vim to file---------------------------------{{{2
set fileencoding=utf8   "encoding for new files
"set fileencodings=ucs-bom,gb18030,utf-8,gbk,default,latin1,gb2312,cp936
set fileencodings=utf-8,ucs-bom,cp936,big5,euc-jp,euc-kr,gb18030,latin1
set isfname+=32 "To have a space (ASCII 32) considered as a valid character for a file name
set expandtab
set shiftwidth=2			" shift width
set nosmarttab "inserts blanks according to 'shiftwidth'
set formatoptions+=rmMB  " mM can handle Chinese line wrapping without a additioal space needed
" set dictionary+=/usr/share/dict/words
set wrap
set digraph "use s <BS> s to enter ß


"let g:vim_markdown_folding_disabled=1
"set autoindent	 " always set autoindenting on
"let g:user_zen_mode='n'    "only enable normal mode functions.
"let g:user_zen_mode='inv'  "enable all functions, which is equal to
"let g:user_zen_mode='a'    "enable all function in all mode.
"set smartindent  "use after set autoindent
"set cindent  " strict than smartindent
"}}}2
"----------------settings concerning display-------------------------{{{2
set ruler		" show the cursor position all the time
set t_Co=256
set showcmd		" display incomplete commands
set number
set relativenumber
set showmatch
set diffopt+=vertical
set linebreak "wrap long lines visually, and where to wrap
set lazyredraw
set cmdheight=1
set matchtime=4  "Tenths of a second to show the matching paren, when 'showmatch' is set.
set hlsearch
set omnifunc=syntaxcomplete#Complete
set laststatus=2 " 0/1/2 when the last window will have a status line
set wildmenu							" menu has tab completion
set wildmode=longest:full				" *wild* mode
"set foldmethod=syntax
"set foldlevel=99
"set foldclose=all  "folds close automatically when you move out of it
"set foldenable
set scrolloff=7   " set 7 lines to the curors - when moving vertical..
set sidescrolloff=2			"keep at least 5 lines left/right
set sidescroll=2			" if wrap is off, this is fasster for horizontal scrolling
set splitright
set splitbelow
set winheight=12	" set the minimal window height
set winminheight=4	" when it's not the current window.
set equalalways		" all the windows are automatically sized same
set eadirection=both	" only equalalways for horizontally split windows
set guioptions=trfm
set statusline=\%F%m%r%h%w\ [%{&ff},%Y][%04l,%03v/%L=%p%%]\ '\%03.3b'\ %{strftime(\"%y/%m/%d-%H:%M\")}
colorscheme murphy
if has("gui_running")
if has("win32")
  set guifont=Source\ Code\ Pro:h16
else
  "set guifont=Dejavu\ Sans\ Mono\ 14
  set guifont=Droid\ Sans\ Mono\ 14
end
  set guioptions=acefigtm
  set cul
  hi CursorLine guibg=Grey10
endif
"}}}2
"----------------other internal variables---------------------------{{{2
set incsearch		" do incremental searching
set ignorecase					" search ignoring case
set showcmd							" override 'ignorecase' when pattern has upper case characters
set smartcase					" Ignore case when searching lowercase
set magic
set nrformats-=octal
set hidden
set ttyfast				" we have a fast terminal
set wildignore+=*.o,*~,.lo,*.exe,*.bak	" ignore object files
set backspace=indent,eol,start	" backspace over all kinds of things
set backup		" keep a backup file
set writebackup " only backup before overwriting
"}}}2
"----------------good though not a SET command ---------------------------------{{{2
language time C
language ctype C
language message C

" vim-plug does this already
" syntax on
" filetype plugin indent on

syntax enable
filetype plugin indent on
if has("autocmd") && exists("+omnifunc")
  autocmd Filetype *
          \	if &omnifunc == "" |
          \		setlocal omnifunc=syntaxcomplete#Complete |
          \	endif
endif
"ctags -R *
"}}}2
"}}}1
"##### Abbreviations and Mappings, not too much! #####################{{{1
abbreviate #-# ###################################################################
abbreviate =-= ===================================================================
abbreviate #=- ##=-ٍ=#=-=#=-ٍ=#=-=#=-ٍ=#=-=#=-ٍ=#=-=#=-ٍ=#=-=#=-ٍ=#=-=#=-ٍ=#=-=#=-ٍ=#=-=##



" Make shift-insert work like in Xterm
map! <S-Insert> <MiddleMouse>

" force c-u, c-w to start a new undo group
inoremap <c-u> <c-g>u<c-u>
inoremap <c-w> <c-g>u<c-w>


nnoremap <Space> @q
" correct type-o's on exit
nmap q: :q

"commented out since was overrode by NERDTree:Toggle
"map <F3> za
let c_comment_strings=1 "more highlighting for C
nmap <Leader>h :hi CursorLine guibg=Grey10<CR>

"for Ctags
"C-] - go to definition
"C-T - Jump back from the definition.
"C-W C-] - Open the definition in a horizontal split

"C-\ - Open the definition in a new tab
"A-] - Open the definition in a vertical split
map <C-\> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>
map <A-]> :vsp <CR>:exec("tag ".expand("<cword>"))<CR>

"Ctrl-Left_MouseClick - Go to definition
"Ctrl-Right_MouseClick - Jump back from definition


" SUDO A WRITE
command! W :execute ':silent w !sudo tee % > /dev/null' | :edit!
cmap w!! %!sudo tee > /dev/null %
" :w !sudo tee > /dev/null %

"load dictionary to buffer for autocompletion
 map <Leader>d :edit /usr/share/dict/words<CR> :setlocal readonly<CR> :setlocal nobuflisted<CR> <C-O>
 map <Leader>a :edit ~/.vim/autocorrect.vim<CR> :setlocal readonly<CR> :setlocal nobuflisted<CR> <C-O>

"}}}1
"##### Functions, useful stuff really ################################{{{1
"#####################################################################


" FUNCTION - DiffWithSaved {{{3
" Diff with saved version of the file
function! s:DiffWithSaved()
  let filetype=&ft
  diffthis
  vnew | r # | normal! 1Gdd
  diffthis
  exe "setlocal bt=nofile bh=wipe nobl noswf ro ft=" . filetype
endfunction
com! DiffSaved call s:DiffWithSaved()

function! StripTrailingWhitespace()
  if !&binary && &filetype != 'diff'
    normal mz
    normal Hmy
    %s/\s\+$//e
    normal 'yz<CR>
    normal `z
  endif
endfunction

function! ShowSpaces(...)
  let @/='\v(\s+$)|( +\ze\t)'
  let oldhlsearch=&hlsearch
  if !a:0
    let &hlsearch=!&hlsearch
  else
    let &hlsearch=a:1
  end
  return oldhlsearch
endfunction

function! TrimSpaces() range
  let oldhlsearch=ShowSpaces(1)
  execute a:firstline.",".a:lastline."substitute ///gec"
  let &hlsearch=oldhlsearch
endfunction

command! -bar -nargs=? ShowSpaces call ShowSpaces(<args>)
command! -bar -nargs=0 -range=% TrimSpaces <line1>,<line2>call TrimSpaces()
"nnoremap <F12>     :ShowSpaces 1<CR>
"nnoremap <S-F12>   m`:TrimSpaces<CR>``
"vnoremap <S-F12>   :TrimSpaces<CR>

" Creates a session
function! MakeSession()
  let b:sessiondir = $HOME . "/.vim/sessions" . getcwd()
  if (filewritable(b:sessiondir) != 2)
    exe 'silent !mkdir -p ' b:sessiondir
    redraw!
  endif
  let b:sessionfile = b:sessiondir . '/session.vim'
  exe "mksession! " . b:sessionfile
endfunction

" Updates a session, BUT ONLY IF IT ALREADY EXISTS
function! UpdateSession()
  if argc() == 0
    let b:sessiondir = $HOME . "/.vim/sessions" . getcwd()
    let b:sessionfile = b:sessiondir . "/session.vim"
    if (filereadable(b:sessionfile))
      exe "mksession! " . b:sessionfile
      echo "updating session"
    endif
  endif
endfunction

" Loads a session if it exists
function! LoadSession()
  if argc() == 0
    let b:sessiondir = $HOME . "/.vim/sessions" . getcwd()
    let b:sessionfile = b:sessiondir . "/session.vim"
    if (filereadable(b:sessionfile))
      exe 'source ' b:sessionfile
    else
      echo "No session loaded."
    endif
  else
    let b:sessionfile = ""
    let b:sessiondir = ""
  endif
endfunction

autocmd vimEnter * nested :call LoadSession()
autocmd vimLeave * :call UpdateSession()
map <leader>m :call MakeSession()<CR>

" A function to save word under cursor to a file
function! SaveWord()
   normal yiw
   exe ':!echo '.@0.' >> word.txt'
endfunction
map ,p :call SaveWord()

" function to delete duplicate lines
function! Del()
 if getline(".") == getline(line(".") - 1)
   norm dd
 endif
endfunction

" columnise a csv file for display only as may crop wide columns
":let width = 20
":let fill=' ' | while strlen(fill) < width | let fill=fill.fill | endwhile
":%s/\([^;]*\);\=/\=strpart(submatch(1).fill, 0, width)/ge
":%s/\s\+$//ge
" Highlight a particular csv column (put in .vimrc)
function! CSVH(x)
    execute 'match Keyword /^\([^,]*,\)\{'.a:x.'}\zs[^,]*/'
    execute 'normal ^'.a:x.'f,'
endfunction
command! -nargs=1 Csv :call CSVH(<args>)
" call with :Csv 5                             : highlight fifth column

"}}}1
"##### Plugins, vim is powerful even without them! ###################{{{1

runtime ftplugin/man.vim  " MAN RUNTIME

"vim-plug {{{2
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

" Make sure you use single quotes

Plug 'kien/ctrlp.vim'

" Group dependencies, vim-snippets depends on ultisnips
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'

Plug 'Xuyuanp/nerdtree-git-plugin'

" Using git URL
Plug 'c9s/perlomni.vim'

Plug 'Yggdroot/indentLine'
Plug 'gregsexton/gitv'

" Plugin options
"Plug 'nsf/gocode', { 'tag': 'v.20150303', 'rtp': 'vim' }
Plug 'nsf/gocode', { 'rtp': 'vim' }

" Plugin outside ~/.vim/plugged with post-update hook

Plug 'Shougo/vimproc.vim', { 'do': 'make' }
Plug 'Shougo/tabpagebuffer.vim'
Plug 'Shougo/neocomplete.vim'
Plug 'Shougo/vimshell.vim'
Plug 'Shougo/unite.vim'

Plug 'rking/ag.vim'

"Plug 'Valloric/YouCompleteMe', { 'do': './install.py' }

Plug 'nanotech/jellybeans.vim'


Plug 'mattn/gist-vim'
Plug 'mattn/emmet-vim'

" use <Leader>nr
Plug 'chrisbra/NrrwRgn'
Plug 'chrisbra/csv.vim'

Plug 'majutsushi/tagbar'

" On-demand loading
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/syntastic'

Plug 'easymotion/vim-easymotion'

"Plug 'tpope/vim-fireplace', { 'for': 'clojure' }
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'

Plug 'tpope/vim-speeddating'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-tbone'

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': 'yes \| ./install' }
Plug 'junegunn/vim-easy-align'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
Plug 'https://github.com/junegunn/vim-github-dashboard.git'
Plug 'junegunn/seoul256.vim'
Plug 'junegunn/vim-easy-align'

Plug 'lervag/vimtex'

Plug 'airblade/vim-gitgutter'
Plug 'edkolev/promptline.vim'
"Plug 'vim-scripts/YankRing.vim'
Plug 'myusuf3/numbers.vim'
Plug 'bling/vim-airline'
Plug '/jiangmiao/auto-pairs'
Plug 'jceb/vim-orgmode'



" Unmanaged plugin (manually installed and updated)
"Plug '~/my-prototype-plugin'

" Add plugins to &runtimepath
call plug#end()
"}}}2

"airline{{{1
let g:airline#extensions#tabline#enabled = 1
let g:airline_detect_paste=1
let g:airline_detect_modified=1
let g:airline#extensions#tabline#buffer_idx_mode = 1
nmap <leader>1 <Plug>AirlineSelectTab1
nmap <leader>2 <Plug>AirlineSelectTab2
nmap <leader>3 <Plug>AirlineSelectTab3
nmap <leader>4 <Plug>AirlineSelectTab4
nmap <leader>5 <Plug>AirlineSelectTab5
nmap <leader>6 <Plug>AirlineSelectTab6
nmap <leader>7 <Plug>AirlineSelectTab7
nmap <leader>8 <Plug>AirlineSelectTab8
nmap <leader>9 <Plug>AirlineSelectTab9
"}}}2

"easy-align{{{2
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)
"
" " Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)
"}}}2

"LimeLight
nmap <Leader>l <Plug>(Limelight)
xmap <Leader>l <Plug>(Limelight)

"LimeLight Goyo Integration
autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!

"Ag
let g:ag_working_path_mode="r"
" The Silver Searcher
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif
" bind K to grep word under cursor
nnoremap K :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>

"Orgmode {{{2
let g:org_todo_keywords = [['TODO(t)', '|', 'DONE(d)'],
      \ ['FIXME(m)', 'REPORT(r)', 'BUG(b)', 'KNOWNCAUSE(k)', '|', 'FIXED(f)'],
      \ ['CANCELED(c)']]
"}}}2


"neocomplete {{{2
"# Lets NOT try using YCM for now ######################################
"Note: This option must set it in .vimrc(_vimrc).  NOT IN .gvimrc(_gvimrc)!
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

" Define dictionary.
let g:neocomplete#sources#dictionary#dictionaries = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
        \ }

" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return (pumvisible() ? "\<C-y>" : "" ) . "\<CR>"
  " For no inserting <CR> key.
  "return pumvisible() ? "\<C-y>" : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
" Close popup by <Space>.
"inoremap <expr><Space> pumvisible() ? "\<C-y>" : "\<Space>"

" AutoComplPop like behavior.
"let g:neocomplete#enable_auto_select = 1

" Shell like behavior(not recommended).
"set completeopt+=longest
"let g:neocomplete#enable_auto_select = 1
"let g:neocomplete#disable_auto_complete = 1
"inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif
"let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
"let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
"let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

" For perlomni.vim setting.
" https://github.com/c9s/perlomni.vim
let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'
###################################################################
"}}}2

"YouCompleteMe
highlight YcmErrorLine guibg=#3f0000

"ctrlp{{{2
let g:ctrlp_map = '<c-s>'
let g:ctrlp_cmd = 'CtrlP'

"let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ }
let g:ctrlp_working_path_mode = 'ra'
"\ 'link': 'some_bad_symbolic_links',
"}}}2

"Unite {{{2
nnoremap <Leader>f :Unite -start-insert file<CR>
"let g:unite_source_menu_menus.git = {

    "\ 'description' : '            gestionar repositorios git
        "\                            ⌘ [espacio]g',
    "\}
"let g:unite_source_menu_menus.git.command_candidates = [
    "\['▷ tig                                                        ⌘ ,gt',
        "\'normal ,gt'],
    "\['▷ git status       (Fugitive)                                ⌘ ,gs',
        "\'Gstatus'],
    "\['▷ git diff         (Fugitive)                                ⌘ ,gd',
        "\'Gdiff'],
    "\['▷ git commit       (Fugitive)                                ⌘ ,gc',
        "\'Gcommit'],
    "\['▷ git log          (Fugitive)                                ⌘ ,gl',
        "\'exe "silent Glog | Unite quickfix"'],
    "\['▷ git blame        (Fugitive)                                ⌘ ,gb',
        "\'Gblame'],
    "\['▷ git stage        (Fugitive)                                ⌘ ,gw',
        "\'Gwrite'],
    "\['▷ git checkout     (Fugitive)                                ⌘ ,go',
        "\'Gread'],
    "\['▷ git rm           (Fugitive)                                ⌘ ,gr',
        "\'Gremove'],
    "\['▷ git mv           (Fugitive)                                ⌘ ,gm',
        "\'exe "Gmove " input("destino: ")'],
    "\['▷ git push         (Fugitive, salida por buffer)             ⌘ ,gp',
        "\'Git! push'],
    "\['▷ git pull         (Fugitive, salida por buffer)             ⌘ ,gP',
        "\'Git! pull'],
    "\['▷ git prompt       (Fugitive, salida por buffer)             ⌘ ,gi',
        "\'exe "Git! " input("comando git: ")'],
    "\['▷ git cd           (Fugitive)',
        "\'Gcd'],
    "\]
nnoremap <silent>[menu]g :Unite -silent -start-insert menu:git<CR>
"}}}2

"syntactic{{{2
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
"}}}2

"tagbar
nmap <F8> :TagbarToggle<CR>

"snippets
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<Leader>s"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"


colorscheme jellybeans
colorscheme Tomorrow-Night-Bright
colorscheme holokai
colorscheme vendetta

"vim-flake8
"Default is <F7> key for flake8-checking,
"autocmd FileType python map <buffer> <F3> :call Flake8()<CR>
"let g:flake8_builtins="_,apply"  "To add builtins, in your .vimrc:
"let g:flake8_ignore="E501,W293"  "To ignore errors, in your .vimrc:
"let g:flake8_max_line_length=99  "If you want to change the max line length for PEP8:
"let g:flake8_max_complexity=10  "To set the maximum McCabe complexity before a warning is issued:
"let g:flake8_cmd="/opt/strangebin/flake8000"  "To customize the location of your flake8 binary, set g:flake8_cmd:
autocmd BufWritePost *.py call Flake8() " to run the Flake8 check every time you write a Python file



"Vim commander
"F2 - for toggle
"F3 - view
"F4 - edit
"F5 - copy
"F6 - move
"F7 - create dir
"F8 - del
"recommended
noremap <silent> <F2> :cal VimCommanderToggle()<CR>

"tagbar
nnoremap <silent> <F9> :TagbarToggle<CR>

"netrw
"vim ftp://user@machine/path

"Pinyin Search
"I find it not working
"disable it for now
"let g:PinyinSearch_Dict = '/home/hyiltiz/.vim/bundle/PinyinSearch/PinyinSearch.dict'
"nnoremap ? :call PinyinSearch()<CR>
" I suggest use '?' to search Pinyin (since we have 'N', why using ? to search backward)
"nnoremap <Leader>pn :call PinyinNext()<CR>


"Tagbar ctags
"for Markdown
let g:tagbar_type_markdown = {
      \ 'ctagstype' : 'markdown',
      \ 'kinds' : [
      \ 'h:Heading_L1',
      \ 'i:Heading_L2',
      \ 'k:Heading_L3'
      \ ]
      \ }

"NERD tree
"map <C-n> :NERDTreeToggle<CR>
noremap <silent> <F3> :NERDTreeToggle<CR>
"close vim if the only window left open is a NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

"NerdTree git-plugin
let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ "Unknown"   : "?"
    \ }



"Yankring
let g:yankring_history_dir = "~/.vim/"

"gundo: visualize undo tree
nnoremap <F5> :GundoToggle<CR>

"c.vim vim-plugins/c-support
let g:C_CreateMenusDelayed = 'yes'
let g:C_UseTool_cmake    = 'yes'
"need additional conf. see help:csupport-doxygen-enable
"let g:C_UseTool_doxygen  = 'yes'


"}}}1
"###### Autocmd commands, Blessed! ###################################{{{1
if version >= 700
  autocmd InsertEnter * hi StatusLine guibg=#818D29 guifg=#FCFCFC gui=none
  autocmd InsertLeave * hi StatusLine guibg=#EEEEEE guifg=#363636 gui=none
endif


"vim gitary
autocmd BufRead,BufNewFile *.gitary	setfiletype gitary setlocal textwidth=72
autocmd FileType gitcommit setlocal textwidth=72 spell

"vim markdown
autocmd BufRead,BufNewFile *.text	setfiletype markdown
"autocmd FileType markdown setlocal spell


" Basic editing options
autocmd FileType text setlocal textwidth=72 " For all text files set 'textwidth' to 72 characters.
autocmd CursorHold * update "trigger update event when no key is pressed (:updatetime)
autocmd FileType html,python,vim,javascript setl shiftwidth=2 tabstop=2
autocmd FileType python setlocal et sta sw=4 sts=4 foldmethod=indent
autocmd FileType java,php setl shiftwidth=4 tabstop=4

"autocmd BufEnter *.m    compiler mlint "NOTE: this might need commenting out in
autocmd FileType matlab set foldmethod=syntax foldcolumn=2 foldlevel=33
autocmd FileType matlab map <buffer> <silent> <F5> :w<CR>:!matlab -nodesktop -nospalsh -r "try, run(which('%')), pause, end, quit" <CR>\\|<ESC><ESC>
autocmd BufReadCmd *.jar,*.xpi call zip#Browse(expand("<amatch>"))
autocmd BufRead *.lyx set syntax=lyx foldmethod=syntax foldcolumn=3
autocmd BufRead *.lyx syntax sync fromstart

autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif " JUMP TO LAST POS
autocmd BufWinLeave * call clearmatches()  " CLEARMATCHES ON BUFWINLEAVE
autocmd BufWritePre *.cpp,*.hpp,*.i,*.sh,*.m,*.py,*.conf,.vimrc :call StripTrailingWhitespace()  " STRIP TRAILING WHITESPACE
"autocmd BufWritePre * let &bex = strftime("-%m-%d-%H%M")  " SAVE BACKUPFILE AS BACKUPDIR/FILENAME-06-13-1331
" INSERT CURRENT DATE AND TIME IN A *.SH FILE WHEN WRITING IT
autocmd BufRead *.md setfiletype=markdown
autocmd BufRead,BufNewFile *.text	setfiletype markdown
autocmd BufNewFile,BufRead *.fish,*.fishrc,.fishrc,fishrc setfiletype sh
autocmd FileType tex setlocal sw=2

autocmd! BufWritePost $MYVIMRC so $MYVIMRC
autocmd! BufWritePost $MYVIMRC nested source %
autocmd BufWinLeave *.sh,*.conf,*.vim,*.c,*.md,*.markdown,*.tex,*.lyx,*.html,*.m,.vimrc mkview  " AUTOMKVIEWS
autocmd BufWinEnter *.sh,*.conf,*.vim,*.c,*.md,*.markdown,*.tex,*.lyx,*.html,*.m,.vimrc silent loadview

"augroup filetype_vim
"    autocmd!
"    autocmd FileType vim setlocal foldmethod=marker foldclose=all
"augroup END
autocmd BufRead *.md setlocal filetype=markdown spell textwidth=72 foldmethod=syntax
"}}}1
"###### VVIM TIPS / HELP / TRICKS  ###################################{{{1
"----- VIM TIPS / HELP / TRICKS FROM ARCHLINUX------------------------{{{2
" VIM TIPS / HELP / TRICKS

" BEST TRICKS

" TERMCAP HELP
" :help termcap

" :g/^\s*$/;//-1sort to sort each block of lines in a file.


" VIEW DIFF OF EDITS AGAINST BUFFER VS ORIGINAL FILE
" :w !colordiff -u % -


" INSERT CURRENT FILENAME
" :r! echo %

" DELETE TRAILING WHITESPACE
" :%s/\s\+$//

" Changing Case
" guu                             : lowercase line
" gUU                             : uppercase line
" Vu                              : lowercase line
" VU                              : uppercase line
" g~~                             : flip case line
" vEU                             : Upper Case Word
" vE~                             : Flip Case Word
" ggguG                           : lowercase entire file
" " Titlise Visually Selected Text (map for .vimrc)
" vmap ,c :s/\<\(.\)\(\k*\)\>/\u\1\L\2/g<CR>
" " Title Case A Line Or Selection (better)
" vnoremap <F6> :s/\%V\<\(\w\)\(\w*\)\>/\u\1\L\2/ge<cr> [N]
" " titlise a line
" nmap ,t :s/.*/\L&/<bar>:s/\<./\u&/g<cr>  [N]
" " Uppercase first letter of sentences
" :%s/[.!?]\_s\+\a/\U&\E/g


" :r file " read text from file and insert below current line

" :so $VIMRUNTIME/syntax/hitest.vim	  " view highlight options

"


" HELP HELP
" ---------------------------------
" :helpg pattern					  search grep!! ---  JUMP TO OTHER MATCHES WITH: >
" :help holy-grail
" :help all
" :help termcap
"  :help user-toc.txt          Table of contents of the User Manual. >
"  :help :subject              Ex-command "subject", for instance the following: >
"  :help :help                 Help on getting help. >
"  :help CTRL-B                Control key <C-B> in Normal mode. >
"  :help 'subject'             Option 'subject'. >
"  :help EventName             Autocommand event "EventName"
"  :help pattern<Tab>          Find a help tag starting with "pattern".  Repeat <Tab> for others. >
"  :help pattern<Ctrl-D>       See all possible help tag matches "pattern" at once. >
"		  :cn                         next match >
"		  :cprev, :cN                 previous match >
"		  :cfirst, :clast             first or last match >
"		  :copen,  :cclose            open/close the quickfix window; press <Enter> to jump to the item under the cursor



" SET HELP
" ---------------------------------
" :verbose set opt? - show where opt was set
" set opt!		- invert
" set invopt		- invert
" set opt&		- reset to default
" set all&		- set all to def
" :se[t]			Show all options that differ from their default value.
" :se[t] all		Show all but terminal options.
" :se[t] termcap		Show all terminal options.  Note that in the GUI the



" TAB HELP
" ---------------------------------
" tc	- create a new tab
" td	- close a tab
" tn	- next tab
" tp	- previous tab



" UPPERCASE, LOWERCASE, INDENTS
" ---------------------------------
" '.	- last modification in file!
" gf  - open file under cursor
" guu - lowercase line
" gUU - uppercase line
" =   - reindent text



" FOLDS
" ---------------------------------
" F 	- create a fold from matching parenthesis
" fm	- (zm)  more folds
" fl  - (zr) less/reduce folds
" fo	- open all folds (zR)
" fc	- close all folds (zM)
" ff  -  (zf)	- create a fold
" fd	- (zd)	- delete fold at cursor
" zF	- create a fold N lines
" zi	- invert foldenable



" KEYSEQS HELP
" ---------------------------------
" CTRL-I - forward trace of changes
" CTRL-O - backward trace of changes!
" C-W W	 - Switch to other split window
" CTRL-U		  - DELETE FROM CURSOR TO START OF LINE
" CTRL-^		  - SWITCH BETWEEN FILES
" CTRL-W-TAB  - CREATE DUPLICATE WINDOW
" CTRL-N		  - Find keyword for word in front of cursor
" CTRL-P		  - Find PREV diddo


" SEARCH / REPLACE
" ---------------------------------
" :%s/\s\+$//    - delete trailing whitespace
" :%s/a\|b/xxx\0xxx/g             modifies a b      to xxxaxxxbxxx
" :%s/\([abc]\)\([efg]\)/\2\1/g   modifies af fa bg to fa fa gb
" :%s/abcde/abc^Mde/              modifies abcde    to abc, de (two lines)
" :%s/$/\^M/                      modifies abcde    to abcde^M
" :%s/\w\+/\u\0/g                 modifies bla bla  to Bla Bla
" :g!/\S/d		      	delete empty lines in file


"  COMMANDS
" ---------------------------------
" :runtime! plugin/**/*.vim  - load plugins
" :so $VIMRUNTIME/syntax/hitest.vim	  " view highlight options
 ":so $VIMRUNTIME/syntax/colortest.vim

" :!!date - insert date
" :%!sort -u  - only show uniq (and sort)

" :r file " read text from file and insert below current line
" :v/./.,/./-1join  - join empty lines

" :e! return to unmodified file
" :tabm n  - move tab to pos n
" :jumps
" :history
" :reg   -  list registers

" delete empty lines
" global /^ *$/ delete


" MISC EXAMPLES
" ---------------------------------
"f &term =~ "xterm"| f has("terminfo")set t_Co=8 t_Sf=<Esc>[3%p1%dm t_Sb=<Esc>[4%p1%dm  els  set t_Co=8 t_Sf=<Esc>[3%dm t_Sb=<Esc>[4%dm
"set t_AB=<Esc>[%?%p1%{8}%<%t25;%p1%{40}%+%e5;%p1%{32}%+%;%dm t_AF=<Esc>[%?%p1%{8}%<%t22;%p1%{30}%+%e1;%p1%{22}%+%;%dm
"}}}2
"----- From Wikia http://www.rayninfo.co.uk/vimtips.html--------------{{{2
" keep this in the ~/.vim/doc/vimtips.txt
"}}}2
"}}}1
