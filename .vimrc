"  __  __        __     _____ __  __ ____   ____
"  " |  \/  |_   _  \ \   / /_ _|  \/  |  _ \ / ___|
"  " | |\/| | | | |  \ \ / / | || |\/| | |_) | |
"  " | |  | | |_| |   \ V /  | || |  | |  _ <| |___
"  " |_|  |_|\__, |    \_/  |___|_|  |_|_| \_\\____|
"  "         |___/

"
"自启动检测`vimplug`插件是否安装
"  
if empty(glob('~/.vim/autoload/plug.vim'))

silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

autocmd VimEnter * PlugInstall --sync | source $MYVIMRC


endif




"
"插件安装
"

call plug#begin()
"自动补全
Plug 'neoclide/coc.nvim', {'branch': 'release'}
"可视化缩进
Plug 'Yggdroot/indentLine'
"状态栏
Plug 'vim-airline/vim-airline'
"高亮括号
Plug 'luochen1990/rainbow'
"文件树
Plug 'preservim/nerdtree'
"c++高亮
Plug 'octol/vim-cpp-enhanced-highlight'



call plug#end()

"
"配置文件
"

"vim配置文件
 syntax on	"语法高亮
 set number	"显示行号
 set hlsearch	"高亮显示查询出来的结果
 set nocompatible	"不适用vi兼容模式
" set ts=4	"设置tab为4个空格宽
" set expandtab	"设置空格替代tab
 set t_Co=256	"使用256色

"indentLine可视化缩进
 let g:indent_guides_guide_size	=1 "指定对齐线尺寸
 let g:indent_guides_start_level	=2 "指定开始可视化缩进层数

 "文件树
 let g:NERDTreeWinSize = 25 "设定 NERDTree 视窗大小
 let NERDTreeShowBookmarks=1  " 开启Nerdtree时自动显示Bookmarks
 " 设置树的显示图标
 let g:NERDTreeDirArrowExpandable = '+'
 let g:NERDTreeDirArrowCollapsible = '-'
 " let NERDTreeIgnore = ['\.pyc$']  " 过滤所有.pyc文件不显示
 let g:NERDTreeShowLineNumbers=0 " 是否显示行号
 " let g:NERDTreeHidden=0     "不显示隐藏文件
 " "Making it prettier
 " let NERDTreeMinimalUI = 1
 " let NERDTreeDirArrows = 1
 " nnoremap <F3> :NERDTreeToggle<CR> " 开启/关闭nerdtree快捷键

"自动补全

