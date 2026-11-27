# nvim-profile

Neovim 配置：原生 `pack/vendor/start` 包管理 + git submodule，核心配置拆在 `lua/core/`，插件位于 `pack/vendor/start/`。

## 快速安装

```bash
# 1. 准备：Neovim ≥ 0.11、git、gcc/make、curl/tar、node/npm
#    （可选）clangd、pyright、rg/fd、xclip

# 2. 克隆并拉取插件（也可直接 clone 到 ~/.config/nvim）
git clone https://github.com/shink/nvim-profile.git ~/workspace/nvim-profile
cd ~/workspace/nvim-profile
git submodule update --init --recursive   # 失败重跑；若只剩 .git 空目录加 --force

# 3. 软链到 ~/.config/nvim（已存在则先改名）
ln -s ~/workspace/nvim-profile ~/.config/nvim

# 4. 装 tree-sitter CLI ≥ 0.22（关键）
npm install -g tree-sitter-cli
tree-sitter --version

# 5. 编译 fzf-native
make -C ~/.config/nvim/pack/vendor/start/telescope-fzf-native.nvim

# 6. LSP 服务端（按语言按需）
sudo apt install clangd    # C/C++
npm install -g pyright     # Python

# 7. 首次启动自动装 treesitter parser（需联网，停留几十秒让 parser 装完）
nvim
```

### 依赖要点

| 依赖 | 用途 |
|---|---|
| Neovim ≥ 0.11 | `vim.lsp.config` / `vim.lsp.enable` |
| gcc + make | 编译 fzf-native、treesitter parser |
| curl + tar | treesitter 下载/解压 |
| node + npm | tree-sitter CLI、pyright |
| **tree-sitter-cli ≥ 0.22** | `tree-sitter build`（Ubuntu 自带的 0.20.8 无 `build` 子命令，会报 `build wasn't recognized`） |
| clangd / pyright | C/C++ / Python LSP |
| rg / fd（可选） | telescope 提速 |
| xclip / xsel（可选） | 系统剪贴板 `"+` 寄存器 |

### 验证

```bash
nvim --headless \
  "+lua vim.defer_fn(function() \
      print('colorscheme=' .. (vim.g.colors_name or 'NIL')); \
      print('parsers=' .. table.concat(require('nvim-treesitter').get_installed('parsers'), ',')); \
      print('fzf_ok=' .. tostring(pcall(require('telescope').load_extension, 'fzf'))) \
    end, 500)" \
  "+lua vim.defer_fn(function() vim.cmd('qa!') end, 2000)"
```

预期：`colorscheme=github_dark_default`，`parsers=` 非空，`fzf_ok=true`。

## 插件管理

```bash
git submodule status                                # 查看版本
git submodule update --remote                       # 全部更新到各自最新
git -C pack/vendor/start/<name> pull                # 更新单个
git submodule add <repo-url> pack/vendor/start/<name>   # 新增
```

## 使用

leader 键为**空格**。

| 按键 | 功能 |
|---|---|
| `<leader>ff` / `<leader>fg` | 查找文件 / live grep |
| `<leader>fb` / `<leader>fr` | 缓冲区列表 / 最近文件 |
| `<leader>fh` / `<leader>fs` | 帮助 / 搜索光标下的词 |
| `<leader>fc` / `<leader>ft` | git 文件 / 按符号浏览代码结构 |
| `<leader>e` | 开关文件树 |
| `s` / `S` | flash 跳转 / treesitter 节点跳转 |
| `yr` / `dr` / `vr` | flash 远程操作（配合 y/d/v） |
| `<leader>y` / `<leader>d` / `<leader>p` | 剪贴板 复制 / 剪切 / 粘贴 |
| `<leader>j` / `<leader>k` | 上一个文件 / 下一个文件 |
| `<leader>h` / `<leader>l` | 上一个书签 / 下一个书签（跨文件） |
| `<leader>m` / `<leader>M` | 切换书签 / 书签列表 |
| `J` / `K` | 下移 / 上移 5 行 |
| `H` / `L` | 行首 / 行尾 |
| `j` / `k` | 屏幕行移动（绕过软换行） |
| `fw` | 搜索光标下的词（等同 `*`） |
| `<leader><space>` | 清除搜索高亮 |

补全（nvim-cmp）：`Tab`/`S-Tab` 选候选或跳片段占位符，`<CR>` 确认，`<C-Space>` 手动触发。

LSP：打开 `.c/.cpp` 自动启用 clangd，`.py` 启用 pyright；`gd`/`gr`/`gi`/`gt` 走 telescope 悬浮选择器（单个直接跳，多个弹浮动预览），`gD`/`<leader>rn`/`K` 走内置 LSP。

## 常见问题

- **`build wasn't recognized`**：tree-sitter CLI 太旧 → `npm install -g tree-sitter-cli`。
- **`module 'xxx' not found`**：submodule 没拉全 → `git submodule update --init --force --recursive`。
- **telescope 找不到 fzf**：没编译 fzf-native → `make -C pack/vendor/start/telescope-fzf-native.nvim`。
- **Python 补全/跳转无效**：没装 pyright → `npm install -g pyright`。