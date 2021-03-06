""
""  ____    _____   _____
"<Leader>s触发/关闭语法检查
"" / ___|  | ____| |_   _|
"" \___ \  |  _|     | |
""  ___) | | |___    | |
"" |____/  |_____|   |_|
""
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
" 高亮开
syntax on
hi Normal  ctermfg=252 ctermbg=none
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
set scrolloff=8
" 退格键能从下一行删除到上一行
set backspace=indent,eol,start
" 收起代码
set foldmethod=syntax
set foldlevel=999
" 修改普通模式下的光标和插入模式的光标
let &t_SI = "\<Esc>]50;CursorShape=1\x8"
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
" 未知设置
set autoindent
set ttimeoutlen=0
set notimeout
set viewoptions=cursor,folds,slash,unix
set foldenable
set formatoptions-=tc
set splitright
set splitbelow
set noshowmode
set wildmenu
set shortmess+=c
set inccommand=split
set ttyfast "should make scrolling faster
set lazyredraw "same as above
set visualbell
silent !mkdir -p ~/.config/nvim/tmp/backup
silent !mkdir -p ~/.config/nvim/tmp/undo
set backupdir=~/.config/nvim/tmp/backup,.
set directory=~/.config/nvim/tmp/backup,.
if has('persistent_undo')
    set undofile
    set undodir=~/.config/nvim/tmp/undo,.
