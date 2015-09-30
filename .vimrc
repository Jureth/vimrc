set nocompatible
set noendofline
set backspace=indent,eol,start
set mousehide
set nobackup
set history=10
set ruler
set showcmd
set incsearch
set sw=4
syntax on
set autoindent
set number
set numberwidth=4
set nowrap
set autoread
set wrapscan
set guifont=Courier\ New\ 14
"set guifont=Sans\ Serif\ 12
"set guifont=Verdana\ 12\ bold
"
hi comment ctermfg=cyan
" Фолдинг по отсупам
set foldmethod=manual
set foldlevel=50
set nohlsearch
" Теперь нет необходимости передвигать курсор к краю экрана, чтобы подняться в режиме редактирования
set scrolljump=7
" Теперь нет необходимости передвигать курсор к краю экрана, чтобы опуститься в режиме редактирования
set scrolloff=7
" Выключаем надоедливый "звонок"
set novisualbell
set t_vb= 
" Поддержка мыши
" set mouse=a
" set mousemodel=popup

" Кодировка текста по умолчанию
set termencoding=utf-8

" Не выгружать буфер, когда переключаемся на другой. Это позволяет редактировать несколько файлов в один и тот же момент без необходимости сохранения каждый раз когда переключаешься между ними
set hidden

" Скрыть панель в gui версии ибо она не нужна
set guioptions-=T

" Сделать строку команд высотой в одну строку
set ch=1

" Скрывать указатель мыши, когда печатаем
" set mousehide
" Преобразование Таба в пробелы
set expandtab

" Размер табулации по умолчанию
set shiftwidth=4
set softtabstop=4
set tabstop=4

" Формат строки состояния
set statusline=%<%f%h%m%r\ %b\ %{&encoding}\ 0x\ \ %l,%c%V\ %P 
set laststatus=2

" Включаем "умные" отспупы ( например, автоотступ после {)
set smartindent

" Fix <Enter> for comment
set fo+=cr

" Опции сесссий
set sessionoptions=curdir,buffers,tabpages

behave xterm

noremap <A-Right> <C-w>>
noremap <A-Left> <C-w><

"-------------------------
"" Горячие клавишы
"-------------------------
"
" Пробел в нормальном режиме перелистывает страницы
nmap <Space> <PageDown>

" CTRL-F для omni completion
imap <C-F> <C-X><C-O>

" Заставляем shift-insert работать как в Xterm
map <S-Insert> <MiddleMouse>

" C-y - удаление текущей строки
nmap <C-y> dd
imap <C-y> <esc>ddi

" C-d - дублирование текущей строки
imap <C-d> <esc>yypi

" Поиск и замена слова под курсором
nmap ; :%s/\<<c-r>=expand("<cword>")<cr>\>/

" CTRL-X and SHIFT-Del are Cut
vnoremap <S-Del> "+x

" CTRL-C and CTRL-Insert are Copy
vnoremap <C-Insert> "+y

" CTRL-V and SHIFT-Insert are Paste
map <S-Insert>		"+gP

" F2 - быстрое сохранение
nmap <F2> :w<cr>
vmap <F2> <esc>:w<cr>i
imap <F2> <esc>:w<cr>i

" F3 - просмотр ошибок
nmap <F3> :copen<cr>
vmap <F3> <esc>:copen<cr>
imap <F3> <esc>:copen<cr>

" F5 - просмотр списка буферов
nmap <F5> <Esc>:BufExplorer<cr>
vmap <F5> <esc>:BufExplorer<cr>
imap <F5> <esc><esc>:BufExplorer<cr>

" F6 - предыдущий буфер
map <F6> :bp<cr>
vmap <F6> <esc>:bp<cr>i
imap <F6> <esc>:bp<cr>i

" F7 - следующий буфер
map <F7> :bn<cr>
vmap <F7> <esc>:bn<cr>i
imap <F7> <esc>:bn<cr>i

" F8 - список закладок
map <F8> :MarksBrowser<cr>
vmap <F8> <esc>:MarksBrowser<cr>
imap <F8> <esc>:MarksBrowser<cr>

" F9 - "make" команда
map <F9> :make<cr>
vmap <F9> <esc>:make<cr>i
imap <F9> <esc>:make<cr>i

