-- GitHub 主题（projekt0n/github-nvim-theme）
require('github-theme').setup({
  options = {
    hide_end_of_buffer = true,   -- 隐藏每行末尾的 '~' 符号
    hide_nc_statusline = true,   -- 非活动窗口状态栏去掉下划线
    -- transparent = true,       -- 需要透明背景时取消注释
    -- dim_inactive = true,      -- 非活动窗口用更暗背景
    styles = {
      comments = 'italic',       -- 注释斜体（可选：italic / bold / NONE）
      functions = 'NONE',        -- 函数
      keywords = 'NONE',         -- 关键字
      variables = 'NONE',        -- 变量
      types = 'NONE',            -- 类型
      strings = 'NONE',          -- 字符串
    },
    darken = {
      floats = true,
      sidebars = {
        enable = true,
        list = { 'NvimTree' },   -- nvim-tree 侧栏用暗色背景
      },
    },
  },
})

-- 应用主题
vim.cmd('colorscheme github_dark_default')

