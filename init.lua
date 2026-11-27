-- 1. 设置 leader
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- 2. 加载核心配置
require("core.options")
require("core.keymaps")

-- 3. 主题配置
require("core.theme")

-- 4. LSP 配置
require("core.lsp")
require("core.cmp")

-- 5. 插件配置
require("core.treesitter")
require("core.telescope")
require("core.tree")
require("core.flash")
require("core.bookmarks")

