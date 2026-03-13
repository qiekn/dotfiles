# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## 仓库概述

这是一个跨平台（macOS + Windows MSYS2）的个人 dotfiles 仓库，使用 GNU Stow 进行符号链接管理。仓库根目录即 stow 包目录，`stow --adopt .` 会将所有配置链接到 `$HOME`。

子模块：`.oh-my-zsh` → 自定义 fork `qiekn/ohmyzsh`

## 管理命令

```bash
# 安装/更新符号链接
cd ~/.dotfiles && stow --adopt .

# 预览 stow 操作（不实际执行）
stow -n -v .

# 删除符号链接
stow -D .
```

## 目录结构

- `.config/nvim/` — Neovim 配置（Lua，lazy.nvim 插件管理）
- `.config/zsh/` — ZSH 自定义配置（`$ZSH_CUSTOM` 指向此处）
  - `msys2.zsh` — MSYS2 UCRT64 专用环境变量和 alias
  - `alias.zsh` — 通用 alias
  - `func.zsh` — shell 函数（yazi 集成、mkcd、vcut）
  - `myshrc.zsh` — 个人变量、代理、路径
- `.config/emacs/` — Emacs 配置（已删除 init.el，迁移到 `.emacs.d/` Spacemacs）
- `.emacs.d/` — Spacemacs 配置
- `.config/lazygit/` — Lazygit 配置
- `.config/yazi/` — Yazi 文件管理器配置
- `.config/tmux/` — Tmux 插件（catppuccin 主题）
- `.config/karabiner/` — macOS Karabiner-Elements 键位映射
- `.config/espanso/` — 文本扩展工具配置
- `.skhdrc` / `.yabairc` — macOS 窗口管理器（yabai + skhd）
- `.ideavimrc` — JetBrains IdeaVim 配置

## 环境：MSYS2 UCRT64

当前主要开发环境为 Windows + MSYS2 UCRT64。Claude Code 运行在 Windows 原生环境，Bash 工具中**必须使用绝对路径调用 MSYS2 工具链**，且路径使用正斜杠 `/` 并用双引号包裹。

### 工具链路径

| 工具 | 路径 |
|------|------|
| cmake | `C:/msys64/ucrt64/bin/cmake.exe` |
| clang++ | `C:/msys64/ucrt64/bin/clang++.exe` |
| clang | `C:/msys64/ucrt64/bin/clang.exe` |
| make | `C:/msys64/ucrt64/bin/mingw32-make.exe` |
| node | `C:/Apps/nodejs/node.exe` |
| pnpm | `C:/msys64/home/user/.local/share/pnpm/pnpm` |
| go | `C:/Apps/Go/bin/go.exe` |

其他 UCRT64 工具前缀：`C:/msys64/ucrt64/bin/`

完整路径列表参见 `.config/zsh/msys2.zsh`

### CMake 配置示例

```bash
cmake -B build -G "MinGW Makefiles" \
  -DCMAKE_C_COMPILER="C:/msys64/ucrt64/bin/clang.exe" \
  -DCMAKE_CXX_COMPILER="C:/msys64/ucrt64/bin/clang++.exe" \
  -DCMAKE_MAKE_PROGRAM="C:/msys64/ucrt64/bin/mingw32-make.exe"
```

## C++ 代码风格

- Google C++ Style Guide（行宽放宽至 140）
- 使用 `.clang-format` 和 `.clang-tidy`
- 编译器：clang（非 gcc）
- JSON 库：nlohmann/json
- 头文件保护：`#pragma once`
- 访问修饰符（`public`/`private`/`protected`）顶格不缩进，成员缩进 2 空格
- `enum class` 枚举值使用 PascalCase（如 `KeyCode::RightBracket`）

## Git 约定

- commit 格式：`<type>: <description>`（类型：feat, fix, refactor, docs, test, chore, perf, ci）
- 无 Co-Authored-By 署名（全局 settings.json 已禁用）
- 编辑器：nvim
- 别名：`vim` → `nvim`，`lg` → `lazygit`，`make` → `mingw32-make`
