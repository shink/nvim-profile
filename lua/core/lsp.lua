-- 配置 clangd
vim.lsp.config('clangd', {
  cmd = {
    "clangd",                          -- clangd 可执行文件
    "--background-index",              -- 后台建立项目索引，提升跳转与补全速度
    "--clang-tidy",                    -- 启用 clang-tidy 静态检查，给出代码质量诊断
    "--header-insertion=iwyu",         -- 自动插入头文件时采用 IWYU（include-what-you-use）风格
    "--completion-style=detailed",     -- 补全时显示更详细的函数签名与类型信息
    "--function-arg-placeholders",     -- 函数补全时自动填入参数占位符，便于快速修改
    "--fallback-style=llvm",           -- 项目无 .clang-format 时，格式化回退到 LLVM 风格
  },
  -- root_markers 无需指定，nvim-lspconfig 默认已包含
  -- compile_commands.json、.git 等，会自动识别项目根目录
})

-- 配置 pyright
vim.lsp.config('pyright', {
  settings = {
    python = {
      analysis = {
        typeCheckingMode = "basic",       -- 类型检查模式：off / basic / strict（basic 为推荐起点）
        autoSearchPaths = true,           -- 自动搜索工作区中的路径，辅助模块解析
        useLibraryCodeForTypes = true,    -- 对无类型存根的第三方库，从源码推断类型，减少误报
      },
    },
  },
})

-- 注入补全所需 capabilities（nvim-cmp 使用）
vim.lsp.config('*', {
  capabilities = require('cmp_nvim_lsp').default_capabilities(),
})

-- 启用 LSP
vim.lsp.enable({ 'clangd', 'pyright' })

-- 内联提示：类型注解、参数名等灰色小字（Neovim 内置，无需插件）
-- vim.lsp.inlay_hint.enable(true)

-- 快捷键开关：<leader>th（即 空格 + t + h）
-- vim.keymap.set('n', '<leader>th', function()
--   vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
-- end, { desc = 'Toggle inlay hints' })

