-- flash.nvim（easymotion/sneak 的现代替代）
require('flash').setup({
  -- 可选：让普通 / 搜索也出现跳转标签（默认关闭，需要时取消注释）
  -- modes = { search = { enabled = true } },
})

-- s：任意字符 + 标签跳转（替代原 easymotion 的 <leader><leader>s）
-- S：treesitter 节点跳转
vim.keymap.set({ 'n', 'x', 'o' }, 's', function() require('flash').jump() end, { desc = 'Flash 跳转' })
vim.keymap.set({ 'n', 'x', 'o' }, 'S', function() require('flash').treesitter() end, { desc = 'Treesitter 跳转' })

-- 操作符模式下 r/R：如 yr（yank 到远处目标）、dr、vr 等
vim.keymap.set('o', 'r', function() require('flash').remote() end, { desc = 'Flash 远程操作' })
vim.keymap.set({ 'o', 'x' }, 'R', function() require('flash').treesitter_search() end, { desc = 'Treesitter 搜索' })

-- 搜索时 <c-s>：开/关 flash 标签
vim.keymap.set('c', '<c-s>', function() require('flash').toggle() end, { desc = '开/关 Flash 搜索' })

