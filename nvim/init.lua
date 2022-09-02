local g = vim.g
local o = vim.o
local t = vim.opt
local a = vim.api

-- Source Plugins
require 'p_plug'

-- Ale Completion
g.ale_completion_enabled = true

-- Encoding
t.encoding = 'utf-8'

-- Spaces and tabs
t.smarttab = true
t.tabstop = 4
t.expandtab = true
t.shiftwidth = 4

-- Highlight current line
t.cursorline = true

-- Line numbers
t.number = true
t.relativenumber = true

-- Visual bell
t.visualbell = true

-- NetRW Config
g.netrw_keepdir = 0
g.netrw_winsize = 20

-- MD Languages
g.markdown_fenced_languages = {'bash=sh', 'javascript', 'json=javascript', 'typescript', 'html', 'rust', 'css', 'cpp', 'python'}

-- Python Interpreter
g.python3_host_prog = '/usr/bin/python'

local function map(m, k, v)
    vim.keymap.set(m, k, v, {silent = true})
end

-- Leader Key
g.mapleader = ' '

-- Key [Re]maps
map('t', '<Esc>', '<C-\\><C-n>')
map('n', '<A-e>', ':Lexplore<CR>')
map('n', '<A-t>', ':sp term://zsh<CR>i')
map('n', '<A-[>', ':tabprevious<CR>')
map('n', '<A-]>', ':tabnext<CR>')

-- Telescope Keybinds
map('n', '<leader>ff', '<cmd>lua require("telescope.builtin").find_files()<cr>')
map('n', '<leader>fg', '<cmd>lua require("telescope.builtin").live_grep()<cr>')
map('n', '<leader>fb', '<cmd>lua require("telescope.builtin").buffers()<cr>')
map('n', '<leader>fh', '<cmd>lua require("telescope.builtin").help_tags()<cr>')
map('n', '<leader>ft', '<cmd>lua require("telescope.builtin").treesitter()<cr>')

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

require('hardline').setup {}
require('fidget').setup {}

