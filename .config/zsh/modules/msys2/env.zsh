# modules/msys2/env.zsh — MSYS2 UCRT64 environment

export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"
export XDG_CACHE_HOME="$HOME/.cache"

export YAZI_CONFIG_HOME="$HOME/.config/yazi"

export WINHOME="/c/Users/user"
export APPS="/c/Apps"

path+=(
  "/c/Program Files/Git/cmd"
  "/c/Program Files/dotnet/"
  "$APPS/nodejs"
  "$APPS/Go/bin"
  "$APPS/MiKTex/texmfs/install/miktex/bin/x64"
  "$APPS/SumatraPDF"
  "$APPS/shortcuts"
  "$APPS/vgmstream-win64"
  "$APPS/tdl"
  "/c/VulkanSDK/1.4.341.1/Bin"
  "/c/Users/user/AppData/Roaming/npm"
  "$HOME/.local/share/pnpm"
  "$HOME/.local/bin"
  "$WINHOME/.local/bin"
  "$USERPROFILE/scoop/shims"
  "$USERPROFILE/scoop/apps/rustup/current/.cargo/bin"
)

# ln -s
export MSYS=winsymlinks:nativestrict

# Compiler
export CC=clang
export CXX=clang++

# Windows Terminal current directory sync
if [[ -n "$WT_SESSION" ]]; then
  function tell_wt_cwd() {
    printf "\e]9;9;%s\e\\" "$(cygpath -w "$PWD")"
  }
  autoload -Uz add-zsh-hook
  add-zsh-hook precmd tell_wt_cwd
fi
