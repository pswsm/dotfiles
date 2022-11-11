" Run rust file
command! -nargs=* Run :vsplit | terminal cargo run -- <args>

let b:ale_linters = ["cargo", "rls", "analyzer"]