endif
" 中间会出现一条线
"set colorcolumn=80
"set updatetime=1000
""
""  __  __
"" |  \/  |   __ _   _ __
"" | |\/| |  / _` | | '_ \
"" | |  | | | (_| | | |_) |
"" |_|  |_|  \__,_| | .__/
""                  |_|
""
" 空格
let mapleader="\<Space>"

" 单键映射
map S :w<CR>
map Q :q!<CR>
" 修改窗口大小
map <up> :res +5<CR>
map <down> :res -5<CR>
map <left> :vertical resize-5<CR>
map <right> :vertical resize+5<CR>
" 禁用J
" 用于分屏
map J <nop>
map s <nop>
nnoremap < <<
nnoremap > >>
noremap H 5j
noremap L 5k
noremap D d$


 " _____   ___   _       _____ 
" |  ___| |_ _| | |     | ____|
" | |_     | |  | |     |  _|  
" |  _|    | |  | |___  | |___ 
" |_|     |___| |_____| |_____|
map <leader>fr :source ~/.config/nvim/init.vim<CR>
map <LEADER>fw :w !sudo tee %<CR>
map <leader>fs :r !figlet 
vnoremap <leader>fy "hy<Esc><Esc>:%s/<C-r>h//g<left><left>
vnoremap <leader>f5 :s/<C-r>a/<C-r>b/g
noremap <LEADER>f4 :%s//g<left><left>

" 复制 <leader>y
noremap <leader>ya viw"ay
noremap <leader>yb viw"by
noremap <leader>yj viw"jy
vnoremap <leader>ya "ay
vnoremap <leader>yb "by
vnoremap <leader>yj "jy
vnoremap <leader>yy "+y

" 复制 <leader>y
noremap <leader>va ggVG


" __        __  ___   _   _   ____     ___   __        __  ____  
" \ \      / / |_ _| | \ | | |  _ \   / _ \  \ \      / / / ___| 
 " \ \ /\ / /   | |  |  \| | | | | | | | | |  \ \ /\ / /  \___ \ 
  " \ V  V /    | |  | |\  | | |_| | | |_| |   \ V  V /    ___) |
   " \_/\_/    |___| |_| \_| |____/   \___/     \_/\_/    |____/ 
" 上下左右分屏
noremap <leader>wK :set nosplitbelow<CR>:split<CR>
noremap <leader>wJ :set splitbelow<CR>:split<CR>
noremap <leader>wH :set nosplitright<CR>:vsplit<CR>
noremap <leader>wL :set splitright<CR>:vsplit<CR>
" 上下左右交换位置
map <leader>wv <C-w>t<C-w>K
map <leader>wb <C-w>t<C-w>H
" 切换窗口焦点
map <LEADER>wk <C-w>k
map <LEADER>wj <C-w>j
map <LEADER>wh <C-w>h
map <LEADER>wl <C-w>l


" _____      _      ____  
"|_   _|    / \    | __ ) 
"  | |     / _ \   |  _ \ 
"  | |    / ___ \  | |_) |
"  |_|   /_/   \_\ |____/ 
" 新建标签
" 向前切换标签
" 向后切换标签
map <leader>tt :tabe<CR>
map <leader>t, :-tabnext<CR>
map <leader>t. :+tabnext<CR>



"插入模式下 使用 emacs 的移动方式
fun! Exec(cmd)
    exe a:cmd
    return ''
endf
map <silent><C-e> $
" map <silent><C-a> ^
inoremap <C-p>  <up>
inoremap <C-n>  <down>
inoremap <C-b>  <left>
inoremap <C-f>  <right>
inoremap <silent><C-a> <c-r>=Exec('norm! I')<cr><right>
inoremap <silent><C-e> <c-r>=Exec('norm! A')<cr><right>
inoremap <silent><A-f> <c-r>=Exec('norm! e')<cr><right>
inoremap <silent><A-B> <c-r>=Exec('norm! b')<cr>
" 快速跳到单词结尾
inoremap <silent><C-j> <Esc>/\w\><cr>:noh<cr>a
inoremap <silent><C-k> <Esc>?\w\><cr>:noh<cr>a
" 快速删除
inoremap <silent> `` `
inoremap <silent> `p <C-r>"
inoremap <silent> `' <c-r>=Exec("norm! di'")<cr>
inoremap <silent> `" <c-r>=Exec('norm! di"')<cr>
inoremap <silent> `) <c-r>=Exec("norm! di)")<cr>
inoremap <silent> `] <c-r>=Exec("norm! di]")<cr>
inoremap <silent> `} <c-r>=Exec("norm! di}")<cr>
inoremap <silent> `> <c-r>=Exec("norm! di>")<cr>
" 简化操作
noremap <silent><C-j> o<Esc>
noremap <silent><C-k> O<Esc>
noremap <silent><C-l> {
noremap <silent><C-h> }
inoremap jj <Esc><Esc>

noremap <LEADER><CR> :nohlsearch<CR>
noremap <LEADER>mt :TableModeToggle<CR>
" noremap  <LEADER><LEADER> <Esc>/<CR>:nohlsearch<CR>c4l
noremap <LEADER>s :set splitbelow<CR>:sp<CR>:term<CR>

" 自动将目录更改为当前目录
autocmd BufEnter * silent! lcd %:p:h

" nvim
" Snippets
" auto spell
autocmd BufRead,BufNewFile *.md setlocal spell
" noremap <silent> <LEADER>o za
noremap <LEADER>c- :lN<CR><space>
noremap <LEADER>c= :lne<CR>
vnoremap <leader>cj difun_name()<Esc>hp?fun_name<CR>:noh<CR>ciw
noremap <LEADER>cr :call CompileRunGcc()<CR><CR>
""""
"" _____
""|  ___|   _ _ __   ___
""| |_ | | | | '_ \ / __|
""|  _|| |_| | | | | (__
""|_|   \__,_|_| |_|\___|
""
""
""""
" 编译
func! CompileRunGcc()
    exec "w"
    :execute "normal \<C-w>o"
    if &filetype == 'c'
        exec "!g++ % -o %<"
        exec "!time ./%<"
    elseif &filetype == 'cpp'
        "set splitbelow
        exec "!g++ -std=c++11 % -Wall -o %<"
        :8sp
        :term ./%<
    elseif &filetype == 'java'
        exec "!javac %"
        :8sp
        :term java %<
    elseif &filetype == 'sh'
        :!time bash %
    elseif &filetype == 'python'
        set splitbelow
        :8sp
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
        :8sp
        :term go run %
    endif
    :execute "normal \<C-w>p"
endfunc

""  ____  _
"" |  _ \| |_   _  __ _
"" | |_) | | | | |/ _` |
"" |  __/| | |_| | (_| |
"" |_|   |_|\__,_|\__, |
""                |___/
" ----------------------------------------
" ===
" === Auto load for first time uses
" ===
if empty(glob('~/.config/nvim/autoload/plug.vim'))
    silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
                \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" 插件安装 "
call plug#begin('~/.vim/plugged')
" 已掌握的插件
" 状态栏
" 配色
" markdown语法高亮
" markdown网页浏览
" markdown表格
" nerdtree-git-plug
" 函数快速导航
" 错误提示并提供建议
" 自动匹配括号
" 打开ranger
" 标签
" 撤销树
" 快速注释
" 自动格式化
" 代码补全工具
" 弹出快捷键
"
" 最小插件
Plug 'vim-airline/vim-airline'
Plug 'connorholyday/vim-snazzy'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'liuchengxu/vista.vim', { 'commit': '4387164845165634a06941b17c2b4f398cffd193' }
Plug 'francoiscabrol/ranger.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'liuchengxu/vim-which-key'
Plug 'Yggdroot/indentLine'
Plug 'luochen1990/rainbow'
Plug 'ryanoasis/vim-devicons'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'rhysd/clever-f.vim'

" Plug 'gabrielelana/vim-markdown'
Plug 'iamcco/markdown-preview.vim'
Plug 'dhruvasagar/vim-table-mode', { 'on': 'TableModeToggle' }
Plug 'dense-analysis/ale'
Plug 'scrooloose/nerdcommenter' " in <space>cc to comment a line
" Plug 'neoclide/coc.nvim', {'branch': 'master', 'do': 'yarn install --frozen-lockfile'}
" 新添加的
" Plug 'majutsushi/tagbar'

" 暂不使用
" Plug 'mbbill/undotree'
" Plug 'Chiel92/vim-autoformat'
" Plug 'tell-k/vim-autopep8'
" Plug 'OmniSharp/omnisharp-vim'
" Plug 'airblade/vim-gitgutter'
" Plug 'godlygeek/tabular' " type ;Tabularize /= to align the =
Plug 'kshenoy/vim-signature'
" Plug 'jiangmiao/auto-pairs'


"" 暂时未配置的
" coc
" Snippets
" gitgutter
" Taglist
"Plug 'theniceboy/eleline.vim'
" Snippets
" 文本对齐
" Plug 'lyokha/vim-xkbswitch' " type ;Tabularize /= to align the =

" 用于删除缓冲区而不关闭窗口
" Plug 'rbgrouleff/bclose.vim' " For ranger.vim
" 多光标 （暂时不用)
" Plug 'terryma/vim-multiple-cursors'
" 代码片段重构等操作，可以通过自定义读取代码代替
" Plug 'SirVer/ultisnips'
" Plug 'honza/vim-snippets'
" 依赖 "
" 文件类型图标
call plug#end()
" ===
" === MarkdownPreview
" ===
let g:mkdp_path_to_chrome = "chromium"
let g:mkdp_auto_start = 0
let g:mkdp_browser = 'chrome'
source ~/.vim/Markdown.vim
" ------------------------------------------------
" 配色
let g:SnazzyTransparent = 1
color snazzy
" ===
" === coc
" ===
" 使用CocInstall 安装语言支持 例子:CocInstall coc-xx
" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=1

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
" nmap <silent> [g <Plug>(coc-diagnostic-prev)
" nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-refactor)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end


" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)
nmap <leader>cf <Plug>(coc-format)
nmap <leader>jf <Plug>(coc-float-jump)
noremap <LEADER>jn :e /home/yzl178me/.config/nvim/init.vim<CR>
" Apply AutoFix to problem on the current line.
" nmap <leader>qf  <Plug>(coc-fix-current)

" ===
" === NERDTree
" ===
noremap <leader>tt :NERDTreeToggle<CR>
let NERDTreeMapOpenExpl = ""
let NERDTreeMapUpdir = "N"
let NERDTreeMapUpdirKeepOpen = "n"
let NERDTreeMapOpenSplit = ""
let NERDTreeMapOpenVSplit = "I"
let NERDTreeMapActivateNode = "i"
let NERDTreeMapOpenInTab = "o"
let NERDTreeMapOpenInTabSilent = "O"
let NERDTreeMapPreview = ""
let NERDTreeMapCloseDir = ""
let NERDTreeMapChangeRoot = "l"
let NERDTreeMapMenu = ","
let NERDTreeMapToggleHidden = "zh"

" ==
" == NERDTree-git
" ==
let g:NERDTreeIndicatorMapCustom = {
            \ "Modified"    : "✹",
            \ "Staged"      : "✚",
            \ "Untracked" : "✭",
            \ "Renamed"  : "➜",
            \ "Unmerged"    : "═",
            \ "Deleted"  : "✖",
            \ "Dirty"        : "✗",
            \ "Clean"        : "✔︎",
            \ "Unknown"  : "?"
            \ }


" ===
" === Vista.vim
" ===
" 我最初启动vista.vim的目的是替换标签栏，因为它似乎没有计划支持有前途的Language Server协议和异步处理。
" 除了成为标签查看器之外，vista.vim还可以是类似于ctrlp-funky的符号导航器。最后但并非最不重要的一点，vista.vim的一个重要目标是支持LSP符号，该符号理解语义，而不仅是正则表达式。
" How each level is indented and what to prepend.
" This could make the display more compact or more spacious.
" e.g., more compact: ["▸ ", ""]
" Note: this option only works the LSP executives, doesn't work for `:Vista ctags`.
let g:vista_icon_indent = ["╰─▸ ", "├─▸ "]

" Executive used when opening vista sidebar without specifying it.
" See all the avaliable executives via `:echo g:vista#executives`.
let g:vista_default_executive = 'ctags'

" Set the executive for some filetypes explicitly. Use the explicit executive
" instead of the default one for these filetypes when using `:Vista` without
" specifying the executive.
let g:vista_executive_for = {
  \ 'cpp': 'vim_lsp',
  \ 'php': 'vim_lsp',
  \ }
noremap <LEADER>cv  :Vista nvim_lsp<CR>
" noremap <LEADER>cV  :Vista finder fzf<CR>
noremap <LEADER>cV  :call vista#finder#fzf#Run('coc')<CR>
" inoremap <C-P> <C-\><C-O>:call CocActionAsync('showSignatureHelp')<cr>

" Declare the command including the executable and options used to generate ctags output
" for some certain filetypes.The file path will be appened to your custom command.
" For example:
let g:vista_ctags_cmd = {
      \ 'haskell': 'hasktags -x -o - -c',
      \ }

" To enable fzf's preview window set g:vista_fzf_preview.
" The elements of g:vista_fzf_preview will be passed as arguments to fzf#vim#with_preview()
" For example:
let g:vista_fzf_preview = ['right:50%']
" Ensure you have installed some decent font to show these pretty symbols, then you can enable icon for the kind.
let g:vista#renderer#enable_icon = 1

" The default icons can't be suitable for all the filetypes, you can extend it as you wish.
let g:vista#renderer#icons = {
\   "function": "\uf794",
\   "variable": "\uf71b",
\  }
" ===
" === FZF
" ===
noremap <Leader>fF :FZF<CR>

