local g = vim.g
local o = vim.o
local t = vim.opt
local a = vim.api

-- Source Plugins
require('plug')

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

-- Color mode
t.termguicolors = true

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
map('n', '<leader>z', ':sp term://zsh<CR>i')


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

require('fidget').setup {}
require("bufferline").setup{}

require("tokyonight").setup({
  -- your configuration comes here
  -- or leave it empty to use the default settings
  style = "night", -- The theme comes in three styles, `storm`, a darker variant `night` and `day`
  transparent = false, -- Enable this to disable setting the background color
  terminal_colors = true, -- Configure the colors used when opening a `:terminal` in Neovim
  styles = {
    -- Style to be applied to different syntax groups
    -- Value is any valid attr-list value `:help attr-list`
    comments = "italic",
    keywords = "italic",
    functions = "NONE",
    variables = "NONE",
    -- Background styles. Can be "dark", "transparent" or "normal"
    sidebars = "dark", -- style for sidebars, see below
    floats = "dark", -- style for floating windows
  },
  sidebars = { "qf", "help" }, -- Set a darker background on sidebar-like windows. For example: `["qf", "vista_kind", "terminal", "packer"]`
  day_brightness = 0.3, -- Adjusts the brightness of the colors of the **Day** style. Number between 0 and 1, from dull to vibrant colors
  hide_inactive_statusline = false, -- Enabling this option, will hide inactive statuslines and replace them with a thin border instead. Should work with the standard **StatusLine** and **LuaLine**.
  dim_inactive = false, -- dims inactive windows
  lualine_bold = false, -- When `true`, section headers in the lualine theme will be bold

  --- You can override specific color groups to use other groups or a hex color
  --- function will be called with a ColorScheme table
  ---@param colors ColorScheme
  on_colors = function(colors) end,

  --- You can override specific highlights to use other groups or a hex color
  --- function will be called with a Highlights and ColorScheme table
  ---@param highlights Highlights
  ---@param colors ColorScheme
  on_highlights = function(highlights, colors) end,
})

require("which-key").setup {}

---------------------------------
-- WhichKey keybinds setup
-- wk.register({key1 = {name, more_keys = {cmd, help}}}, predix_key)
local wk = require("which-key")
wk.register({
    t = {
        name = "telescope",
        f = {"<cmd>lua require('telescope.builtin').find_files()<cr>", "find files"},
        g = {"<cmd>lua require('telescope.builtin').live_grep()<cr>", "grep"},
        b = {"<cmd>lua require('telescope.builtin').buffers()<cr>", "buffer list"},
        h = {"<cmd>lua require('telescope.builtin').help_tags()<cr>", "help tags"},
        t = {"<cmd>lua require('telescope.builtin').treesitter()<cr>", "treesiter"}
    },
    b = {
        name = "buffer",
        c = {"<cmd>bdelete<cr>", "delete buffer"},
        p = {"<cmd>bprevious<cr>", "previous buffer"},
        n = {"<cmd>bnext<cr>", "next buffer"}
    }
}, { prefix = "<leader>" })

-- Set theme
vim.cmd[[colorscheme tokyonight]]
