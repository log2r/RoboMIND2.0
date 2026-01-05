for f in ./demos/*/demo.mp4; do
  echo "====================" >> ffprobe.log
  echo "$f" >> ffprobe.log
  ffprobe -hide_banner "$f" >> ffprobe.log 2>&1
done
