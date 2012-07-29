set nocompatible
call pathogen#infect()
call pathogen#helptags()
call pathogen#runtime_append_all_bundles()
let mapleader=","
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>
" Включаем перенос строк
set wrap
set wrapmargin=5
" Перенос строк по словам, а не по буквам
set linebreak
"  Включаем отображение выполняемой в данный момент команды в правом нижнем углу экрана.
" К примеру, если вы наберете 2d, то в правом нижнем углу экрана Vim отобразит строку 2d.
set showcmd
" Включаем отображение дополнительной информации в статусной строке
"set statusline=%<%f%h%m%r%=format=%{&fileformat}\ file=%{&fileencoding}\ enc=%{&encoding}\ %b\ 0x%B\ %l,%c%V\ %P
" цветовая схема
colorscheme sweyla429960 
set tabstop=4
set shiftwidth=4
set smarttab
set et
set autoindent
set smartindent
syntax on
" Всегда отображаться статусную строку для каждого окна
set laststatus=2
set ai
set showmatch
" Подсветка выражения, которое ищется
set hlsearch
" Переход на найденный текст в процессе
set incsearch
" Игнорировать регистр при поиске
set ignorecase
set lz
set ffs=unix,dos,mac
set fencs=utf-8,cp1251,koi8-r,ucs-2,cp866
synt on
set number
set showmatch
nmap <F10> :q!<cr>
nmap <F2> :w<cr>
vmap <F2> <esc>:w<cr>i
imap <F2> <esc>:w<cr>i
set ruler
" Отключить бэкапы файлов при редактировании
set nobackup
" Отключить swap
set noswapfile
filetype plugin indent on
set pastetoggle=<F3>
" Мышка в текстовом режиме (для копирования из терминалов)
set mouse=a
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>
cmap w!! w !sudo tee % >/dev/null


map <F4>  <esc>:call SWITCHFOLD()<cr>
function SWITCHFOLD()
if &foldmethod=="marker"
set foldmethod=syntax
return
endif
if &foldmethod=="syntax"
set foldmethod=indent
return
endif
if &foldmethod=="indent"
set foldmethod=manual
return
endif
if &foldmethod=="manual"
set foldmethod=marker
return
endif
endfunction
" работа с русской клавиатурой 
set keymap=russian-jcukenwin
set iminsert=0
" Переключение раскладок и индикация выбранной
" в данный момент раскладки.
" -->
" Переключение раскладок будет производиться по <C-F>
"
" При английской раскладке статусная строка текущего окна будет синего
" цвета, а при русской - зеленого.
function MyKeyMapHighlight()
if &iminsert == 0
hi StatusLine ctermfg=DarkBlue guifg=DarkBlue
else
hi StatusLine ctermfg=DarkGreen guifg=DarkGreen
endif
endfunction
"Вызываем функцию, чтобы она установила цвета при запуске Vim'a
call MyKeyMapHighlight()
" При изменении активного окна будет выполняться обновление
" индикации текущей раскладки
au WinEnter * :call MyKeyMapHighlight()
cmap <silent> <C-F> <C-^>
imap <silent> <C-F> <C-^>X<Esc>:call MyKeyMapHighlight()<CR>a<C-H>
nmap <silent> <C-F> a<C-^><Esc>:call MyKeyMapHighlight()<CR>
vmap <silent> <C-F> <Esc>a<C-^><Esc>:call MyKeyMapHighlight()<CR>gv

cmap <C-F> <C-^><C-R>=MyKeyMapHighlight()<CR><Left><Del>

" Восстановление позиции в ранее открытом файле
"if has("autocmd")
"    set viewoptions=cursor,folds
"    au BufWinLeave * mkview
"    au BufWinEnter * silent loadview
"endif

