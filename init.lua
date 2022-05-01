-- set the runtime path to include Vim-Plug and initialize
vim.call('plug#begin', '~/.configs/nvim/plugged')

-- Syntax highlighter
Plug 'pangloss/vim-javascript'
Plug 'leafOfTree/vim-vue-plugin'
Plug 'posva/vim-vue'
Plug 'tpope/vim-haml'
Plug 'haya14busa/incsearch.vim'

-- Snippets
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'tomtom/tlib_vim'
Plug 'garbas/vim-snipmate'
Plug 'grvcoelho/vim-javascript-snippets'
Plug 'mattn/emmet-vim'

-- Linter
Plug 'dense-analysis/ale'

-- Auto complete
Plug('neoclide/coc.nvim', { branch = 'release' })

-- Utilities
Plug 'Yggdroot/indentLine'
Plug 'tpope/vim-commentary'
Plug 'heavenshell/vim-jsdoc'
Plug 'heavenshell/ts-lehre'
-- Plug 'preservim/nerdtree'
-- Plug 'Xuyuanp/nerdtree-git-plugin'
Plug('junegunn/fzf', {
  ['do'] = function()
    vim.call('fzf#install')
  end
})
Plug 'junegunn/fzf.vim'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug('ternjs/tern_for_vim', {
  ['do'] = function()
    vim.call('npm install && npm install -g tern')
  end
})
Plug('Shougo/deoplete.nvim', { ['do'] = vim.fn['DoRemote'] })
Plug 'carlitux/deoplete-ternjs'
Plug 'editorconfig/editorconfig-vim'
Plug 'itchyny/lightline.vim'

-- Git plugins
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'

-- Themes
Plug('sonph/onehalf', { ['rtp'] = 'vim' })
Plug('dracula/vim', { ['as'] = 'dracula' })
Plug 'jacoborus/tender.vim'

-- All of your Plugins must be added before the following line
vim.call('plug#end')            -- required

vim.cmd([[
  au BufRead,BufNewFile *.js,*.mjs,*.html,*.css,*.vue,*.scss match BadWhitespace /\s\+$/

  syntax on

  highlight BadWhitespace ctermbg=red guibg=black
]])

vim.opt.encoding='utf-8'
vim.opt.tabstop=2
vim.opt.softtabstop=2
vim.opt.shiftwidth=2
vim.opt.expandtab=true
vim.opt.autoindent=true
vim.opt.number=true
vim.opt.smartcase=true
vim.opt.ignorecase=true
vim.opt.smartindent=true
vim.opt.ruler=true
vim.opt.nohlsearch=true
vim.opt.visualbell=true
vim.opt.history=1000
vim.opt.smarttab=true
vim.opt.shiftround=true
vim.opt.termbidi=true
vim.opt.cursorline=true

-- Garbas snippet variables
vim.g.snipMate = { ['snippet_version'] = 1 }
vim.api.nvim_set_keymap('i', '<C-J>', '<esc>a<Plug>snipMateNextOrTrigger', { map = true })
vim.api.nvim_set_keymap('s', '<C-J>', '<Plug>snipMateNextOrTrigger', { map = true })

-- ALE linter variables
vim.g.ale_echo_msg_error_str = 'E'
vim.g.ale_echo_msg_warning_str = 'W'
vim.g.ale_echo_msg_format = '[%linter%] %s [%severity%]'
vim.g.ale_fixers = { [0] = 'eslint' }
vim.g.ale_fix_on_save = 1

-- indentLine utilitie variables
vim.opt.listchars=[[tab:\¦\ ,trail:■,extends:>,precedes:<,nbsp:+]]
vim.opt.list=true
vim.cmd('hi SpecialKey ctermfg=239 ctermbg=NONE')

-- Incsearch highlighter variables
vim.api.nvim_set_keymap('', '/', '<Plug>(incsearch-forward)')
vim.api.nvim_set_keymap('', '?', '<Plug>(incsearch-backward)')
vim.api.nvim_set_keymap('', 'g/', '<Plug>(incsearch-stay)')

-- CoC variables
-- Use tab for trigger completion with characters ahead and navigate.
vim.api.nvim_set_keymap(
  'i',
  '<silent><expr> <TAB>',
  [[pumvisible() ? "\<C-n>" : <SID>check_back_space() ? "\<TAB>" : coc#refresh()']],
  { noremap = true }
)
vim.api.nvim_set_keymap('i', '<expr><S-TAB>', [[pumvisible() ? "\<C-p>" : "\<C-h>"]])
local check_back_space = function()
    local col = vim.fn.col(".") - 1
    if col == 0 or vim.fn.getline("."):sub(col, col):match("%s") then
        return true
    else
        return false
    end
end

-- Use <c-space> to trigger completion.
if has('nvim') then
  vim.api.nvim_set_keymap('i', '<silent><expr> <c-space>', 'coc#refresh()', { noremap = true })
else
  vim.api.nvim_set_keymap('i', '<silent><expr> <c-@>', 'coc#refresh()', { noremap = true })
end

-- Make <CR> auto-select the first completion item and notify coc.nvim to
-- format on enter, <cr> could be remapped by other vim plugin
vim.api.nvim_set_keymap(
  'i',
  '<silent><expr> <cr>',
  [[pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"]],
  { noremap = true }
)

-- Use `[g` and `]g` to navigate diagnostics
-- Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
vim.api.nvim_set_keymap('n', '<silent> [g', '<Plug>(coc-diagnostic-prev)')
vim.api.nvim_set_keymap('n', '<silent> ]g', '<Plug>(coc-diagnostic-next)')

-- GoTo code navigation.
vim.api.nvim_set_keymap('n', '<silent> gd', '<Plug>(coc-definition)')
vim.api.nvim_set_keymap('n', '<silent> gy', '<Plug>(coc-type-definition)')
vim.api.nvim_set_keymap('n', '<silent> gi', '<Plug>(coc-implementation)')
vim.api.nvim_set_keymap('n', '<silent> gr', '<Plug>(coc-references)')

-- Highlight the symbol and its references when holding the cursor.
vim.cmd([[autocmd CursorHold * silent call CocActionAsync('highlight')]])

-- Lightline configs
vim.opt.laststatus=2
vim.opt.noshowmode=true
  -- Available themes for lightline
    -- tender
    -- dracula
    -- onehalfdark
    -- molokai
vim.g.lightline = { ['colorscheme'] = 'dracula' }

vim.cmd('colorscheme dracula')

-- Config for onehalf themes
-- set t_Co=256

-- Start up plugins
vim.cmd('autocmd VimEnter * NERDTree')
