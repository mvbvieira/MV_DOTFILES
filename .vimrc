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
    "colorscheme wombat256mod                    " set color scheme
    colorscheme ron

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
    set hlsearch                                " Use highlighting when doing a search.

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
        " Plugin 'kien/ctrlp.vim'                                          " Fast transitions on project files
        Plugin 'majutsushi/tagbar'                                       " Class/module browser
        Plugin 'junegunn/fzf', { 'do': { -> fzf#install() } }
        Plugin 'junegunn/fzf.vim'
        Plugin 'dyng/ctrlsf.vim'

        "-------------------=== Python  ===-----------------------------
        Plugin 'klen/python-mode'                                        " Python mode (docs, refactor, lints...)
        Plugin 'scrooloose/syntastic'                                    " Syntax checking plugin for Vim

        "-------------------=== Languages support ===-------------------
        Plugin 'tpope/vim-commentary'                                    " Comment stuff out
        Plugin 'tpope/vim-surround'                                      " Parentheses, brackets, quotes, XML tags, and more
        Plugin 'sheerun/vim-polyglot'
        Plugin 'ntpeters/vim-better-whitespace'
        Plugin 'bronson/vim-trailing-whitespace'
        Plugin 'jiangmiao/auto-pairs'
        Plugin 'davidhalter/jedi-vim'
        Plugin 'tpope/vim-fugitive'
        Plugin 'mitsuhiko/vim-sparkup'              " Sparkup(XML/jinja/htlm-django/etc.) support
        Plugin 'Rykka/riv.vim'                      " ReStructuredText plugin
        Plugin 'Valloric/YouCompleteMe'             " Autocomplete plugin

        "-------------------=== Other ===-------------------------------
        Plugin 'bling/vim-airline'                                       " Lean & mean status/tabline for vim
        Plugin 'rking/ag.vim'

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

    " YouCompleteMe
    set completeopt-=preview

    let g:ycm_global_ycm_extra_conf='~/.vim/ycm_extra_conf.py'
    let g:ycm_confirm_extra_conf=0

    nmap <leader>g :YcmCompleter GoTo<CR>
    nmap <leader>d :YcmCompleter GoToDefinition<CR>

    let g:fzf_buffers_jump = 1

    if executable('fzf')
        " FZF {{{
        " <C-p> or <C-t> to search files
        nnoremap <silent> <C-t> :FZF -m<cr>
        nnoremap <silent> <C-p> :FZF<cr>
        " <M-p> for open buffers
        nnoremap <silent> <c-b> :Buffers<cr>
        " <M-S-p> for MRU
        nnoremap <c-d><c-h> :History<cr>
        " Use fuzzy completion relative filepaths across directory
        imap <expr> <c-x><c-f> fzf#vim#complete#path('git ls-files $(git rev-parse --show-toplevel)')
        command! -bang -nargs=* Ag
                    \ call fzf#vim#ag(<q-args>,
                    \                 <bang>0 ? fzf#vim#with_preview('up:60%')
                    \                         : fzf#vim#with_preview('right:50%:hidden', '?'),
                    \                 <bang>0)
    end

    " clean all white spaces in the end-lines
    autocmd BufWritePre * :FixWhitespace

    nmap     <C-F>f <Plug>CtrlSFPrompt
    vmap     <C-F>f <Plug>CtrlSFVwordPath
    vmap     <C-F>F <Plug>CtrlSFVwordExec
    nmap     <C-F>n <Plug>CtrlSFCwordPath
    nmap     <C-F>p <Plug>CtrlSFPwordPath
    nnoremap <C-F>o :CtrlSFOpen<CR>
    nnoremap <C-F>t :CtrlSFToggle<CR>
    inoremap <C-F>t <Esc>:CtrlSFToggle<CR>
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
    nnoremap <space> :noh<cr>

    nnoremap \ :Ag<SPACE>

    " return relative path
    nmap <Leader>cs :let @*=expand("%")<CR>
    nmap <Leader>cl :let @*=expand("%:p")<CR>
    nmap <Leader>cp :let @+ = expand("%:t")<CR>
    nmap <Leader>cr :let @*=('bundle exec rspec ' . expand("%") . ':' . line("."))<CR>
    nmap <Leader>cg :call GithubCopyLineUrl()<CR>
    vnoremap <Leader>cg :call GithubCopyLineUrl()<CR>

" }}}

" VIMSCRIPT -------------------------------------------------------------- {{{

    function! GithubCopyLineUrl()
        let line1 = a:firstline
        let line2 = a:lastline
        let commit = substitute(system('git rev-parse HEAD'), '[\]\|[[:cntrl:]]', '', 'g')
        let cmd = 'git ls-remote --get-url | sed "s/:/\//g" | sed "s/git@/https:\/\//g" | sed "s/\.git/\/blob\//g"'
        let result = substitute(system(cmd), '[\]\|[[:cntrl:]]', '', 'g')

        if line1 != line2
            let lines = '#L' . line1 . '-L' . line2
        else
            let lines = '#L' . line1
        endif

        let @*=(result . commit . '/' . expand("%") . lines)
    endfunction

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
