# yt-dlp quick video segment extraction
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
