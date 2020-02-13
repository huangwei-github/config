"""""""""""""""""""""""""""""""""""""""""
"@title huangwei's vimrc
"@email mrhuangwe@foxmail.com
"""""""""""""""""""""""""""""""""""""""""

"""""""""基本配置""""""""""""""""""""""""
set nocompatible      "非一致性模式
set number            "显示行号
set smartindent 	  "自动对齐
set showmatch         "匹配模式
set ruler             "显示所在位置
set autowrite         "自动保存
set ignorecase 		  "搜索忽略大小写
set nobackup		  "禁止生成备份文件
set noswapfile		  "禁止生成临时交换文件
set hidden

set encoding=utf-8	  "编码设置
set history=1000      "设置历史行数
set tabstop=4         "设置tab大小
set shiftwidth=4      "设置shift宽度
set mouse=a			  "可以使用鼠标
set laststatus=2      "设置状态栏启用

filetype on           "检测文件类型
syntax on             "语法高亮

language messages zh_CN.utf-8  "设置中文提示

""""""""vim-plug"""""""""""""""""""""""""""

"无vim-plug自动安装
if empty(glob('~/.vim/autoload/plug.vim'))
	  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
	  \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'preservim/nerdtree'

call plug#end()


"""""""global variable"""""""""""""""""""

"vim-airline相关参数
let g:airline_theme="molokai" 
"let g:airline_section_b = '%{strftime("%c")}'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline#extensions#whitespace#enabled = 0
let g:airline#extensions#whitespace#symbol = '!'
if !exists('g:airline_symbols')
	let g:airline_symbols = {}
endif

"coc.nvim配置
let g:coc_global_extensions = ['coc-tsserver','coc-html','coc-css', 'coc-json',
            \ 'coc-java','coc-python',
            \ 'coc-emmet','coc-snippets','coc-xml','coc-yaml',
            \ 'coc-highlight']

"改变光标形态
let &t_SI.="\e[5 q" "SI = INSERT mode
let &t_SR.="\e[4 q" "SR = REPLACE mode
let &t_EI.="\e[1 q" "EI = NORMAL mode (ELSE)

""""""""function"""""""""""""""""""""""""""


""""""""key mapping""""""""""""""""""""""""
"NerdTree
nnoremap <F3> :NERDTreeToggle<CR>

"使用tab进行选择
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
	  let col = col('.') - 1
	  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

nmap <silent> <TAB> <Plug>(coc-range-select)
xmap <silent> <TAB> <Plug>(coc-range-select)

"切换标签页
nnoremap <C-N> :tabnew<CR>
nnoremap <C-P> :tabNext<CR>
