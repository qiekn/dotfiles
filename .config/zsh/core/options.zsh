# core/options.zsh — cross-platform shell options and tools

## Zoxide
if command -v zoxide &>/dev/null; then
  eval "$(zoxide init zsh --cmd c)"

  # Fix Windows/MSYS2 path conversion
  function __zoxide_pwd() {
    command cygpath -w "$(builtin pwd -L)"
  }
fi
