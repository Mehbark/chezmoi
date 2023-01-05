let mapleader = ";"

let g:ConqueGdb_GdbExe = 'arm-none-eabi-gdb'

call plug#begin('~/.config/nvim/plugged')
" Using master branch
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'w0rp/ale'

Plug 'tpope/vim-fugitive'

Plug 'qpkorr/vim-bufkill'

" Navigation
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'

Plug 'airblade/vim-rooter'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'jlanzarotta/bufexplorer'

Plug 'vimwiki/vimwiki'
" Plug 'tools-life/taskwiki'

""Editing
Plug 'tpope/vim-commentary'
"Plug 'mrtazz/DoxygenToolkit.vim'
Plug 'tpope/vim-surround'

Plug 'godlygeek/tabular'

Plug 'kana/vim-operator-user'
"Plug 'rhysd/vim-clang-format'

Plug 'vim-scripts/a.vim'
Plug 'machakann/vim-highlightedyank'

"
" Semantic language support
" Plug 'autozimu/LanguageClient-neovim', { 'branch': 'next', 'do': 'bash install.sh' }
Plug 'ncm2/ncm2'
Plug 'roxma/nvim-yarp'

" Completion plugins
Plug 'ncm2/ncm2-bufword'
Plug 'ncm2/ncm2-path'
Plug 'tmsvg/pear-tree'

Plug 'tpope/vim-fireplace'

" CoC
Plug 'neoclide/coc.nvim', {'branch': 'release'}

Plug 'neovimhaskell/haskell-vim'

" Syntactic language support
Plug 'rust-lang/rust.vim'
Plug 'cespare/vim-toml'

Plug 'ful1e5/onedark.nvim'

Plug 'ap/vim-css-color'

Plug 'kyazdani42/nvim-web-devicons'
Plug 'kyazdani42/nvim-tree.lua'
Plug 'ahmedkhalf/project.nvim'

Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

Plug 'nickeb96/fish.vim'

Plug 'https://git.sr.ht/~whynothugo/lsp_lines.nvim'

" Fun
Plug 'eandrju/cellular-automaton.nvim'

" Add plugins to &runtimepath
call plug#end()

"===== Telescope ====="
nnoremap <leader>t :Telescope<cr>


"===== Code Completion ====="
autocmd BufEnter * call ncm2#enable_for_buffer()
set completeopt=noinsert,menuone,noselect
" tab to select
" and don't hijack my enter key
inoremap <expr><C-j> (pumvisible()?(empty(v:completed_item)?"\<C-n>":"\<C-n>"):"\<Tab>")
inoremap <expr><C-f> (pumvisible()?(empty(v:completed_item)?"\<CR>\<CR>":"\<C-y>"):"\<CR>")

"===== Compilation Error Navigation ====="
nmap <silent> <C-k> <Plug>(coc-diagnostic-next-error)
nmap <silent> <C-j> <Plug>(coc-diagnostic-next)


"===== Key bindings ====="
map <C-b> :BufExplorer<CR> " Explore buffers
map <C-K> :bnext<CR> " Next buffer!
map <C-J> :bprev<CR> " Prev buffer!
map <C-c> :Commentary<CR> " Toggle comment on this line

map <leader>w :w<cr>
map <leader>q :q<cr>

" Tabs
nnoremap tj :tabnext<cr>
nnoremap tk :tabprevious<cr>


" mehbark added this, bracket and braces and stuff completion
" https://coderwall.com/p/h1dv0g/completion-for-parentheses-braces-and-brackets-in-vim
" inoremap { {}<left>
" inoremap {{ {
" inoremap {} {}
" inoremap {<cr> {<cr>}<esc>O
" inoremap [ []<left>
" inoremap [[ [
" inoremap [] []
" inoremap ( ()<left>
" inoremap (( (
" inoremap () ()
" inoremap " ""<left>
" inoremap "" ""
" inoremap ' ''<left>
" inoremap '' ''

