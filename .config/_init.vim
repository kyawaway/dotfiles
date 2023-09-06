" basic

set number

set title

set tabstop=2

set expandtab

set shiftwidth=4

set smartindent

set virtualedit=block

set hlsearch
nmap <C-p> Myterm

set incsearch

set clipboard+=unnamed

set wildmenu

set whichwrap=b,s,h,l,<,>,[,]

inoremap <silent> jj <ESC>

let g:syntastic_tex_lacheck_quiet_messages = { 'regex': '\Vpossible unwanted space at' }

"" key

""" leader

let mapleader = "\<Space>"

"" map

nmap ; :

nnoremap <expr> <C-]> execute('LspPeekDefinition') =~ "not supported" ? "\<C-]>" : ":LspDefinition<cr>"

"" color

""colorscheme molokai
""colorscheme iceberg
""syntax enable

augroup MyAutoCmd
  autocmd!
augroup END

au MyAutoCmd VimEnter * nested colorscheme solarized 
au MyAutoCmd VimEnter *.tex nested colorscheme iceberg 

"" term
function! Myterm()
    split
    wincmd j
    resize 7
    terminal
    wincmd k
endfunction

command! Myterm call Myterm()

nnoremap <silent><C-t> :Myterm<CR>

" plugin

"" dein

let s:dein_dir = expand('~/.cache/dein')

let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

""" dein.vim がない場合，git clone 
if &runtimepath !~# '/dein.vim'
  if !isdirectory(s:dein_repo_dir)
    execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
  endif
  execute 'set runtimepath^=' . fnamemodify(s:dein_repo_dir, ':p')
endif

if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)

  let s:toml_dir = expand('~/.config/nvim/plugin')

  call dein#load_toml(s:toml_dir . '/dein.toml', {'lazy': 0})

  call dein#load_toml(s:toml_dir . '/dein_lazy.toml', {'lazy': 1})

  call dein#end()
  call dein#save_state()
endif

filetype plugin indent on
syntax enable


if dein#check_install()
  call dein#install()
endif



"" NERDTree

nnoremap <silent><C-e> :NERDTreeToggle<CR>

"" lsp

""autocmd BufWritePre <buffer> LspDocumentFormatSync
nmap <silent> <space>h :<C-u>call CocAction('doHover')<cr>
nmap <silent> <space>df <Plug>(coc-definition)
nmap <silent> <space>fmt <Plug>(coc-format)
function! s:on_lsp_buffer_enabled() abort
    setlocal omnifunc=lsp#complete
    setlocal signcolumn=yes
    if exists('+tagfunc') | setlocal tagfunc=lsp#tagfunc | endif
    nmap <buffer> <Space>h <plug>(lsp-hover)
endfunction

augroup lsp_install
    au!
    autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END
"" tex

let g:tex_flavor = "latex"
let g:vimtex_compiler_latexmk_engines = { '_' : '-pdfdvi' }
" haskell

"" HIE vim-lisp

augroup MyLsp
  autocmd FileType haskell setlocal omnifunc=lsp#complete
"
"  if executable('hie')
"      au User lsp_setup call lsp#register_server({
"        \ 'name': 'hie',
"        \ 'cmd': {server_info->['hie']},
"        \ 'whitelist': ['haskell'],
"        \ })
"  endif
"
  au FileType haskell nmap <leader>R <plug>(lsp-rename)
  au FileType haskell nmap <leader>D <plug>(lsp-definition)
  au FileType haskell nmap <leader>r <plug>(lsp-references)
  au FileType haskell nmap <leader>d <plug>(lsp-document-symbol)
  au FileType haskell nmap <leader>w <plug>(lsp-workspace-symbol)
augroup end
"
"let g:ale_linters = { 'haskell': ['hie'], }

let g:LanguageClient_serverCommands = { 'haskell': ['haskell-language-server-wrapper', '--lsp'] }

let g:LanguageClient_rootMarkers = ['*.cabal', 'stack.yaml']

"" ocaml

