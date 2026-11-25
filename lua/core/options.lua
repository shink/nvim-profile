local opt = vim.opt

-- ===== 安全 =====
opt.modelines = 0

-- ===== 显示 =====
opt.number = true
opt.cursorline = true
opt.ruler = true
opt.showmode = true
opt.showcmd = true
opt.laststatus = 2
opt.cmdheight = 2
-- opt.relativenumber = true

-- ===== 空白与缩进 =====
opt.textwidth = 120
opt.formatoptions = "tcqrn1"
opt.tabstop = 2
opt.shiftwidth = 2
opt.softtabstop = 2
opt.expandtab = true
opt.shiftround = false

-- ===== 光标移动 =====
opt.scrolloff = 3
opt.backspace = "indent,eol,start"
opt.matchpairs:append("<:>")
opt.hidden = true

-- ===== 搜索 =====
opt.hlsearch = true
opt.incsearch = true
opt.ignorecase = true
opt.smartcase = true
opt.showmatch = true

-- ===== 视觉 =====
opt.visualbell = true
opt.listchars = { tab = "▸ ", eol = "¬" }
-- opt.list = true

-- ===== 配色（终端）=====
opt.background = "dark"
-- 如果以后装 solarized：
-- vim.g.solarized_termcolors = 256
-- vim.g.solarized_termtrans = 1
-- vim.cmd("colorscheme solarized")

-- ===== 剪贴板：保持隔离，靠 <leader> 显式操作 =====
opt.clipboard = ""

-- vim-highlightedyank：复制后高亮持续 200ms（默认 1000）
vim.g.highlightedyank_highlight_duration = 200