"===== Airline ====="
set ttimeoutlen=50
set laststatus=2
let g:airline_powerline_fonts = 1
let g:airline_theme='base16'
let g:airline#extensions#tabline#enabled = 1
" let g:airline_left_sep=''
" let g:airline_right_sep=''
let g:airline#extensions#whitespace#checks = [ 'indent' ]

" Map f4 to switch header/source for c projects
map <F4> :A<CR>

" remove trailing white spaces when saving
" autocmd BufWritePre * :%s/\s\+$//e

" OCaml settings
filetype indent on
filetype plugin on

au BufRead,BufNewFile *.ml,*.mli compiler ocaml

" different color schemes depending on the file type
syntax enable
"let g:rehash256 = 1
colorscheme gruvbox


"===== NERDTree ====="
"Auto close if only NERDTree is open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

"Open nerd tree if no cl argument supplied
" function! StartUp()
"     if 0 == argc()
"         NERDTree .
"     end
" endfunction
" let g:NERDTreeWinPos = 'right'

" autocmd VimEnter * call StartUp()

"toggle on Ctrl+n
map <C-n> :NERDTreeToggle <cr>

" let g:NERDTreeWinSize=60


"===== Rust ====="
autocmd FileType rust nnoremap <buffer> <C-f> :RustFmt<CR>
autocmd FileType rust nnoremap <buffer> <C-i> :RustFmt<CR>
let g:rustfmt_autosave = 1
let g:rustfmt_command = "rustfmt"
au BufNewFile,BufRead *.rs setlocal colorcolumn=100
let g:ycm_rust_src_path = '~/.rustup/toolchains/stable-x86_64-unknown-linux-gnu/lib/rustlib/src/rust/src'

"===== C ====="
autocmd FileType c set autoindent noexpandtab tabstop=8 shiftwidth=8
" autocmd FileType c execute "silent! CocDisable"

"===== Nvim Behaviour ====="
" Changes regular vim behaviours
" Set so the files auto updates when changed on disk
set autoread

" No swap files
set backupdir-=.
set backupdir^=~/tmp,/tmp

" Fold the code
" set foldmethod=syntax
" activate the folder
set foldcolumn=1
" automatically fold larger files, for small ones, it doesn't matter
" autocmd! BufReadPost * :if line('$') < 200 | set foldlevel=99 | else | set foldlevel=1 |endif
" Relative line numbers in normal mode, absolute in insert (mainly for reading errors easier)
set number

autocmd InsertEnter * :set norelativenumber
autocmd InsertLeave * :set relativenumber


"===== Persistent Undo ====="
" Keep undo history across sessions, by storing in file.
silent !mkdir ~/.config/nvim/backups > /dev/null 2>&1
set undodir=~/.config/nvim/backups
set undofile


"===== Close current buffer ====="
nnoremap <C-x> :BW<cr>


"===== Typo fixes ====="
"Fix common typos when saving and exiting
command WQ wq
command Wq wq
command W  w
command Q  q


"===== Misc ====="
set nocompatible
" Dont update view in scripts, 10000 times speedup
set lazyredraw
" set Colour support so airline works
set t_Co=256
" set mouse activated
set mouse=a
set clipboard=unnamedplus
" Include stdlib dirs for 'gf' command. Also include all subdir in
" workingfolder
let &path = "src/include,/usr/include/AL,.**"
" set dictionary = /home/mbk/Documents/dictionary.txt,.**
" Search for tags file, from current directory until home directory
set tags=./tags;$HOME


"===== Terminal ====="
" Set exiting term mode to esc esc
tnoremap <esc><esc> <C-\><C-n>


