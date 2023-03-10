" Note: Skip initialization for vim-tiny or vim-small.
if 0 | endif

if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=~/.vim/bundle/neobundle.vim/

" Required:
call neobundle#begin(expand('~/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

" My Bundles here:
" Refer to |:NeoBundle-examples|.
" Note: You don't set neobundle setting in .gvimrc!

call neobundle#end()


" Required:
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck

"_____coc___
" if hidden is not set, TextEdit might fail.
set hidden
" Some servers have issues with backup files, see #649
set nobackup
set nowritebackup
 
" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300
 
" don't give |ins-completion-menu| messages.
set shortmess+=c
 
" always show signcolumns
set signcolumn=yes
 
" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
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
inoremap <silent><expr> <c-space> coc#refresh()
 
" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" Or use `complete_info` if your vim support it, like:
" inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
 
" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)
" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
 
" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>
 
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction
 
" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')
 
" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)
 
" Remap for format selected region
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)
 
augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end
 
" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)
 
" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)
 
" Create mappings for function text object, requires document symbols feature of languageserver.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)
 
" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')
 
" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)
 
" use `:OR` for organize import of current buffer
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

"________needtree________

" autocmd vimenter * NERDTree  "????????????Nerdtree
let g:NERDTreeWinSize = 25 "?????? NERDTree ????????????
let NERDTreeShowBookmarks=1  " ??????Nerdtree???????????????Bookmarks
"??????vim?????????????????????????????????NERDTree
" autocmd vimenter * if !argc()|NERDTree|endif
"???NERDTree???????????????????????????????????????
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" ????????????????????????
let g:NERDTreeDirArrowExpandable = '+'
let g:NERDTreeDirArrowCollapsible = '-'
let NERDTreeIgnore = ['\.pyc$']  " ????????????.pyc???????????????
let g:NERDTreeShowLineNumbers=0 " ??????????????????
let g:NERDTreeHidden=0     "?????????????????????
""Making it prettier
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
nnoremap <C-n> :NERDTreeToggle<CR> " ??????/??????nerdtree?????????
" ___________????????????___________
call neobundle#begin(expand('~/.vim/bundle/'))
NeoBundle 'neoclide/coc.nvim'
NeoBundle 'preservim/nerdtree'
NeoBundle 'Xuyuanp/nerdtree-git-plugin'
NeoBundle 'morhetz/gruvbox'
NeoBundle 'navarasu/onedark.nvim'
call neobundle#end()


" ___________neovide??????_________________________________________________
" ??????GUI??????????????????
let g:neovide_transparency = 0.9
"let g:neovide_fullscreen = v:true "????????????
let g:neovide_profiler = v:true "????????????
set guifont=SF\ Mono:h18
let g:neovide_input_use_logo = v:false  " v:true on macOS
"let g:neovide_remember_window_size = v:true "???????????????????????????
"_________<F5>??????py_________
map <F5> :call CompileRunGcc()<CR>
func! CompileRunGcc()
    exec "w"
    if &filetype == 'sh'
        !time bash %
    elseif &filetype == 'python'
        exec ":!/Users/mrx/opt/anaconda3/envs/schoolWork/bin/python %" 
        "????????????schoolwork??????
    elseif &filetype == 'go'
        exec "!time go run %"
    endif
endfunc

"___________????????????__________
colorscheme onedark
