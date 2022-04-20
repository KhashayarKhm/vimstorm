" set the runtime path to include Vim-Plug and initialize
call plug#begin('~/.vim/bundle')

" Syntax highlighter
Plug 'pangloss/vim-javascript'
Plug 'leafOfTree/vim-vue-plugin'
Plug 'posva/vim-vue'
Plug 'tpope/vim-haml'
Plug 'haya14busa/incsearch.vim'

" Snippets
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'tomtom/tlib_vim'
Plug 'garbas/vim-snipmate'
Plug 'grvcoelho/vim-javascript-snippets'
Plug 'mattn/emmet-vim'

" Linter
Plug 'dense-analysis/ale'

" Auto complete
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Utilities
Plug 'Yggdroot/indentLine'
Plug 'tpope/vim-commentary'
Plug 'heavenshell/vim-jsdoc'
Plug 'heavenshell/ts-lehre'
Plug 'preservim/nerdtree'
Plug 'editorconfig/editorconfig-vim'
Plug 'itchyny/lightline.vim'

" Git plugins
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'

" Themes
Plug 'sonph/onehalf', { 'rtp': 'vim' }
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'jacoborus/tender.vim'

" All of your Plugins must be added before the following line
call plug#end()            " required

au BufRead,BufNewFile *.js,*.mjs,*.html,*.css,*.vue,*.scss match BadWhitespace /\s\+$/

set encoding=utf-8
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
set autoindent
set number
set smartcase
set ignorecase
set smartindent
set ruler
set nohlsearch
set visualbell
set history=1000
set smarttab
set shiftround
set termbidi
set cursorline
syntax on

" Variables and other configs
highlight BadWhitespace ctermbg=red guibg=black
" For Garbas snippet
let g:snipMate = { 'snippet_version' : 1 }
imap <C-J> <esc>a<Plug>snipMateNextOrTrigger
smap <C-J> <Plug>snipMateNextOrTrigger
" For ALE linter
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:ale_fixers = ['eslint']
let g:ale_fix_on_save = 1
" For indentLine utilitie
set listchars=tab:\¦\ ,trail:■,extends:>,precedes:<,nbsp:+
set list
hi SpecialKey ctermfg=239 ctermbg=NONE
" For Incsearch highlighter
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)
" For CoC
" Use tab for trigger completion with characters ahead and navigate.
inoremap <silent><expr> <TAB>
			\ pumvisible() ? "\<C-n>" : <SID>check_back_space() ? "\<TAB>" : coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
function! s:check_back_space() abort
	let col = col('.') - 1
	return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
	inoremap <silent><expr> <c-space> coc#refresh()
else
	inoremap <silent><expr> <c-@> coc#refresh()
endif

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
															\: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')
" Lightline configs
set laststatus=2
set noshowmode
  " Available themes for lightline
    " tender
    " dracula
    " onehalfdark
    " molokai
let g:lightline = { 'colorscheme': 'dracula' }

colorscheme dracula

" Config for onehalf themes
" set t_Co=256

" Start up plugins
autocmd VimEnter * NERDTree
