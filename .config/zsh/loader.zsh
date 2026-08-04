# loader.zsh — platform-aware config loader
# Loaded by .zshrc (oh-my-zsh auto-sources $ZSH_CUSTOM/*.zsh)
# and .zshrc_optimize (manual for-loop)

_loader_dir="${0:A:h}"
[[ -n "$MSYSTEM" ]] && _platform="msys2" || _platform="unix"

# 1. Core: env first (aliases reference $WINHOME etc.)
[[ -f "$_loader_dir/core/env.zsh" ]] && source "$_loader_dir/core/env.zsh"
for f in "$_loader_dir"/core/*.zsh(N); do
  [[ "$f" == */env.zsh ]] && continue
  source "$f"
done

# 2. Platform modules: env first
[[ -f "$_loader_dir/modules/$_platform/env.zsh" ]] && source "$_loader_dir/modules/$_platform/env.zsh"
for f in "$_loader_dir"/modules/$_platform/*.zsh(N); do
  [[ "$f" == */env.zsh ]] && continue
  source "$f"
done

# 3. Functions: common + platform
for f in "$_loader_dir"/functions/common/*.zsh(N); do
  source "$f"
done
for f in "$_loader_dir"/functions/$_platform/*.zsh(N); do
  source "$f"
done

unset _loader_dir _platform
