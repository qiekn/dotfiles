# pacman: fzf search packages and install
psf() {
  local pkgs
  pkgs=$(pacman -Ss | \
    grep -E '^[^ ]+/' | \
    cut -d' ' -f1 | \
    fzf -m) || return

  [ -z "$pkgs" ] && return

  echo "pacman -S \\"

  local last
  last=$(echo "$pkgs" | tail -n1)

  while read -r pkg; do
    if [[ "$pkg" == "$last" ]]; then
      echo "  $pkg"
    else
      echo "  $pkg \\"
    fi
  done <<< "$pkgs"

  echo
  read -q "REPLY?Install selected packages? [y/N] " || { echo; return; }
  echo

  if [[ $REPLY == [yY] ]]; then
    pacman -S ${(f)pkgs}
  else
    echo "Cancelled"
  fi
}
