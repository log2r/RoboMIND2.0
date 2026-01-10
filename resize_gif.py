import os
from PIL import Image, ImageSequence

# 1. 配置参数（你可以根据需要修改）
ROOT_DIR = "/Users/log2r/Documents/Projects/RoboMIND2.0/gifs/"
# 目标尺寸（宽, 高），你可以根据实际需求调整
TARGET_SIZE = (640, 480)
# 是否覆盖原文件（False 则保存到新目录，避免原文件丢失）
OVERWRITE = False
# 新文件保存的根目录（仅当 OVERWRITE=False 时生效）
OUTPUT_ROOT = "/Users/log2r/Documents/Projects/RoboMIND2.0/gifs_resized/"

def resize_gif(gif_path, output_path, target_size):
    """
    调整 GIF 尺寸并保存，保留动画效果
    :param gif_path: 原 GIF 文件路径
    :param output_path: 调整后保存的路径
    :param target_size: 目标尺寸 (width, height)
    """
    try:
        # 打开原 GIF
        with Image.open(gif_path) as img:
            # 存储每一帧的图像和相关信息
            frames = []
            durations = []  # 存储每一帧的延迟时间（控制动画速度）
            
            # 遍历 GIF 的每一帧
            for frame in ImageSequence.Iterator(img):
                # 转换为 RGBA 避免透明通道丢失
                frame_rgba = frame.convert("RGBA")
                # 调整帧的尺寸（使用 LANCZOS 插值，画质更好）
                resized_frame = frame_rgba.resize(target_size, Image.Resampling.LANCZOS)
                frames.append(resized_frame)
                # 记录帧的延迟时间
                durations.append(img.info.get("duration", 100))
            
            # 创建输出目录（如果不存在）
            os.makedirs(os.path.dirname(output_path), exist_ok=True)
            
            # 保存调整后的 GIF
            frames[0].save(
                output_path,
                save_all=True,
                append_images=frames[1:],
                duration=durations,
                loop=0,  # 0 表示无限循环
                disposal=2,  # 保留透明背景
                optimize=True
            )
        print(f"成功处理: {gif_path} -> {output_path}")
    except Exception as e:
        print(f"处理失败 {gif_path}: {str(e)}")

def main():
    # 遍历根目录下的所有文件夹
    for root_folder in os.listdir(ROOT_DIR):
        root_folder_path = os.path.join(ROOT_DIR, root_folder)
        # 只处理文件夹（跳过文件）
        if not os.path.isdir(root_folder_path):
            continue
        
        # 遍历 task1 到 task6
        for task_num in range(1, 7):
            task_folder = f"task{task_num}"
            task_folder_path = os.path.join(root_folder_path, task_folder)
            gif_file_path = os.path.join(task_folder_path, "camera_front.gif")
            
            # 检查 GIF 文件是否存在
            if os.path.exists(gif_file_path):
                # 确定输出路径
                if OVERWRITE:
                    output_path = gif_file_path
                else:
                    # 保持原目录结构，保存到新根目录
                    output_path = gif_file_path.replace(ROOT_DIR, OUTPUT_ROOT)
                
                # 调整 GIF 尺寸并保存
                resize_gif(gif_file_path, output_path, TARGET_SIZE)
            else:
                print(f"文件不存在: {gif_file_path}")

if __name__ == "__main__":
    main()