" F10 - удалить буфер
map <F10> :bd<cr>
vmap <F10> <esc>:bd<cr>
imap <F10> <esc>:bd<cr>

" F11 - показать окно Taglist
map <F11> :TlistToggle<cr>
vmap <F11> <esc>:TlistToggle<cr>
imap <F11> <esc>:TlistToggle<cr>

" F12 - обозреватель файлов
map <F12> :Ex<cr>
vmap <F12> <esc>:Ex<cr>i
imap <F12> <esc>:Ex<cr>i
" CTRL-A to select all

noremap <C-A> gggH<C-O>G
inoremap <C-A> <C-O>gg<C-O>gH<C-O>G
cnoremap <C-A> <C-C>gggH<C-O>G
onoremap <C-A> <C-C>gggH<C-O>G
snoremap <C-A> <C-C>gggH<C-O>G
xnoremap <C-A> <C-C>ggVG

" CTRL-Tab is Next window
noremap <C-Tab> <C-W>w
inoremap <C-Tab> <C-O><C-W>w
cnoremap <C-Tab> <C-C><C-W>w
onoremap <C-Tab> <C-C><C-W>w

" CTRL-F4 is Close window
noremap <C-F4> <C-W>c
inoremap <C-F4> <C-O><C-W>c
cnoremap <C-F4> <C-C><C-W>c
onoremap <C-F4> <C-C><C-W>c

" < & > - делаем отступы для блоков
vmap < <gv
vmap > >gv

" Выключаем ненавистный режим замены
imap <Ins> <Esc>i

set fileencodings=utf8,cp1251,default

function TOutf8()
:!enconv -L ru -x utf8 %
:e
endfunction

function ClearMStags()
:%s///g
:%s/^ \+//
:%s/<img\_.\{-}src="\(.\{-}\)"\_.\{-}>/[IMAGE="\1"]/g
:%s/\(<\w\{-}\)\( \|\n\)\(.\|\n\)\{-}>/\1>/g
:%s/\%^\_.\{-}\(<table>\)/\1/g
:%s/\(<\/table>\)\_.*/\1/g
:%s/<!--\(.\|\n\)\{-}-->//g
:%s/<!.\{-}>//g
:%s/<\/\?\(span\|p\|b\|h\d\|sub\|o:p\)>//g
:%s/&nbsp;//g
:%s/\([^<>]\)\(\n\|\s\)\+\([^<>]\)/\1 \3/g
:%s/\(<td>\)\(\n\|\s\|\t\)\+\(\_.\{-}\)\n\{-}\(<\/td>\)/\1\3\4/g
endfunction

function SVNRelog()
:s/r\(\d\{-}\)\s|\(.\{-}\)|\(.\{-}\)|.\+/Версия: \1Автор:\2Дата:\3Комментарий:/
endfunction

function CopyPastMode()
set nosmartindent
set nocindent
set noautoindent
endfunction

function NoCopyPasteMode()
set smartindent
set autoindent
endfunction

" Автозавершение слов по tab =)
function InsertTabWrapper()
	let col = col('.') - 1
  	if !col || getline('.')[col - 1] !~ '\k'
   		return "\<tab>"
	else
     	return "\<c-p>"
    endif
endfunction

function IndentOff()
    :nocindent
    :nosmartindent
    :noautoindent
endfunction

imap <tab> <c-r>=InsertTabWrapper()<cr>

" Слова откуда будем завершать
set complete=""
" Из текущего буфера
set complete+=.
" Из словаря
set complete+=k
" Из других открытых буферов
set complete+=b
" из тегов 
set complete+=t

" Включаем filetype плугин. Настройки, специфичные для определынных файлов мы разнесём по разным местам
filetype plugin on
au BufRead,BufNewFile *.phps set filetype=php
au BufRead,BufNewFile *.thtml set filetype=php

" Настройки для SessionMgr
let g:SessionMgr_AutoManage = 0
let g:SessionMgr_DefaultName = "mysession"

" Настройки для Tlist (показвать только текущий файл в окне навигации по коду)
let g:Tlist_Show_One_File = 1

set completeopt-=preview
set completeopt+=longest
set mps-=[:]
