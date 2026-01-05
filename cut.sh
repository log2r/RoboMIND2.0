#!/usr/bin/env bash
set -euo pipefail

IN="/Users/log2r/Documents/Projects/RoboMIND2.0/demos/collab_mob_tasks_1/demo.mp4"
OUT="/Users/log2r/Documents/Projects/RoboMIND2.0/demos/collab_mob_tasks_1/demo_crop_lr10.mp4"

# Crop 10% from left and 10% from right:
#   new_w = 0.8 * in_w
#   x = 0.1 * in_w
# Keep full height.
ffmpeg -y -i "$IN" \
  -vf "crop=iw*0.8:ih:iw*0.1:0" \
  -c:v libx264 -pix_fmt yuv420p -profile:v high -level 4.1 -movflags +faststart \
  -c:a copy \
  "$OUT"
