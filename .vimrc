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
set mouse=a
" 字符编码
set encoding=utf-8
" 配色标准
let &t_ut=''
" Tab缩进设置
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4
set tw=0
set indentexpr=
" 显示空格
set list
set listchars=tab:▸\ ,trail:▫
" 光标固定在上5行和下5行
set scrolloff=5
" 退格键能从下一行删除到上一行
set backspace=indent,eol,start
" 收起代码
set foldmethod=indent
set foldlevel=99
" 修改普通模式下的光标和插入模式的光标 
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_SR = "\<Esc>]50;CursorShape=2\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"
" 状态栏调整
set laststatus=2
" 在当前目录下执行命令
set autochdir
" 保存修改时的位置
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
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
noremap D dw
noremap <LEADER>q :q!<CR>
" 关闭高亮
noremap <LEADER><CR> :nohlsearch<CR>
" Compile function
noremap <LEADER>r :call CompileRunGcc()<CR>
" markdown表格
noremap <LEADER>tm :TableModeToggle<CR>
" Copy to system clipboard
noremap Y :w !xclip -i -sel c<CR><CR>
" 寻找<++>并修改
noremap  <LEADER><LEADER> <Esc>/<++><CR>:nohlsearch<CR>c4i
" Spelling Check with 
" 拼写检查
noremap <LEADER>sc :set spell!<CR>
noremap  <C-x> ea<C-x>s
inoremap <C-x> <Esc>ea<C-x>s
" Auto change directory to current dir
autocmd BufEnter * silent! lcd %:p:h
" 识别文件格式，然后执行相对应的命令
func! CompileRunGcc()
	exec "w"
	if &filetype == 'c'
		exec "!g++ % -o %<"
		exec "!time ./%<"
	elseif &filetype == 'cpp'
		set splitbelow
		exec "!g++ -std=c++11 % -Wall -o %<"
		:sp
		:res -15
		:term ./%<
	elseif &filetype == 'java'
		exec "!javac %"
		exec "!time java %<"
	elseif &filetype == 'sh'
		:!time bash %
	elseif &filetype == 'python'
		set splitbelow
        :sp
		:term python3 %
	elseif &filetype == 'html'
		silent! exec "!chromium % &"
	elseif &filetype == 'markdown'
		exec "MarkdownPreview"
	elseif &filetype == 'tex'
		silent! exec "VimtexStop"
		silent! exec "VimtexCompile"
	elseif &filetype == 'go'
		set splitbelow
		:sp
		:term go run %
	endif
endfunc
" ----------------------------------------
" 插件安装 " 
call plug#begin('~/.vim/plugged')
" 状态栏和配色
Plug 'vim-airline/vim-airline'
Plug 'connorholyday/vim-snazzy'
" markdown网页浏览
Plug 'iamcco/markdown-preview.vim'
" markdown表格
Plug 'dhruvasagar/vim-table-mode', { 'on': 'TableModeToggle' }
" Markdown
call plug#end()
" ===
" === MarkdownPreview
" ===
let g:mkdp_path_to_chrome = "google-chrome-stable"
let g:mkdp_auto_start = 1
let g:mkdp_browser = 'chrome'
source ~/.vim/Markdown.vim
" ------------------------------------------------
" 配色
color snazzy
"let g:SnazzyTransparent = 1