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





call plug#end()