""let g:opamshare = substitute(system('opam var share'),'\n$','','''')
""execute "set rtp+=" . g:opamshare . "/merlin/vim"


" ## end of OPAM user-setup addition for vim / ocp-indent ## keep this line


"" markdown
let g:vim_markdown_folding_disabled = 1

autocmd BufRead,BufNewFile *.md set filetype=markdown


let g:netrw_nogx = 1 " disable netrw's gx mapping.
nmap gx <Plug>(openbrowser-smart-search)
vmap gx <Plug>(openbrowser-smart-search)

"" grep
" <Space>cd で編集中ファイルのカレントディレクトリに移動
command! -nargs=? -complete=dir -bang CD  call s:ChangeCurrentDir('<args>', '<bang>') 
function! s:ChangeCurrentDir(directory, bang)
    if a:directory == ''
        lcd %:p:h
    else
        execute 'lcd' . a:directory
    endif
 
    if a:bang == ''
        pwd
    endif
endfunction
nnoremap <silent> <Space>cd :<C-u>CD<CR>
 
" <Space>cr で git ルート（プロジェクトルート）のディレクトリに移動
command! -nargs=? -complete=dir -bang CDROOT  call s:ChangeRootDir() 
function! s:ChangeRootDir()
    let rootDir = system("git rev-parse --show-toplevel")
    execute 'lcd' . rootDir
endfunction
nnoremap <silent> <Space>cr :<C-u>CDROOT<CR>
 
" <Space>cg でカーソル下文字列で、編集中ファイルのカレントディレクトリを vimgrep
noremap <Space>cg :<C-u>CD<CR>:vimgrep /<C-r><C-w>/ **/* \| cw<CR>


"" 1. ショートカットキー入力
"" ex) >>
"" 2. ステータスバーから入力を受ける
"" >>　とコマンドラインのバーに表示され，入力を受け付け 
"" 3. 入力を取得，VimGrepCwに投げる

function! s:vimGrepCw() abort
    let l:str = input(">>")
    cexpr system(printf('ag "%s"', l:str)) | cw
endfunction


nmap >> :call <SID>vimGrepCw()<CR> 


"" Java

autocmd bufWritePost *.java :call AutoJavaFormat()


function! AutoJavaFormat()
    let targetName = expand('%t')
    execute('%!google-java-format '. targetName)
endfunction

"" SATySFi

autocmd bufWritePost *.saty :call AutoSATySFi()<CR>


function! AutoSATySFi()
    let targetName = expand('%t')
    let result = system('satysfi ' . targetName)
    if empty(matchlist(result, '\!', 1))
        call Echomsg("succ")
    else
        let error_message = split(result,'!')[1]
        echo error_message
        split test.txt 
        call Echomsg("err")
    endif
endfunction


function! Echomsg(type)
    if a:type == "succ"
        echohl StatusLine | echo "autoSATy:" | echohl ModeMsg | echon " Compilation complete"  | echohl None 
    endif
    if a:type == "err"
        echohl StatusLine | echon "autoSATy:" | echohl ErrorMsg | echon " Compilation failed!" | echohl None 
    endif
endfunction


function! PreviewSATySFi()
    let previewName = expand("%:r")
    call system('open ' . previewName . '.pdf')
endfunction

command! PreviewSATySFi call PreviewSATySFi()

function! TestErrFmt(errfmt,lines)
  let temp_errorfomat = &errorformat
  try
    let &errorformat = a:errfmt
    cexpr join(a:lines,"\n")
    copen
  catch
    echo v:exception
    echo v:throwpoint
  finally
    let &errorformat = temp_errorfomat
  endtry
endfunction

"" 1.   echoあれこれ
"" 1.1. echohlで好きなカラーグループを指定してecho，終わるときはNoneを指定

"" 2.   quickfixあれこれ
"" 2.1. フォーマットを都合よく定める(正規表現とかで)
"" 2.2. caddfileする
"" 2.3. cexprで呼ぶ

"" 3.   コンパイラ呼びだし
"" 3.1. 

"" 4.   統合
"" 4.1. complier -> echo -> quickfix
"" 4.2. 非同期処理はどうしよう

