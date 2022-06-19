" pswsm's neovim config

" Ale autocompletion
let g:ale_completion_enabled = 1

" Source plugins
so ~/.config/nvim/plug.vim

" Encoding UTF-8
set encoding=utf-8

" Hightlight current line
set cursorline

" Show line number
set number
set relativenumber

" Use visual bell instead of beep
set visualbell

" Changes directory to where file is located
"set autochdir

" Sets window title to file
set title

" Number of spaces tab makes
set smarttab
set tabstop=4
set expandtab
set shiftwidth=4 


let g:netrw_keepdir = 0
let g:netrw_winsize = 20
" let g:netrw_liststyle = 3
" let g:netrw_banner = 0
" let g:netrw_browse_split = 3

let g:markdown_fenced_languages = ['bash=sh', 'javascript', 'json=javascript', 'typescript', 'php', 'html', 'css', 'python', 'sql', 'rust', 'cpp']

let g:python3_host_prog = "/usr/bin/python"

" Terminal remaps
tnoremap <Esc> <C-\><C-n>

" Normal mode (re)maps
nnoremap <A-e> :Lexplore<CR>
nmap <A-t> :sp term://zsh<CR>i
nmap <A-s> :w<CR>
" nmap <A-d> :bdelete<CR>:Dashboard<CR>
nmap <F2> :SymbolsOutline<CR>
nmap <A-]> :tabNext<CR>
nmap <A-[> :tabprevious<CR>

" Moving throught tabs with Ctrl+[h,j,k,l]
function! WinMove(key)
    let t:curwin = winnr()
    exec "wincmd ".a:key
    if (t:curwin == winnr())
        if (match(a:key,'[jk]'))
            wincmd v
        else
            wincmd s
        endif
        exec "wincmd ".a:key
    endif
endfunction

nnoremap <silent> <C-h> :call WinMove('h')<CR>
nnoremap <silent> <C-j> :call WinMove('j')<CR>
nnoremap <silent> <C-k> :call WinMove('k')<CR>
nnoremap <silent> <C-l> :call WinMove('l')<CR>


" Running inside vscode?
if exists('g:vscode')
    " VSCode extension
else
    " ordinary neovim
endif

lua << EOF
require'nvim-treesitter.configs'.setup {
  -- One of "all", "maintained" (parsers with maintainers), or a list of languages
  ensure_installed = {
    "bash",
    "c",
    "cpp",
    "css",
    "html",
    "javascript",
    "typescript",
    "python",
    "rust",
  },

  -- Install languages synchronously (only applied to `ensure_installed`)
  sync_install = false,

  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
}

require('hardline').setup{}
require('fidget').setup{}

