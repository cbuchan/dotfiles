" Collin Buchan

" Colors
syntax on
set background=dark
colorscheme solarized

" Launch Config

set nocompatible
filetype off

if has('nvim')
  call plug#begin('~/.local/share/nvim/plugged')
else
  call plug#begin('~/.vim/plugged')
endif

Plug 'SirVer/ultisnips'
Plug 'ap/vim-css-color'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'honza/vim-snippets'
Plug 'itchyny/lightline.vim'
Plug 'jparise/vim-graphql'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'ntpeters/vim-better-whitespace'
Plug 'prettier/vim-prettier', {'do': 'yarn install'}
Plug 'sheerun/vim-polyglot'
Plug 'szw/vim-ctrlspace'
Plug 'terryma/vim-multiple-cursors'
Plug 'tmhedberg/matchit'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'w0rp/ale'

if has('nvim')
  Plug 'HerringtonDarkholme/yats.vim'
  Plug 'othree/yajs.vim'
  Plug 'Shougo/deoplete.nvim'
  Plug 'Shougo/denite.nvim'
  Plug 'mhartington/nvim-typescript', {'do': './install.sh'}
endif

call plug#end()

filetype plugin indent on

" Plugin configuration
if has('nvim')
  "let g:python_host_prog = '/usr/local/bin/python'
  let g:python_host_prog = '/Users/collin/.pyenv/versions/neovim2/bin/python'
  let g:python3_host_prog = '/Users/collin/.pyenv/versions/neovim3/bin/python'
  let g:ruby_host_prog = '~/.rvm/gems/ruby-2.6.3/bin/neovim-ruby-host'
  let g:deoplete#enable_at_startup = 1
  "let g:polyglot_disabled = ['javascript', 'typescript']
  let g:nvim_typescript#diagnostics_enable = 1

  call deoplete#custom#source('ale', 'rank', 999)
endif

" Spaces & Tabs
set tabstop=2
set softtabstop=2
set expandtab
set smarttab

" Go to tab by number
noremap <leader>1 1gt
noremap <leader>2 2gt
noremap <leader>3 3gt
noremap <leader>4 4gt
noremap <leader>5 5gt
noremap <leader>6 6gt
noremap <leader>7 7gt
noremap <leader>8 8gt
noremap <leader>9 9gt
noremap <leader>0 :tablast<cr>

nmap <tab> gt
nmap <s-tab> gT

" Go to last active tab
let g:lasttab = 1
nmap <silent> <c-t> :exe "tabn ".g:lasttab<CR>
au TabLeave * let g:lasttab = tabpagenr()

" Copy current file to clipboard
nmap <Space>cc :let @*=expand("%")<CR>

" Copy current file to clipboard
nmap <Space>ww :CtrlSpaceSaveWorkspace<CR>

" UI Config
set nu
set showcmd
set nocursorcolumn
set nocursorline
set norelativenumber
syntax sync minlines=256

set lazyredraw
set ttyfast
"let loaded_matchparen = 1

filetype on
filetype indent on
filetype plugin on

set wildmenu
set showmatch

" Splits
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

set splitbelow
set splitright

" Search
set incsearch
set hlsearch
set iskeyword-=.

" Folding
" set foldmethod=indent   " fold based on indent level
" set foldnestmax=10      " max 10 depth
" set foldenable          " don't fold files by default on open

" set foldlevelstart=0    " start with fold level of 1
" set foldmethod=marker
" set foldlevel=0

set omnifunc=syntaxcomplete#Complete

" Ale
let g:ale_history_log_output = 1

let g:ale_lint_on_text_changed = 0
let g:ale_lint_on_enter = 0
let g:ale_lint_on_save = 1
let g:ale_linters = { 'ruby': ['rubocop'], 'javascript': ['eslint'], 'typescript': ['tslint', 'tsserver'] }

let g:ale_typescript_tslint_use_global = 0
let g:ale_typescript_tslint_config_path = '/Users/collin/Workspace/aurelia/tslint.json'

