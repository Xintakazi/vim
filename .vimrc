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
"代码片段库
Plug 'honza/vim-snippets'
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
"模糊匹配
Plug 'Yggdroot/LeaderF', { 'do': './install.sh' }
"自动括号匹配
Plug 'jiangmiao/auto-pairs'



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
 set hidden	"允许在有未保存的修改时切换缓冲区，此时的修改由 vim 负责保存
 set nobackup	"覆盖文件时不备份
 set cmdheight=2	"留有更多的空间显示信息
 set updatetime=300	"更新时间

"indentLine可视化缩进
 let g:indent_guides_guide_size	=1 "指定对齐线尺寸
 let g:indent_guides_start_level	=2 "指定开始可视化缩进层数

 "文件树
 map <C-n> :NERDTreeToggle<CR>"ctrl+n开启
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
"
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-n>" : "\<S-Tab>"

 " Always show the signcolumn, otherwise it would shift the text each time
 " diagnostics appear/become resolved.
 if has("nvim-0.5.0") || has("patch-8.1.1564")
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
 nmap <silent> [g <Plug>(coc-diagnostic-prev)
 nmap <silent> ]g <Plug>(coc-diagnostic-next)
 
 " GoTo code navigation.
 nmap <silent> gd <Plug>(coc-definition)
 nmap <silent> gy <Plug>(coc-type-definition)
 nmap <silent> gi <Plug>(coc-implementation)
 nmap <silent> gr <Plug>(coc-references)
 
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
 
 " Formatting selected code.
 xmap <leader>f  <Plug>(coc-format-selected)
 nmap <leader>f  <Plug>(coc-format-selected)
 
 augroup mygroup
   autocmd!
   " Setup formatexpr specified filetype(s).
   autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
   " Update signature help on jump placeholder.
   autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
 augroup end
 
 " Applying codeAction to the selected region.
 " Example: `<leader>aap` for current paragraph
 xmap <leader>a  <Plug>(coc-codeaction-selected)
 nmap <leader>a  <Plug>(coc-codeaction-selected)
 
 " Remap keys for applying codeAction to the current buffer.
 nmap <leader>ac  <Plug>(coc-codeaction)
 " Apply AutoFix to problem on the current line.
 nmap <leader>qf  <Plug>(coc-fix-current)
 
 " Run the Code Lens action on the current line.
 nmap <leader>cl  <Plug>(coc-codelens-action)
 
 " Map function and class text objects
 " NOTE: Requires 'textDocument.documentSymbol' support from the language server.
 xmap if <Plug>(coc-funcobj-i)
 omap if <Plug>(coc-funcobj-i)
 xmap af <Plug>(coc-funcobj-a)
 omap af <Plug>(coc-funcobj-a)
 xmap ic <Plug>(coc-classobj-i)
 omap ic <Plug>(coc-classobj-i)
 xmap ac <Plug>(coc-classobj-a)
 omap ac <Plug>(coc-classobj-a)
 
 " Remap <C-f> and <C-b> for scroll float windows/popups.
 if has('nvim-0.4.0') || has('patch-8.2.0750')
   nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
   nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
   inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
   inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
   vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
   vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
 endif
 
 " Use CTRL-S for selections ranges.
 " Requires 'textDocument/selectionRange' support of language server.
 nmap <silent> <C-s> <Plug>(coc-range-select)
 xmap <silent> <C-s> <Plug>(coc-range-select)
 
 " Add `:Format` command to format current buffer.
 command! -nargs=0 Format :call CocActionAsync('format')
 
 " Add `:Fold` command to fold current buffer.
 command! -nargs=? Fold :call     CocAction('fold', <f-args>)
 
 " Add `:OR` command for organize imports of the current buffer.
 command! -nargs=0 OR   :call     CocActionAsync('runCommand', 'editor.action.organizeImport')
 
 " Add (Neo)Vim's native statusline support.
 " NOTE: Please see `:h coc-status` for integrations with external plugins that
 " provide custom statusline: lightline.vim, vim-airline.
 set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}
 
 " Mappings for CoCList
 " Show all diagnostics.
 nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
 " Manage extensions.
 nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
 " Show commands.
 nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
 " Find symbol of current document.
 nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
 " Search workspace symbols.
 nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
 " Do default action for next item.
 nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
 " Do default action for previous item.
 nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
 " Resume latest coc list.
 nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>
 
