require('nvim-tree').setup {
  on_attach = function(bufnr)
    local api = require('nvim-tree.api')

    -- 保留 nvim-tree 默认映射
    api.map.on_attach.default(bufnr)

    -- 覆盖默认的 J/K，改成移动 5 行
    vim.keymap.set('n', 'J', '5j', { buffer = bufnr, noremap = true, silent = true })
    vim.keymap.set('n', 'K', '5k', { buffer = bufnr, noremap = true, silent = true })
  end,
}

vim.keymap.set('n', '<leader>e', vim.cmd.NvimTreeToggle, { desc = '开关文件树' })