let g:ale_fix_on_save = 1
let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'javascript': ['eslint'],
\   'typescript': ['tslint', 'prettier', 'eslint'],
\   'typescriptreact': ['tslint', 'prettier', 'eslint'],
\   'python': ['black', 'isort'],
\   'json5': ['prettier'],
\}

let g:ale_python_black_options = "--fast --line-length 110"

" Airline + Temuxline Config
let g:tmuxline_preset = 'tmux'
"let g:airline_powerline_fonts = 1
"let g:airline#extensions#whitespace#enabled = 0

" Lightline
let g:lightline = {
  \ 'colorscheme': 'seoul256',
  \ 'enable': { 'statusline' : 1, 'tabline' : 0 },
  \ 'mode_map': { 'c': 'NORMAL' },
  \ 'active': {
  \   'left': [ [ 'mode', 'paste' ], [ 'fugitive', 'filename' ], ['ctrlpmark']],
  \   'right': [ [ 'syntastic', 'lineinfo' ], ['percent'], [ 'fileformat', 'fileencoding', 'filetype' ] ]
  \ },
  \ 'component_function': {
  \   'modified': 'LightLineModified',
  \   'readonly': 'LightLineReadonly',
  \   'fugitive': 'LightLineFugitive',
  \   'filename': 'LightLineFilename',
  \   'fileformat': 'LightLineFileformat',
  \   'filetype': 'LightLineFiletype',
  \   'fileencoding': 'LightLineFileencoding',
  \   'mode': 'LightLineMode',
  \   'ctrlpmark': 'CtrlPMark',
  \ },
  \ 'component_expand': {
  \   'syntastic': 'SyntasticStatuslineFlag',
  \ },
  \ 'component_type': {
  \   'syntastic': 'error',
  \ },
  \ 'separator': { 'left': "\ue0b0", 'right': "\ue0b2" },
  \ 'subseparator': { 'left': "\ue0b1", 'right': "\ue0b3" }
  \ }

function! LightLineModified()
  return &ft =~ 'help\|vimfiler\|gundo' ? '' : &modified ? '+' : &modifiable ? '' : '-'
endfunction

function! LightLineReadonly()
  return &ft !~? 'help\|vimfiler\|gundo' && &readonly ? '\ue0a2' : ''
endfunction

function! LightLineFilename()
  let fname = expand('%:t')
  return fname == 'ControlP' ? g:lightline.ctrlp_item :
        \ &ft == 'vimfiler' ? vimfiler#get_status_string() :
        \ &ft == 'unite' ? unite#get_status_string() :
        \ &ft == 'vimshell' ? vimshell#get_status_string() :
        \ ('' != LightLineReadonly() ? LightLineReadonly() . ' ' : '') .
        \ ('' != fname ? fname : '[No Name]') .
        \ ('' != LightLineModified() ? ' ' . LightLineModified() : '')
endfunction

function! LightLineFugitive()
  if exists("*fugitive#head")
    let _ = fugitive#head()
    return strlen(_) ? _ : ''
  endif
  return ''
endfunction

function! LightLineFileformat()
  return winwidth(0) > 70 ? &fileformat : ''
endfunction

function! LightLineFiletype()
  return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype : 'no ft') : ''
endfunction

function! LightLineFileencoding()
  return winwidth(0) > 70 ? (strlen(&fenc) ? &fenc : &enc) : ''
endfunction

function! LightLineMode()
  let fname = expand('%:t')
  return fname == 'ControlP' ? 'CtrlP' :
    \ winwidth(0) > 60 ? lightline#mode() : ''
endfunction

function! CtrlPMark()
  if expand('%:t') =~ 'ControlP'
    call lightline#link('iR'[g:lightline.ctrlp_regex])
    return lightline#concatenate([g:lightline.ctrlp_prev, g:lightline.ctrlp_item
          \ , g:lightline.ctrlp_next], 0)
  else
    return ''
  endif
endfunction

