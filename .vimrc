call pathogen#infect()
call pathogen#helptags()

"" Code Folding
set foldmethod=indent
set foldlevel=99

"" Window Slipt
"" Snippets revisar bien este plugin

"" Task lists
map <leader>td <Plug>TaskList

"" Revision History
map <leader>gg :GundoToggle<CR>

"""" Syntax Highlighting and Validation
syntax on                 " syntax highlighing
filetype on               " try to detect filetypes
filetype plugin indent on " enable loading indent file for filetype
set number                " show line numbers
set showmatch             " show the maching part of the pair for [] {} and ()
au FileType python set textwidth=79 " Line wrap (number of cols) only python
set autoread

"" pyflakes
let g:pyflakes_use_quickfix = 0 " revisar esta opcion

"" pep8
let g:pep8_map='<leader>8'

"""" Tab Completion and Documentation
"" SuperTab
let g:SuperTabDefaultCompletionType = "context"
set completeopt=menuone,longest,preview

au FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType htmldjango set omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
"" pydoc
" use <leader>pw

"""" Code Navigation
"" Buffers and minibufexpl
" use to open files in buffer: :e <filename>
" use to get a list of them doing: :buffers  
" You can switch between the buffers using: :b<number>
" You can also use its name to match, so you can type: :b mod<tab>
" To close a buffer you use :bd or :bw

"""" Fuzzy Text File Search
"" command-t
" use to make finding and opening files within 
" your project even easier: <leader>t
" It also supports searching only through 
" opened buffers, instead of files using: <leader>b.

"""" File Browser
"" NERD Tree
map <leader>nn :NERDTreeToggle<CR>

"""" Refactoring and Go to definition
"" Ropevim
"map <leader>j :RopeGotoDefinition<CR>
"map <leader>r :RopeRename<CR>
let g:rope = 0

"""" Searching
"" Ack
nmap <leader>a <Esc>:Ack!

"""" Integration with Git
"set statusline+=%{fugitive#statusline()} "  Git Hotness

"""" Add the virtualenv's site-packages to vim path
py << EOF
import os.path
import sys
import vim
if 'VIRTUAL_ENV' in os.environ:
    project_base_dir = os.environ['VIRTUAL_ENV']
    sys.path.insert(0, project_base_dir)
    activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
    execfile(activate_this, dict(__file__=activate_this))
EOF

"""" Custom keys
"" run python of the current buffer
nnoremap <buffer> <F9> :exec '!python' shellescape(@%, 1)<cr>
noremap <F5> :call VimuxRunCommand("python " . @%)<CR>
"" Duplicate Line
noremap <c-d> yyp<CR>
inoremap <c-d> <ESC> yyp
noremap <c-i> gg=G<CR>
noremap <c-I> :call Indent()<CR>

function! Indent()
    let line=line('.')
    :normal gg=G
    :execute "normal! " . line . "G" 
endfunction

""
noremap <c-4> :bp<CR>
noremap <c-6> :bnext<CR>

""""" Custom settings
"" Powerline
"let g:Powerline_symbols = "fancy"
set laststatus=2
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1

"" set tabs to have 4 spaces
set ts=4

"" indent when moving to the next line while writing code
"" indent when moving to the next line while writing code
set autoindent
set smartindent

"" expand tabs into spaces
set expandtab

"" when using the >> or << commands, shift lines by 4 spaces
set shiftwidth=4

"" show a visual line under the cursor's current line 
set cursorline

"" auto save
au FocusLost * :wa
set autowrite

"" col number
"set statusline+=%F\ %l\:%c

"" col limits
au FileType python set colorcolumn=80

"remember last position
if has("autocmd")
      au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif
