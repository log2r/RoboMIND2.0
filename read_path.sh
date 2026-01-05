#!/usr/bin/env bash
set -euo pipefail

ROOT="/Users/log2r/Documents/Projects/RoboMIND2.0"
VID_DIR="${ROOT}/static/videos"
OUT_TXT="${ROOT}/video_paths.txt"

: > "${OUT_TXT}"

for d in "${VID_DIR}"/*; do
  [[ -d "${d}" ]] || continue

  front="${d}/camera_front_video.mp4"
  top="${d}/camera_top_video.mp4"

  if [[ -f "${front}" ]]; then
    echo "${front}" >> "${OUT_TXT}"
  elif [[ -f "${top}" ]]; then
    echo "${top}" >> "${OUT_TXT}"
  else
    echo "[MISSING] ${d}" >&2
    :
  fi
done

echo "[OK] Saved to: ${OUT_TXT}"
echo "[INFO] Total lines: $(wc -l < "${OUT_TXT}")"
