# nvim-profile

Neovim 配置，采用 **原生 `pack/vendor/start` 包管理** + **git submodule** 管理插件。

## 目录结构

```
.
├── init.lua                  # 入口：leader、加载各模块
├── lua/core/                 # 核心配置（按功能拆分）
│   ├── options.lua           # 基础选项
│   ├── keymaps.lua           # 按键映射
│   ├── themkkke.lua          # 主题（github_dark_default）
│   ├── lsp.lua               # LSP（nvim-lspconfig）
│   ├── cmp.lua               # 补全（nvim-cmp + LuaSnip）
│   ├── treesitter.lua        # 语法高亮（nvim-treesitter）
│   ├── telescope.lua         # 模糊查找（telescope.nvim）
│   ├── tree.lua              # 文件树（nvim-tree.lua）
│   └── flash.lua             # 快速跳转（flash.nvim）
└── pack/vendor/start/        # 插件（git submodule）
    ├── nvim-cmp  cmp-*  cmp_luasnip  LuaSnip
    ├── nvim-lspconfig  nvim-treesitter  telescope.nvim
    ├── plenary.nvim  telescope-fzf-native.nvim
    ├── nvim-tree.lua  nvim-web-devicons  flash.nvim
    ├── github-nvim-theme
    └── vim-commentary  vim-surround  vim-highlightedyank
```

## 首次安装

```bash
git clone --recursive https://github.com/shink/nvim-profile.git ~/.config/nvim

# 单独拉取 submodule
# git -C ~/.config/nvim submodule update --init --recursive
```

> 提示：如果不想把仓库直接放在 `~/.config/nvim`，可以放在别处再用软链：
> ```bash
> ln -s /Users/shenke/workspace/nvim-profile ~/.config/nvim
> ```

## 插件管理（git submodule）

所有插件位于 `pack/vendor/start/`，以 submodule 形式固定到某个 commit。

```bash
# 查看所有插件及其版本
git submodule status

# 更新所有插件到各自远程最新提交
git submodule update --remote

# 更新单个插件
git -C pack/vendor/start/nvim-cmp pull
git add pack/vendor/start/nvim-cmp
git commit -m "chore: update nvim-cmp"
```

新增插件：

```bash
git submodule add <repo-url> pack/vendor/start/<name>
git commit -m "feat: add <name>"
```

## 额外构建步骤

`telescope-fzf-native.nvim` 是 C 扩展，克隆后需编译一次：

```bash
make -C ~/.config/nvim/pack/vendor/start/telescope-fzf-native.nvim
```

Treesitter 的 parser 会在首次启动时按 `lua/core/treesitter.lua` 里的列表
（c / cpp / lua / vim / vimdoc / python / query）自动安装。

