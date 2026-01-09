from PIL import Image

# 读取图片
img = Image.open("/Users/log2r/Documents/Projects/RoboMIND2.0/figs/table2_.png")

w, h = img.size

# 计算裁剪区域：保留上方 40%
crop_height = int(h * 0.3)
cropped = img.crop((0, 0, w, crop_height))

# 保存结果
cropped.save("/Users/log2r/Documents/Projects/RoboMIND2.0/figs/table2.png")
