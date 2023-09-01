"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                                                         "
"              ███╗   ███╗ ██╗   ██╗██╗███╗   ███╗██████╗  ██████╗        "
"              ████╗ ████║ ██║   ██║██║████╗ ████║██╔══██╗██╔════╝        "
"              ██╔████╔██║ ██║   ██║██║██╔████╔██║██████╔╝██║             "
"              ██║╚██╔╝██║ ╚██╗ ██╔╝██║██║╚██╔╝██║██╔══██╗██║             "
"              ██║ ╚═╝ ██║  ╚████╔╝ ██║██║ ╚═╝ ██║██║  ██║╚██████╗        "
"              ╚═╝     ╚═╝   ╚═══╝  ╚═╝╚═╝     ╚═╝╚═╝  ╚═╝ ╚═════╝        "
"                                                                         "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" DEFAULT SETTINGS  ------------------------------------------------------- {{{
    let $vimhome=fnamemodify(resolve(expand("~/.vimrc")), ':p:h')
    let $vundle=$vimhome."/bundle/Vundle.vim"

    set nocompatible                            " be iMproved, required
    filetype off                                " required

    syntax enable                               " syntax highlight

    set t_Co=256                                " set 256 colors
    colorscheme wombat256mod                    " set color scheme

    set number                                  " show line numbers
    set ruler
    set ttyfast                                 " terminal acceleration

    set tabstop=4                               " 4 whitespaces for tabs visual presentation
    set shiftwidth=4                            " shift lines by 4 spaces
    set smarttab                                " set tabs for a shifttabs logic
    set expandtab                               " expand tabs into spaces
    set autoindent                              " indent when moving to the next line while writing code

    set cursorline                              " shows line under the cursor's line
    set showmatch                               " shows matching part of bracket pairs (), [], {}

    set enc=utf-8	                            " utf-8 by default

    set nobackup 	                            " no backup files
    set nowritebackup                           " only in case you don't want a backup file while editing
    set noswapfile 	                            " no swap files

    set backspace=indent,eol,start              " backspace removes all (indents, EOLs, start) What is start?

    set scrolloff=10                            " let 10 lines before/after cursor during scroll

    set clipboard=unnamed                       " use system clipboard

    set exrc                                    " enable usage of additional .vimrc files from working directory
    set secure                                  " prohibit .vimrc files to execute shell, create files, etc...

    tab sball
    set switchbuf=useopen
    set laststatus=2
    nmap <F9> :bprev<CR>
    nmap <F10> :bnext<CR>
    nmap <silent> <leader>q :SyntasticCheck # <CR> :bp <BAR> bd #<CR>

    " highlight 'long' lines (>= 80 symbols) in python files
    augroup vimrc_autocmds
        autocmd!
        autocmd FileType python,rst,c,cpp highlight Excess ctermbg=DarkGrey guibg=Black
        autocmd FileType python,rst,c,cpp match Excess /\%81v.*/
        autocmd FileType python,rst,c,cpp set nowrap
        autocmd FileType python,rst,c,cpp set colorcolumn=80
    augroup END

    if system('uname -s') == "Darwin\n"
        set clipboard=unnamed "OSX
    else
        set clipboard=unnamedplus "Linux
    endif
" }}}

" PLUGINS ---------------------------------------------------------------- {{{

    " set the runtime path to include Vundle and initialize
    set rtp+=~/.vim/bundle/Vundle.vim
    call vundle#begin()

        Plugin 'VundleVim/Vundle.vim'                                    " let Vundle manage Vundle, required

        "-------------------=== Code/Project navigation ===-------------
        Plugin 'preservim/nerdtree'                                      " Project and file navigation
        Plugin 'kien/ctrlp.vim'                                          " Fast transitions on project files
        Plugin 'majutsushi/tagbar'                                       " Class/module browser

        "-------------------=== Python  ===-----------------------------
        Plugin 'klen/python-mode'                                        " Python mode (docs, refactor, lints...)
        Plugin 'scrooloose/syntastic'                                    " Syntax checking plugin for Vim

        "-------------------=== Languages support ===-------------------
        Plugin 'tpope/vim-commentary'                                    " Comment stuff out
        Plugin 'tpope/vim-surround'                                      " Parentheses, brackets, quotes, XML tags, and more

        "-------------------=== Other ===-------------------------------
        Plugin 'bling/vim-airline'                                       " Lean & mean status/tabline for vim

    call vundle#end()            " required
    filetype plugin indent on    " required

" }}}

" PLUG-CONFIGS --------------------------------------------------------------- {{{

    source ~/MV_DOTFILES/plugin-configs/start.vim

    "-------------------=== NERDTree navigation ===-------------
    " NERDTree specific mappings.
    nnoremap <c-\> :NERDTreeToggle<cr>

    "-------------------=== TAGBar navigation ===-------------
    " TagBar specific mappings.
    nmap <F8> :TagbarToggle<CR>

" }}}

" MAPPINGS --------------------------------------------------------------- {{{

    " Set the backslash as the leader key.
    let mapleader = ","

    " Enable mouse use in all modes
    set mouse=a

    " Split the windows using ,v and ,s
    nnoremap <silent> <leader>h :split<CR>
    nnoremap <silent> <leader>v :vsplit<CR>

    " You can split the window in Vim by typing :split or :vsplit.
    " Navigate the split view easier by pressing CTRL+j, CTRL+k, CTRL+h, or CTRL+l.
    nnoremap <c-j> <c-w>j
    nnoremap <c-k> <c-w>k
    nnoremap <c-h> <c-w>h
    nnoremap <c-l> <c-w>l

    " Resize split windows using arrow keys by pressing:
    " CTRL+UP, CTRL+DOWN, CTRL+LEFT, ors CTRL+RIGHT.
    noremap <c-up> <c-w>+
    noremap <c-down> <c-w>-
    noremap <c-left> <c-w>>
    noremap <c-right> <c-w><

    nnoremap <C-j> :tabprevious<CR>
    nnoremap <C-k> :tabnext<CR>
    nnoremap tn :tabnew<CR>
    nnoremap tc :tabclose<CR>

    noremap <leader>1 1gt<cr>
    noremap <leader>2 2gt<cr>
    noremap <leader>3 3gt<cr>
    noremap <leader>4 4gt<cr>
    noremap <leader>5 5gt<cr>
    noremap <leader>6 6gt<cr>
    noremap <leader>7 7gt<cr>
    noremap <leader>8 8gt<cr>
    noremap <leader>9 9gt<cr>
    noremap <leader>0 :tablast<cr>

    " To turn off highlight until next search
    " map <esc> :noh <CR>

" }}}

" VIMSCRIPT -------------------------------------------------------------- {{{
" }}}

" STATUS LINE ------------------------------------------------------------ {{{
    " Clear status line when vimrc is reloaded.
    set statusline=

    " Status line left side.
    set statusline+=\ %F\ %M\ %Y\ %R

    " Use a divider to separate the left side from the right side.
    set statusline+=%=

    " Status line right side.
    set statusline+=\ ascii:\ %b\ hex:\ 0x%B\ row:\ %l\ col:\ %c\ percent:\ %p%%

    " Show the status on the second to last line.
    set laststatus=2

    "=====================================================
    "" AirLine settings
    "=====================================================
    let g:airline#extensions#tabline#enabled=1
    let g:airline#extensions#tabline#formatter='unique_tail'
    let g:airline_powerline_fonts=1
" }}}