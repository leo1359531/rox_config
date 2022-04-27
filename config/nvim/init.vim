" My personal nvim config
" written by leo

" Plugin section

call plug#begin('~/.vim/plugged')

" Atom One Dark / Light theme.
Plug 'navarasu/onedark.nvim'

" Everforest color scheme
Plug 'sainnhe/everforest'

" dracula theme
Plug 'Mofiqul/dracula.nvim'

" Rainbow brackets
Plug 'frazrepo/vim-rainbow'

" Show color of HEX
Plug 'ap/vim-css-color'

" Automatically show Vim's complete menu while typing.
Plug 'vim-scripts/AutoComplPop'

" From commenting lines
Plug 'preservim/nerdcommenter'

" Shortcut for parenthesis
Plug 'tpope/vim-surround'

" Autopairs
Plug 'windwp/nvim-autopairs' 

" Highlight which character to jump to when using horizontal movement keys.
Plug 'unblevable/quick-scope'

" Automatically clear search highlights after you move your cursor.
Plug 'haya14busa/is.vim'

" A bunch of useful language related snippets (ultisnips is the engine).
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'

call plug#end()

" ------------------------------------------------------------------------------------
" Basic settings
" ------------------------------------------------------------------------------------

" Disable compatibility to old-time vi 
set nocompatible

" Syntax highlight
syntax on 

" Case insensitive
set ignorecase 

" Autoindent
set autoindent

" Highlight search
set hlsearch

" Incremental search
set incsearch

" Number of columns occupied by a tab 
set tabstop=4
set shiftwidth=4

" Converts tabs to white spaces
set expandtab

" Indent a new line the same amount as the line just typed
set autoindent

" Enable mouse click
set mouse=a

" Enable spell check
set complete+=kspell

" Rules of completion
set completeopt=menuone,longest

" No info of completion on low bar
set shortmess+=c

" Highlight current line
set cursorline

" Relative numbers
set number relativenumber

" using system clipboard
set clipboard=unnamedplus

" Directory to store backup files
set backupdir=/tmp/vim

" copy paste to keyboard wayland

xnoremap "+y y:call system("wl-copy", @")<cr>
nnoremap "+p :let @"=substitute(system("wl-paste --no-newline"), '<C-v><C-m>', '', 'g')<cr>p
nnoremap "*p :let @"=substitute(system("wl-paste --no-newline --primary"), '<C-v><C-m>', '', 'g')<cr>p



" Colorscheme

" colorscheme onedark
"set background=dark
"colorscheme onedark

" Vim
"let onedark_config = {
            "\ 'style': 'darker',
            "\}
colorscheme onedark

" Spelling mistakes will be colored up red.
hi SpellBad cterm=underline ctermfg=203 guifg=#ff5f5f
hi SpellLocal cterm=underline ctermfg=203 guifg=#ff5f5f
hi SpellRare cterm=underline ctermfg=203 guifg=#ff5f5f
hi SpellCap cterm=underline ctermfg=203 guifg=#ff5f5f

" Status line
" Heavily inspired by: https://github.com/junegunn/dotfiles/blob/master/vimrc
function! s:statusline_expr()
    let mod = "%{&modified ? '[+] ' : !&modifiable ? '[x] ' : ''}"
    let ro  = "%{&readonly ? '[RO] ' : ''}"
    let ft  = "%{len(&filetype) ? '['.&filetype.'] ' : ''}"
    let fug = "%{exists('g:loaded_fugitive') ? fugitive#statusline() : ''}"
    let sep = ' %= '
    let pos = ' %-12(%l : %c%V%) '
    let pct = ' %P'

    return '[%n] %f %<'.mod.ro.ft.fug.sep.pos.'%*'.pct
endfunction

let &statusline = s:statusline_expr()

"  -----------------------------------------------------------------------------------
"  Basic mappings
"  -----------------------------------------------------------------------------------

" Seamlessly treat visual lines as actual lines when moving around.
noremap j gj
noremap k gk
noremap <Down> gj
noremap <Up> gk
inoremap <Down> <C-o>gj
inoremap <Up> <C-o>gk

