" Open a python terminal
command! -nargs=* Run :vsplit | terminal python '%' <args>

" Create lists without hassle
command! -nargs=* List :normal a [<f-args>]<Esc>

" Tuple Creation
command! -nargs=* Tuple :normal a (<f-args>)<Esc>:ALEFix autopep8<CR><Esc>

" Linters
let b:ale_linters = ["mypy", "pyright", "pylint", "pylsp"]
