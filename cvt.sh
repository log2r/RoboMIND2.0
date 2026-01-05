find "$(pwd)/demos" -name "demo.mp4" -print0 | while IFS= read -r -d '' f; do
  codec=$(ffprobe -v error -select_streams v:0 -show_entries stream=codec_name -of csv=p=0 "$f")
  if [ "$codec" = "mpeg4" ]; then
    echo "[FIX] $f (mpeg4/mp4v -> h264/avc1)"
    tmp="${f%.mp4}.tmp.mp4"
    ffmpeg -y -i "$f" \
      -c:v libx264 -pix_fmt yuv420p -profile:v high -level 4.1 \
      -movflags +faststart \
      "$tmp" && mv "$tmp" "$f"
  fi
done