" === ranger
nnoremap <LEADER>fR :Ranger<CR>
let g:ranger_map_keys = 0

" ===
" === vim-signature
" ===
let g:SignatureMap = {
            \ 'Leader':"m",
            \ 'PlaceNextMark':"m,",
            \ 'ToggleMarkAtLine':"m.",
            \ 'PurgeMarksAtLine':"dm",
            \ 'DeleteMark':"",
            \ 'PurgeMarks':"",
            \ 'PurgeMarkers':"",
            \ 'GotoNextLineAlpha':"m<LEADER>",
            \ 'GotoPrevLineAlpha':"",
            \ 'GotoNextSpotAlpha':"m<LEADER>",
            \ 'GotoPrevSpotAlpha':"",
            \ 'GotoNextLineByPos':"",
            \ 'GotoPrevLineByPos':"",
            \ 'GotoNextSpotByPos':"",
            \ 'GotoPrevSpotByPos':"",
            \ 'GotoNextMarker':"",
            \ 'GotoPrevMarker':"",
            \ 'GotoNextMarkerAny':"",
            \ 'GotoPrevMarkerAny':"",
            \ 'ListLocalMarks':"m/",
            \ 'ListLocalMarkers':"m?"
            \ }


" ===
" === ale
" ===
let g:ale_virtualtext_cursor = 1
" 将ALE限制为仅使用OmniSharp
let g:ale_linters = {
            \ 'cs': ['OmniSharp']
            \}