let g:ctrlp_status_func = {
  \ 'main': 'CtrlPStatusFunc_1',
  \ 'prog': 'CtrlPStatusFunc_2',
  \ }

function! CtrlPStatusFunc_1(focus, byfname, regex, prev, item, next, marked)
  let g:lightline.ctrlp_regex = a:regex
  let g:lightline.ctrlp_prev = a:prev
  let g:lightline.ctrlp_item = a:item
  let g:lightline.ctrlp_next = a:next
  return lightline#statusline(0)
endfunction

function! CtrlPStatusFunc_2(str)
  return lightline#statusline(0)
endfunction

augroup AutoSyntastic
  autocmd!
  autocmd BufWritePost *.c,*.cpp call s:syntastic()
augroup END
function! s:syntastic()
  SyntasticCheck
  call lightline#update()
endfunction

" CtrlP settings
let g:ctrlp_match_window = 'bottom,order:ttb'
let g:ctrlp_switch_buffer = 0
let g:ctrlp_working_path_mode = 0
let g:ctrlp_clear_cache_on_exit = 1
let g:ctrlp_lazy_update=1
let g:ctrlp_max_files=0
let g:ctrlp_max_depth=40
let g:ctrlp_prompt_mappings = {
    \ 'AcceptSelection("e")': ['<cr>'],
    \ 'AcceptSelection("t")': ['<c-t>', '<2-LeftMouse>'],
    \ }

let g:ctrlp_custom_ignore = {
  \ 'dir':  '\.git\|\.hg$\|\.svn$\|\.yardoc\|public\/images\|public\/system\|data\|log\|tmp$',
  \ 'file': '\.exe$\|\.so$\|\.dat$'
  \ }

set wildignore+=*/.git/*
set wildignore+=*/out/*
set wildignore+=*/vendor/*

" CtrlSpace settings
let g:CtrlSpaceDefaultMappingKey = "<C-space> "

set hidden
let g:CtrlSpaceUseRubyBindings=1
let g:CtrlSpaceSaveWorkspaceOnSwitch=1
let g:CtrlSpaceSaveWorkspaceOnExit=1
let g:CtrlSpaceLoadLastWorkspaceOnStart=2
let g:CtrlSpaceUseMouseAndArrowsInTerm=1

" Indent settings
let g:indent_guides_auto_colors = 0
let g:indent_guides_guide_size = 1 "Skinny guides
let g:indent_guides_start_level = 2 "Indent from second level onwards
let g:indent_guides_enable_on_vim_startup = 1 "Start with Vim

" Silver Searcher
if executable('rg')
  set grepprg=rg\ --color=never
  let g:ctrlp_user_command = 'rg %s --files --color=never --glob ""'
  let g:ctrlp_use_caching = 0
elseif executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
  let g:ctrlspace_glob_command = 'ag -l --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  " let g:ctrlp_use_caching = 0
endif

" Misc
nnoremap K <Nop>
nnoremap <leader>K <Nop>

set mouse=a

set shiftwidth=2
set textwidth=109 "Benchling default width

set autoindent
set smartindent

set nowrap
set ignorecase
set noswapfile

set mouse-=a
set backspace=indent,eol,start

set nocompatible   " Disable vi-compatibility
set noshowmode
set laststatus=2   " Always show the statusline
set encoding=utf-8 " Necessary to show Unicode glyphs
set fillchars+=stl:\ ,stlnc:\
set nobackup

highlight Pmenu ctermfg=7 ctermbg=8 guifg=#ffffff guibg=#0000ff
highlight ExtraWhitespace guibg=#990000 ctermbg=red
:" Show leading whitespace that includes spaces, and trailing whitespace.
":autocmd BufWinEnter * match ExtraWhitespace /^\s* \s*\|\s\+$/

au BufNewFile,BufRead *.ejs set filetype=html
"au BufWrite *.ts,*.tsx TSGetDiagnostics
au BufWrite *.ts,*.tsx TSGetCodeFix
