cprs () {
  # Default config
  local WIDTH=720
  local CRF=23
  local INPUT=""
  local OUTPUT=""
  local qmode=""

  # Parse
  while [[ $# -gt 0 ]]; do
    case "$1" in
      -w)
        WIDTH="$2"
        shift 2
        ;;
      -q)
        qmode="$2"
        case "$2" in
          low) CRF=28 ;;
          high) CRF=18 ;;
          *) CRF=23 ;;
        esac
        shift 2
        ;;
      -*)
        echo "Unknown option: $1"
        echo "Usage: cprs [-w 720] [-q low|high] [input.mp4]"
        return 1
        ;;
      *)
        INPUT="$1"
        shift
        ;;
    esac
  done

  # FZF
  if [[ -z "$INPUT" ]]; then
    INPUT=$(find . -maxdepth 1 -type f \
      \( -iname "*.mp4" -o -iname "*.mkv" -o -iname "*.mov" -o -iname "*.avi" -o -iname "*.webm" \) \
      | sed 's#^\./##' \
      | fzf --exit-0 --prompt="Select video > ")
  fi

  # Check input
  if [[ -z "$INPUT" ]]; then
    echo "Usage: cprs -w 720 -q <low|high> input.mp4"
    exit 1
  fi

  # Output filename
  local BASENAME="${INPUT%.*}"
  OUTPUT="${BASENAME}_cprs.mp4"

  # Run ffmpeg
  ffmpeg -i "$INPUT" \
    -vf "scale=-2:${WIDTH}" \
    -c:v libx264 -crf "$CRF" -preset medium \
    -c:a aac -b:a 128k \
    "$OUTPUT"
}