" 语法检查使用的工具 可以去插件里面查看支持的工具/home/yzl178me/.vim/plugged/ale/ale_linters/ada
let g:ale_linters = {
            \   'cpp': ['clang'],
            \   'c': ['clang'],
            \   'python': ['pylint'],
            \}
" 自动修复使用的工具
let g:ale_fixers = {
            \   'cpp': ['clangtidy'],
            \   'c': ['clangtidy'],
            \   'python': ['add_blank_lines_for_python_control_statements','isort','autopep8','autoimport','yapf'],
            \   'java': ['uncrustify'],
            \}
let g:ale_cpp_ccls_init_options = {
            \   'cache': {
            \       'directory': '/tmp/ccls/cache'
            \   }
            \ }
let g:ale_c_gcc_executable = '/usr/bin/gcc'
"let g:ale_c_gcc_options="-Wall -O2"
"自定义error和warning图标
let g:ale_sign_error = '✗'
let g:ale_sign_warning = '⚡'
"在vim自带的状态栏中整合ale
let g:ale_statusline_format = ['✗ %d', '⚡ %d', '✔ OK']
"显示Linter名称,出错或警告等相关信息
let g:ale_echo_msg_error_str = '✗'
let g:ale_echo_msg_warning_str = '⚡'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
"普通模式下，sp前往上一个错误或警告，sn前往下一个错误或警告
nmap <leader>c> <Plug>(ale_previous_wrap)
nmap <leader>c< <Plug>(ale_next_wrap)
nmap <leader>cq :ALEToggle<CR>
"<Leader>d查看错误或警告的详细信息
nmap <leader>cI :ALEDetail<CR>
" 自动修复
nmap <leader>cx <Plug>(ale_fix)