set incsearch
set ignorecase
set smartcase
set tabstop=4 shiftwidth=4 expandtab
set wrap linebreak nolist  " list disables line break
" indicate where the 80 chars wide is
set cc=100
set textwidth=0
set wrapmargin=0
" set spell spelllang=en_us
set number
set relativenumber
set langmenu=en_US
let $LANG = 'en_US'
set cursorline
" retain undo history in buffers
set hidden
" set so the files auto updates when changed on disk
set autoread
" Better default for yanking
:map Y y$
" Set yank highlight to something reasonable
let g:highlightedyank_highlight_duration = 150


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"==== Haskell
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:haskell_enable_quantification = 1   " to enable highlighting of `forall`
let g:haskell_enable_recursivedo = 1      " to enable highlighting of `mdo` and `rec`
let g:haskell_enable_arrowsyntax = 1      " to enable highlighting of `proc`
let g:haskell_enable_pattern_synonyms = 1 " to enable highlighting of `pattern`
let g:haskell_enable_typeroles = 1        " to enable highlighting of type roles
let g:haskell_enable_static_pointers = 1  " to enable highlighting of `static`
let g:haskell_backpack = 1                " to enable highlighting of backpack keywords

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"==== Coc settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
" inoremap <silent><expr> <TAB>
"       \ pumvisible() ? "\<C-n>" :
"       \ <SID>check_back_space() ? "\<TAB>" :
"       \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

" function! s:check_back_space() abort
"   let col = col('.') - 1
"   return !col || getline('.')[col - 1]  =~# '\s'
" endfunction

" " Use <c-space> to trigger completion.
" inoremap <silent><expr> <C-space> coc#refresh()

" " Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" " position. Coc only does snippet and additional edit on confirm.
" " if has('patch8.1.1068')
"   " Use `complete_info` if your (Neo)Vim version supports it.
"   inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
" " else
" "   imap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" " endif
function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" inoremap <silent><expr> <>
"       \ coc#pum#visible() ? coc#pum#next(1) :
"       \ CheckBackspace() ? "\<Tab>" :
"       \ coc#refresh()

" argh argh please work 
inoremap <expr> <Tab> coc#pum#visible() ? coc#pum#next(1) : "\<Tab>"
inoremap <expr> <S-Tab> coc#pum#visible() ? coc#pum#prev(1) : "\<S-Tab>"

inoremap <expr> <cr> coc#pum#visible() ? coc#pum#confirm() : "\<CR>"

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> <leader>d :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

xmap <leader>f  <Plug>(coc-fix)
let g:coc_node_path="/usr/bin/node"

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current line.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>f  <Plug>(coc-fix-current)

" Introduce function text object
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

" Use <TAB> for selections ranges.
" NOTE: Requires 'textDocument/selectionRange' support from the language server.
" coc-tsserver, coc-python are the examples of servers that support it.
nmap <silent> <TAB> <Plug>(coc-range-select)
xmap <silent> <TAB> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

let g:airline#extensions#coc#enabled = 1
" Add (Neo)Vims native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings using CoCList:
" Show all diagnostics.
" nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
" nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
" nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
" nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
" nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
" nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
" nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
" nnoremap <silent> <space>p  :<C-u>CocListResume<CR>

au filetype vimwiki silent! iunmap <buffer> <Tab>
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" / Coc settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"pear tree
let g:pear_tree_pairs = {
            \ '(': {'closer': ')'},
            \ '[': {'closer': ']'},
            \ '{': {'closer': '}'},
            \ "'": {'closer': "'"},
            \ '"': {'closer': '"'},
            \ '<!--': {'closer': '-->'},
            \ }

let g:pear_tree_smart_openers = 1
let g:pear_tree_smart_closers = 1
let g:pear_tree_smart_backspace = 1
let g:pear_tree_map_special_keys = 1

set shell=/usr/bin/dash

lua << EOF
require("nvim-tree").setup({
  respect_buf_cwd = true,
  update_cwd = true,
  update_focused_file = {
    enable = true,
    update_cwd = true
  },
})

require("lsp_lines").setup()
vim.diagnostic.config({virtual_text = false})

require("project_nvim").setup {
    -- your configuration comes here
    -- or leave it empty to use the default settings
}

require('telescope').load_extension('projects')
