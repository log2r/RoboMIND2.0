#!/usr/bin/env python3
import argparse
import subprocess
from pathlib import Path

FPS = 30
TARGET_SEC = 40
TARGET_FRAMES = FPS * TARGET_SEC


def run(cmd):
    subprocess.run(cmd, check=True)


def get_frame_count(video):
    cmd = [
        "ffmpeg", "-i", str(video),
        "-map", "0:v:0",
        "-vf", "showinfo",
        "-f", "null", "-"
    ]
    p = subprocess.Popen(cmd, stderr=subprocess.PIPE, text=True)
    frames = 0
    for line in p.stderr:
        if "showinfo" in line and "n:" in line:
            frames += 1
    p.wait()
    return frames


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument("--input", "-i", required=True)
    parser.add_argument("--out_dir", "-o", required=True)
    args = parser.parse_args()

    in_path = Path(args.input).resolve()
    out_dir = Path(args.out_dir).resolve()
    out_dir.mkdir(parents=True, exist_ok=True)
    out_path = out_dir / "demo.mp4"

    total_frames = get_frame_count(in_path)

    if total_frames <= TARGET_FRAMES:
        run([
            "ffmpeg", "-y",
            "-i", str(in_path),
            "-c", "copy",
            str(out_path)
        ])
        print(f"[OK] keep original ({total_frames} frames)")
        return

    speed = total_frames / TARGET_FRAMES

    run([
        "ffmpeg", "-y",
        "-i", str(in_path),
        "-vf", f"setpts=PTS/{speed}",
        "-r", "30",
        "-c:v", "libx264",
        "-preset", "medium",
        "-crf", "23",
        "-an",
        str(out_path)
    ])

    print(
        f"[OK] compressed: {total_frames} → {TARGET_FRAMES} frames "
        f"(speed={speed:.3f})"
    )


if __name__ == "__main__":
    main()
