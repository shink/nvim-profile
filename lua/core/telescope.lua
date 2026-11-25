require('telescope').setup()
require('telescope').load_extension('fzf')

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files,   { desc = '查找文件' })
vim.keymap.set('n', '<leader>fg', builtin.live_grep,    { desc = '全文搜索' })
vim.keymap.set('n', '<leader>fb', builtin.buffers,      { desc = '缓冲区列表' })
vim.keymap.set('n', '<leader>fh', builtin.help_tags,    { desc = '帮助' })
vim.keymap.set('n', '<leader>fr', builtin.oldfiles,     { desc = '最近打开的文件' })
vim.keymap.set('n', '<leader>fs', builtin.grep_string,  { desc = '搜索光标下的词' })
vim.keymap.set('n', '<leader>fc', builtin.git_files,    { desc = 'git 文件（需 git 仓库）' })
vim.keymap.set('n', '<leader>ft', builtin.treesitter,   { desc = '按符号浏览代码结构' })