" alternatives Esc
inoremap kj <Esc>
inoremap jk <Esc>

" Ctrl-j/k deletes blank line below/above, and Alt-j/k inserts.
nnoremap <silent><C-j> m`:silent +g/\m^\s*$/d<CR>``:noh<CR>
nnoremap <silent><C-k> m`:silent -g/\m^\s*$/d<CR>``:noh<CR>
nnoremap <silent><A-j> :set paste<CR>m`o<Esc>``:set nopaste<CR>
nnoremap <silent><A-k> :set paste<CR>m`O<Esc>``:set nopaste<CR>

" Cycle through splits.
nnoremap <S-Tab> <C-w>w

" Double quote bash variable $
nnoremap <C-"> lviwoh

" surround vim commands
" ds" -> remove "
" ys" -> add "
" S" -> add " selected text

" The same as above but instead of acting on the whole file it will be
" restricted to the previously visually selected range. You can do that by
" pressing *, visually selecting the range you want it to apply to and then
" press a key below to replace all instances of it in the current selection.
xnoremap <Leader>r :s///g<Left><Left>
xnoremap <Leader>rc :s///gc<Left><Left><Left>

" Type a replacement term and press . to repeat the replacement again. Useful
" for replacing a few instances of the term (comparable to multiple cursors).
nnoremap <silent> s* :let @/='\<'.expand('<cword>').'\>'<CR>cgn
xnoremap <silent> s* "sy:let @/=@s<CR>cgn

" Clear search highlights.
map <silent><Leader><Space> :let @/=''<CR>

" Search repalce shortcut
" Press * to search for the term under the cursor or a visual selection and
" then press a key below to replace all instances of it in the current file.
nnoremap <Leader>r :%s///g<Left><Left>
nnoremap <Leader>rc :%s///gc<Left><Left><Left>

" Prevent x and the delete key from overriding what's in the clipboard.
noremap x "_x
noremap X "_x
noremap <Del> "_x

" Toggle visually showing all whitespace characters.
noremap <F7> :set list!<CR>
inoremap <F7> <C-o>:set list!<CR>
cnoremap <F7> <C-c>:set list!<CR>

" Allow files to be saved as root when forgetting to start Vim using sudo.
command W :execute ':silent w !sudo tee % > /dev/null' | :edit!

" Navigate the complete menu items like CTRL+n / CTRL+p would.
inoremap <expr> <Down> pumvisible() ? "<C-n>" :"<Down>"
inoremap <expr> <tab> pumvisible() ? "<C-n>" :"<Down>"
inoremap <expr> <Up> pumvisible() ? "<C-p>" : "<Up>"

" Select the complete menu item like CTRL+y would.
inoremap <expr> <Right> pumvisible() ? "<C-y>" : "<Right>"
inoremap <expr> <CR> pumvisible() ? "<C-y>" :"<CR>"

" Cancel the complete menu item like CTRL+e would.
inoremap <expr> <Left> pumvisible() ? "<C-e>" : "<Left>"
inoremap <expr> <> pumvisible() ? "<C-e>" : "<Left>"

" copies pwd to clipboard: command yd
:nnoremap <silent> yd :let @+=expand('%:p:h')<CR>

" move line or visually selected block - alt+j/k
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv

" ...............................................................................
" SirVer/ultisnips
" ...............................................................................

let g:UltiSnipsExpandTrigger="<C-\\>"
let g:UltiSnipsJumpForwardTrigger="<C-\\>"
let g:UltiSnipsJumpBackwardTrigger="<A-\\>"

" -------------------------------------------------------------------------------
" Basic autocommands
" -------------------------------------------------------------------------------

" Ensure tabs don't get converted to spaces in Makefiles.
autocmd FileType make setlocal noexpandtab

" keyboard leader
let mapleader=","

" sh syntax for files without extession
autocmd BufNewFile,BufRead * if expand('%:t') !~ '\.' | set filetype=sh | endif

" Vim jump to the last position when reopening a file
if has("autocmd")
    au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
                \| exe "normal! g'\"" | endif
endif
