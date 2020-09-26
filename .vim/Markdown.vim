" 快捷键操作
autocmd Filetype markdown inoremap ,. <Esc>/<++><CR>:nohlsearch<CR>c4l
autocmd Filetype markdown inoremap ，。 <Esc>/<++><CR>:nohlsearch<CR>c4l
autocmd Filetype markdown inoremap ,k \|A\|<++><Esc>FAcl
autocmd Filetype markdown inoremap ，k \|A\|<++><Esc>FAcl
autocmd Filetype markdown inoremap ,n <Space>---<Enter><Enter>
autocmd Filetype markdown inoremap ,b <Space>**** <++><Esc>F*hi
autocmd Filetype markdown inoremap ,s <Space>~~~~ <++><Esc>F~hi
autocmd Filetype markdown inoremap ,i <Space>** <++><Esc>F*i
autocmd Filetype markdown inoremap ,d <Space>`` <++><Esc>F`i
autocmd Filetype markdown inoremap ,c <Space>```<Enter><++><Enter>```<Enter><Enter><++><Esc>4kA
autocmd Filetype markdown inoremap ,h ====<Space><++><Esc>F=hi
autocmd Filetype markdown inoremap ,p ![](<++>) <++><Esc>F[a
autocmd Filetype markdown inoremap ,a [](<++>) <++><Esc>F[a
autocmd Filetype markdown inoremap ,1 #<Space><Enter><++><Esc>kA
autocmd Filetype markdown inoremap ,2 ##<Space><Enter><++><Esc>kA
autocmd Filetype markdown inoremap ,3 ###<Space><Enter><++><Esc>kA
autocmd Filetype markdown inoremap ,4 ####<Space><Enter><++><Esc>kA
autocmd Filetype markdown inoremap ,l --------<Enter>
autocmd Filetype markdown inoremap ,m ()<++><Esc>F)i
" java
autocmd FileType java inoremap ,. <Esc>f"a
autocmd FileType java inoremap ，。 <Esc>f"a
autocmd FileType java inoremap ,/ <Esc>f)a
autocmd FileType java inoremap ，/ <Esc>f)a
autocmd FileType java inoremap ,s System.out.println();<Esc>F(a
autocmd FileType java noremap <LEADER>p <Esc>/<++><CR>:noh<CR>df>h"+pl
autocmd FileType java inoremap <C-x>class <Esc>2b"+yiwdd:r ~/.vim/Mode/java/Main_class_struct<CR>kdd<Esc>/<++><CR>:noh<CR>df>h"+pl
autocmd FileType java inoremap <C-x>c <Esc>b"+yiwdiw:r ~/.vim/Mode/java/Main_class_struct<CR>kdd/<++><CR>:noh<CR>df>h"+plndf>h"+pl

"可以在~/.vim/Mode/java 下编写模板文件
autocmd FileType java inoremap ,0 <ESC>:r ~/.vim/Mode/java/pro_info<CR>kdd
autocmd FileType java inoremap ,1 <ESC>:r ~/.vim/Mode/java/Main_class_struct<CR>kdd
autocmd FileType java inoremap <C-x>main <ESC>:r ~/.vim/Mode/java/Main_class_struct<CR>kdd



" <C-r>加寄存器可以在命令行粘贴