" nerdcommenter
let g:NERDSpaceDelims=1

" 快捷键菜单
" 弹出延迟
nnoremap <leader>/  :WhichKey '<Space>'<CR>
set timeoutlen=500
call which_key#register('<Space>', "g:which_key_map")
" nnoremap <silent> <leader> :<c-u>WhichKey '<Space>'<CR>
" vnoremap <silent> <leader> :<c-u>WhichKeyVisual '<Space>'<CR>
let g:which_key_map = { 's':'shell','<CR>':'取消高亮' }
let g:which_key_map.c = {
            \'name' : '代码',
            \ '>' : '跳到上一个错误',
            \ '<' : '跳到上一个错误',
            \ 'q' : '错误信息开关',
            \ 'I' : '查看错误信息',
            \ 'c' : '注释当前行',
            \ 'u' : '取消注释',
            \ ' ' : '智能注释',
            \ 'v' : '标签',
            \ 'V' : '寻找标签',
            \ 'r' : '运行代码',
            \ 'n' : '重命名',
            \ 'f' : '格式化代码',
            \}
let g:which_key_map.f = {
            \'name' : '文件',
            \ 'y' : '替换光标下的字符串',
            \ 'F' : '模糊搜索',
            \ 'r' : '刷新nvim配置文件',
            \ 'q' : '错误信息开关',
            \ 'w' : '强制写入',
            \ 's' : '艺术字',
            \ '%' : '全局替换字符串',
            \ '4' : '局部替换字符串',
            \}
let g:which_key_map.w = {
            \'name' : '窗口',
            \ 'u' : '撤销树',
            \ 'K' : '向上分屏',
            \ 'J' : '向下分屏',
            \ 'H' : '向左分屏',
            \ 'L' : '向右分屏',
            \ 'v' : '上下交换位置',
            \ 'b' : '左右交换位置',
            \ 'k' : '焦点往上移',
            \ 'j' : '焦点往下移',
            \ 'h' : '焦点往左移',
            \ 'l' : '焦点往右移',
            \}
let g:which_key_map.t = {
            \'name' : '标签',
            \ 't' : '打开文件树',
            \ 'j' : '向前切换标签',
            \ 'k' : '向后切换标签',
            \ 'q' : '退出标签',
            \}
let g:which_key_map.g = {
            \'name' : 'Git',
            \}
let g:which_key_map.m = {
            \'name' : '表格',
            \'t' : '表格模式',
            \}
let g:which_key_map.r = {
            \'name' : '代码工具',
            \'n' : '重命名',
            \}
let g:which_key_map.y = {
            \'name' : '复制操作',
            \'a' : '复制到a',
            \'b' : '复制到b',
            \}
let g:which_key_map.j = {
            \'name' : '跳转',
            \'f' : '跳转到浮动窗口',
            \'n' : '跳转到配置文件',
            \}
