" 设置leader键位为空格
let mapleader=" "
" 高亮开
syntax on
" 识别不同文件格式
set nocompatible
filetype on
filetype indent on
filetype plugin on
filetype plugin indent on
" 鼠标开关
" 字符编码
" 配色标准
" Tab缩进设置
" 显示行尾空格
"
" 设置行号
set nu
" 显示行的效果
set relativenumber
" 在当前行显示有一条线
set cursorline
" 自动换行
set wrap
" 显示输入的字符
set showcmd
" 补全命令
set wildmenu
" 搜索的设置
set hlsearch
exec "nohlsearch"
set incsearch
set ignorecase
set smartcase

" 重载配置文件
map R :source $MYVIMRC<CR>
" 快速保存
map S :w<CR>
" 快速退出
map Q :q<CR>
" 水平分屏
map sl :set splitright<CR>:vsplit<CR>
map sh :set nosplitright<CR>:vsplit<CR>
map sh <C-w>t<C-w>H
" 垂直分屏
map sk :set nosplitbelow<CR>:split<CR>
map sj :set splitbelow<CR>:split<CR>
map sv <C-w>t<C-w>K
" 分屏坐标和大小
map <LEADER>h <C-w>h
map <LEADER>l <C-w>l
map <LEADER>j <C-w>j
map <LEADER>k <C-w>k

map <up> :res +5<CR>
map <down> :res -5<CR>
map <left> :vertical resize-5<CR>
map <right> :vertical resize+5<CR>
" 标签设置
map tb :tabe<CR>
map tn :-tabnext<CR>
map tm :+tabnext<CR>
" 禁用J
map J <nop>
" 用于分屏
map s <nop>

" 键位映射
noremap H 5j
noremap L 5k
noremap <LEADER><CR> :nohlsearch<CR>

" 插件安装 " 
call plug#begin('~/.vim/plugged')
Plug 'vim-airline/vim-airline'
Plug 'connorholyday/vim-snazzy'
call plug#end()

color snazzy
"let g:SnazzyTransparent = 1
