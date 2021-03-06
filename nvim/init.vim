call plug#begin('~/.vim/plugged')

source /home/anhltt/.config/nvim/plugin_list.vim

" Initialize plugin system
call plug#end()

""" Quickly edit/reload configuration file
nnoremap gev :e /home/anhltt/.config/nvim/init.vim<CR>
nnoremap gsv :so /home/anhltt/.config/nvim/init.vim<CR>

set nocompatible              " be iMproved, required
filetype off                  " required
filetype plugin indent on     " required
syntax on

" Uncomment the following to have Vim jump to the last position when
" reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" Uncomment the following to have Vim load indentation rules and plugins
" according to the detected filetype.
if has("autocmd")
  filetype plugin indent on
endif

" The following are commented out as they cause vim to behave a lot
" differently from regular Vi. They are highly recommended though.
set showcmd		" Show (partial) command in status line.
set showmatch		" Show matching brackets.
set ignorecase		" Do case insensitive matching
set smartcase		" Do smart case matching
set incsearch		" Incremental search
set autowrite		" Automatically save before commands like :next and :make
set hidden		" Hide buffers when they are abandoned
set mouse=a		" Enable mouse usage (all modes)

set t_Co=256
set background=dark

" Autoindent options
set tabstop=4
set softtabstop=4
"set noexpandtab
set expandtab
set shiftwidth=4
set autoindent
set smartindent
set cindent
set number
set nocompatible
set mouse=a
set cursorline


" Enable save as root hack
cmap w!! w !sudo tee > /dev/null %

function! FzyCommand(choice_command, vim_command)
  try
    let output = system(a:choice_command . " | fzy ")
  catch /Vim:Interrupt/
    " Swallow errors from ^C, allow redraw! below
  endtry
  redraw!
  if v:shell_error == 0 && !empty(output)
    exec a:vim_command . ' ' . output
  endif
endfunction

"nmap <C-P> :call FzyCommand("find . -type f", ":e")<cr>
nmap <C-P> :Files<cr>
nnoremap <leader>v :call FzyCommand("find . -type f", ":vs")<cr>
nmap ; :Buffers<CR>

nmap <Leader>a :Ag
nmap <Leader>A vaw"ay:Ag <C-R>a

set termguicolors

colorscheme codedark
let g:airline_theme = 'codedark'

