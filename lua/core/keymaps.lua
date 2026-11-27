local map = vim.keymap.set

-- ===== 搜索 =====
map({ "n", "v" }, "/", "/\\v")
map("n", "<leader><space>", ":let @/=''<CR>")

-- ===== 剪贴板：复制 =====
map({ "n", "v" }, "<leader>y", '"+y')
map("n", "<leader>yy", '"+yy')
map("n", "<leader>yiw", '"+yiw')

-- ===== 剪贴板：剪切 =====
map({ "n", "v" }, "<leader>d", '"+d')
map("n", "<leader>dd", '"+dd')
map("n", "<leader>diw", '"+diw')
map("n", "<leader>daw", '"+daw')
map("n", "<leader>ciw", '"+ciw')

-- ===== 剪贴板：粘贴 =====
map({ "n", "v" }, "<leader>p", '"+p')

-- ===== H / L =====
map({ "n", "v" }, "H", "^")
map({ "n", "v" }, "L", "$")

-- ===== 文件切换（buffer） =====
map("n", "<leader>j", ":bp<CR>", { desc = "上一个文件" })
map("n", "<leader>k", ":bn<CR>", { desc = "下一个文件" })

-- ===== j / k 屏幕行 =====
map({ "n", "v" }, "j", "gj")
map({ "n", "v" }, "k", "gk")

-- ===== 其他普通模式映射 =====
map("n", "fw", "*")
map("n", "J", "5j", { noremap = true })           -- J 向下 5 个物理行
map("n", "K", "5k", { noremap = true })           -- K 向上 5 个物理行

-- ===== 其他=====
map("n", "<leader>rn", vim.lsp.buf.rename, { desc = "重命名" })

-- ===== easymotion =====
-- map("n", "<leader>s", "<leader><leader>s")
-- map("n", "<leader>w", "<leader><leader>w")
-- map("n", "<leader>b", "<leader><leader>b")

