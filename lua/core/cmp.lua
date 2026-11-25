-- 补全引擎：nvim-cmp，基于内置 LSP
local cmp = require("cmp")
local luasnip = require("luasnip")

-- 弹出菜单必需选项：menu=显示菜单，menuone=只有一个候选也显示，noselect=不自动选中第一项
vim.opt.completeopt = { "menu", "menuone", "noselect" }

cmp.setup({
  -- 代码片段引擎：函数补全后能按 Tab 在参数之间跳转
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },

  -- 按键映射（基于 cmp 内置预设，只覆盖需要的几个键）
  mapping = cmp.mapping.preset.insert({
    ["<C-b>"] = cmp.mapping.scroll_docs(-4),            -- 候选文档往上翻
    ["<C-f>"] = cmp.mapping.scroll_docs(4),             -- 候选文档往下翻
    ["<C-Space>"] = cmp.mapping.complete(),             -- 手动触发补全
    ["<C-e>"] = cmp.mapping.abort(),                    -- 关闭候选菜单
    ["<CR>"] = cmp.mapping.confirm({ select = true }),  -- 回车确认当前高亮项
    -- 覆盖预设里的 <Tab>/<S-Tab>：候选可见时上下选，否则展开/跳转片段占位符
    ["<Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        return cmp.select_next_item()
      end
      if luasnip.expand_or_jumpable() then
        return luasnip.expand_or_jump()
      end
      return fallback()
    end, { "i", "s" }),
    ["<S-Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        return cmp.select_prev_item()
      end
      if luasnip.jumpable(-1) then
        return luasnip.jump(-1)
      end
      return fallback()
    end, { "i", "s" }),
  }),

  -- 补全来源（顺序=优先级，LSP 排最前）
  sources = cmp.config.sources({
    { name = "nvim_lsp" },  -- LSP：变量 / 函数 / 类型等，最重要
    { name = "luasnip" },   -- 代码片段
    { name = "buffer" },    -- 当前文件里出现过的单词
    { name = "path" },      -- 文件路径
  }),
})

-- 命令行补全：":" 补命令/路径，"/" 补搜索词
cmp.setup.cmdline(':', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources({
    { name = 'path' },    -- 文件路径
  }, {
    { name = 'cmdline' }, -- 命令名
  }),
})

cmp.setup.cmdline('/', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = {
    { name = 'buffer' },  -- 当前文件里的单词
  },
})