let g:which_key_map.v = {
            \'name' : '选择',
            \'a' : '选择全部',
            \}

" indentLine 缩进线条显示
let g:indentLine_defaultGroup = 'SpecialKey' " github
let g:indent_guides_guide_size            = 1  " 指定对齐线的尺寸
let g:indent_guides_start_level           = 2  " 从第二层开始可视化显示缩进

" rainbow 彩虹括号
let g:rainbow_active = 1
let g:rainbow_conf = {
\   'guifgs': ['darkorange3', 'seagreen3', 'royalblue3', 'firebrick'],
\   'ctermfgs': ['lightyellow', 'lightcyan','lightblue', 'lightmagenta'],
\   'operators': '_,_',
\   'parentheses': ['start=/(/ end=/)/ fold', 'start=/\[/ end=/\]/ fold', 'start=/{/ end=/}/ fold'],
\   'separately': {
\       '*': {},
\       'tex': {
\           'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/'],
\       },
\       'lisp': {
\           'guifgs': ['darkorange3', 'seagreen3', 'royalblue3', 'firebrick'],
\       },
\       'vim': {
\           'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/', 'start=/{/ end=/}/ fold', 'start=/(/ end=/)/ containedin=vimFuncBody', 'start=/\[/ end=/\]/ containedin=vimFuncBody', 'start=/{/ end=/}/ fold containedin=vimFuncBody'],
\       },
\       'html': {
\           'parentheses': ['start=/\v\<((area|base|br|col|embed|hr|img|input|keygen|link|menuitem|meta|param|source|track|wbr)[ >])@!\z([-_:a-zA-Z0-9]+)(\s+[-_:a-zA-Z0-9]+(\=("[^"]*"|'."'".'[^'."'".']*'."'".'|[^ '."'".'"><=`]*))?)*\>/ end=#</\z1># fold'],
\       },
\       'css': 0,
\   }
\}

" tagbar
" let g:tagbar_width=30
" 将tagbar的开关按键设置为 F4
" nnoremap <silent> <leader>ct :TagbarToggle<CR>

" airline
" 设置状态栏
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#buffer_nr_show = 0
let g:airline#extensions#tabline#formatter = 'default'
" let g:airline_theme = 'desertink'  " 主题
let g:airline#extensions#keymap#enabled = 1
let g:airline#extensions#tabline#buffer_idx_mode = 1
let g:airline#extensions#tabline#buffer_idx_format = {
       \ '0': '0 ',
       \ '1': '1 ',
       \ '2': '2 ',
       \ '3': '3 ',
       \ '4': '4 ',
       \ '5': '5 ',
       \ '6': '6 ',
       \ '7': '7 ',
       \ '8': '8 ',
       \ '9': '9 '
       \}
" 设置切换tab的快捷键 <\> + <i> 切换到第i个 tab
nmap <leader>t1 <Plug>AirlineSelectTab1
nmap <leader>t2 <Plug>AirlineSelectTab2
nmap <leader>t3 <Plug>AirlineSelectTab3
nmap <leader>t4 <Plug>AirlineSelectTab4
nmap <leader>t5 <Plug>AirlineSelectTab5
nmap <leader>t6 <Plug>AirlineSelectTab6
nmap <leader>t7 <Plug>AirlineSelectTab7
nmap <leader>t8 <Plug>AirlineSelectTab8
nmap <leader>t9 <Plug>AirlineSelectTab9
" 设置切换tab的快捷键 <\> + <-> 切换到前一个 tab
nmap <leader>tj <Plug>AirlineSelectPrevTab
" 设置切换tab的快捷键 <\> + <+> 切换到后一个 tab
nmap <leader>tk <Plug>AirlineSelectNextTab
" 设置切换tab的快捷键 <\> + <q> 退出当前的 tab
nmap <leader>tq :bp<cr>:bd #<cr>
" 修改了一些个人不喜欢的字符
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
let g:airline_symbols.linenr = "CL" " current line
let g:airline_symbols.whitespace = '|'
let g:airline_symbols.maxlinenr = 'Ml' "maxline
let g:airline_symbols.branch = 'BR'
let g:airline_symbols.readonly = "RO"
let g:airline_symbols.dirty = "DT"
let g:airline_symbols.crypt = "CR" 
