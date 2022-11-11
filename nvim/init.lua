local g = vim.g
local o = vim.o
local t = vim.opt
local a = vim.api

-- Encoding
t.encoding = 'utf-8'

-- Spaces and tabs
t.smarttab = true
t.tabstop = 4
t.expandtab = false
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
g.markdown_fenced_languages = {'bash=sh', 'javascript', 'json=javascript', 'typescript', 'html', 'rust', 'css', 'cpp', 'python', 'php'}

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

------------------------------------
-- Source Plugins
require('plug')

------------------------------------
-- nvim-cmp config
local has_words_before = function()
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

require("luasnip.loaders.from_vscode").lazy_load()

local luasnip = require'luasnip'
local cmp = require'cmp'
cmp.setup({
    snippet = { expand = function(args) require'luasnip'.lsp_expand(args.body) end },
    window = {
      -- completion = cmp.config.window.bordered(),
      -- documentation = cmp.config.window.bordered(),
    },
    mapping = {
        ['<C-p>'] = cmp.mapping.select_prev_item(),
        ['<C-n>'] = cmp.mapping.select_next_item(),
        ['<C-d>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.close(),
        ['<CR>'] = cmp.mapping.confirm({
            behavior = cmp.ConfirmBehavior.Insert,
            select = true
        }),
        ["<Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_next_item()
          elseif luasnip.expand_or_jumpable() then
            luasnip.expand_or_jump()
          elseif has_words_before() then
            cmp.complete()
          else
            fallback()
          end
        end, { "i", "s" }
        ),
        ["<S-Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_prev_item()
          elseif luasnip.jumpable(-1) then
            luasnip.jump(-1)
          else
            fallback()
          end
        end, { "i", "s" }
        ),
    },
    sources = cmp.config.sources({
        { name = 'luasnip' },
        { name = 'nvim_lsp' },
        { name = 'buffer' },
        { name = 'path' },
})
})

-----------------------------------
-- mason.nvim stuff
require("mason").setup()
require("mason-lspconfig").setup()

local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())
require'lspconfig'.pyright.setup { capabilities = capabilities }
require'lspconfig'.rust_analyzer.setup { capabilities = capabilities }
require'lspconfig'.eslint.setup { capabilities = capabilities }
require'lspconfig'.intelephense.setup { capabilities = capabilities }

-----------------------------------
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

