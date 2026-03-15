# yazi
function z() {
  local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
  yazi "$@" --cwd-file="$tmp"
  if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
    builtin cd -- "$cwd"
  fi
  rm -f -- "$tmp"
}

function mkcd {
  last=$(eval "echo \$$#")
  if [ ! -n "$last" ]; then
    echo "Enter a directory name"
  elif [ -d $last ]; then
    echo "\`$last' already exists"
  else
    mkdir $@ && cd $last
  fi
}

# yt-dlp 快速截取片段函数
vcut() {
  local start=$1
  local end=$2
  local url=$3

  if [[ -z "$url" || -z "$start" || -z "$end" ]]; then
    echo "usage: vcut [URL] [start-time] [end-time]"
    return 1
  fi

  yt-dlp --download-sections "*${start}-${end}" \
    --force-keyframes-at-cuts \
    -f "bv+ba/b" \
    "$url"
  }
