require('nvim-treesitter').setup {
  install_dir = vim.fn.stdpath('data') .. '/site',
}

-- 只在缺 parser 时安装（幂等；已装全则完全不触发 install）
local want = { 'c', 'cpp', 'lua', 'vim', 'vimdoc', 'python', 'query' }
local installed = require('nvim-treesitter').get_installed('parsers')
local missing = vim.tbl_filter(function(lang)
  return not vim.list_contains(installed, lang)
end, want)

if #missing > 0 then
  require('nvim-treesitter').install(missing)
end

-- 启用 treesitter 高亮（nvim-treesitter main 分支不再管理高亮，
-- 必须在 FileType 时手动 vim.treesitter.start；pcall 防无 parser 的文件报错）
vim.api.nvim_create_autocmd('FileType', {
  callback = function(ev)
    pcall(vim.treesitter.start, ev.buf)
  end,
})

-- 基于语法树的代码折叠（Neovim 内置；无 parser 的文件 foldexpr 返回 -1，不折叠）
vim.opt.foldmethod = 'expr'
vim.opt.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
vim.opt.foldlevelstart = 99

