local opt = vim.opt

opt.foldlevel = 99          -- unfold
opt.mouse = 'a'             -- use mouse in neovim
opt.termguicolors = true    -- true color
opt.autowrite = true        -- auto save

opt.number = true           -- 打开行号
opt.relativenumber = true   -- 相对行号

opt.tabstop = 4             -- Tab 宽度
opt.shiftwidth = 4          -- 缩进宽度
opt.expandtab = true        -- Tab 转空格

opt.grepformat = "%f:%l:%c:%m"
opt.grepprg = "rg --vimgrep"-- use ripgrep
opt.ignorecase = true       -- ignore case in search
opt.smartcase = true        -- only ignore case when search in lower case
opt.hlsearch = true         -- highlight search result

opt.wrap = false            -- wrap the long line
opt.breakindent = false     -- set true when using wrap
opt.conceallevel = 1        -- 在编辑 Markdown、JSON、LaTeX 时 隐藏 Conceal 字符，但保持光标所在字符可见
opt.cursorline = true

opt.laststatus = 3
-- opt.statuscolumn = [[%!v:lua.require'snacks.statuscolumn'.get()]]

opt.signcolumn = "yes"
opt.scrolloff = 4
opt.sidescrolloff = 8

opt.undofile = true
opt.undolevels = 10000

opt.clipboard = "unnamedplus"
opt.completeopt = { "menu", "menuone", "noselect" } -- complete options
