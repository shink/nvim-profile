require('nvim-tree').setup {
  -- 暂时留空
}
vim.keymap.set('n', '<leader>e', vim.cmd.NvimTreeToggle, { desc = '开关文件树' })

