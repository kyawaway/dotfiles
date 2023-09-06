" basic

set number

set title

set tabstop=4

set expandtab

set shiftwidth=4

set smartindent

set virtualedit=block

set wildmenu

set clipboard+=unnamed

inoremap <silent> jj <ESC>

if has('vim_starting')
        " 挿入モード時に非点滅の縦棒タイプのカーソル
    let &t_SI .= "\e[6 q"
                " ノーマルモード時に非点滅のブロックタイプのカーソル
    let &t_EI .= "\e[2 q"
                        " 置換モード時に非点滅の下線タイプのカーソル
    let &t_SR .= "\e[4 q"
endif

"" alias
nmap ; :

"" color theme molokai
""syntax enable
""colorscheme molokai
augroup MyAutoCmd
    autocmd!
augroup END

""au MyAutoCmd VimEnter * nested colorscheme nord 
au MyAutoCmd VimEnter * nested colorscheme molokai 

"" vundle

set nocompatible


" plugin
let s:dein_dir = expand('$HOME/.cache/dein')
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

if &runtimepath !~# '/dein.vim'
    if !isdirectory(s:dein_repo_dir)
        execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
    endif
    execute 'set runtimepath^=' . fnamemodify(s:dein_repo_dir, ':p')
endif

if dein#load_state(s:dein_dir)
    call dein#begin(s:dein_dir)
    " プラグインリスト(toml)
    let g:rc_dir    = expand('$HOME/.vim')
    let s:toml      = g:rc_dir . '/dein.toml'
    let s:lazy_toml = g:rc_dir . '/dein_lazy.toml'
    " tomlのロード
    call dein#load_toml(s:toml,      {'lazy':0})
    call dein#load_toml(s:lazy_toml, {'lazy':1})
    " 設定終了
    call dein#end()
    call dein#save_state()
endif

" Required:
filetype plugin indent on
syntax enable
" 未インストールがあればインストール
if dein#check_install()
    call dein#install()
endif


let g:lsp_settings = {
            \  'clangd': {'allowlist': ['c', 'cpp', 'objc', 'objcpp', 'cuda']}
            \ }
