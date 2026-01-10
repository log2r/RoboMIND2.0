from PIL import Image

# 读取图片
img = Image.open("/Users/log2r/Documents/Projects/RoboMIND2.0/figs/table1_.png")

w, h = img.size

crop_left = w * 0.2  # 左边裁剪20%
crop_right = w * 0.8  # 右边保留到80%位置（即裁掉右侧20%）
crop_top = h * 0  # 顶部裁剪20%
crop_bottom = h  # 底部不裁剪

crop_box = (int(crop_left), int(crop_top), int(crop_right), int(crop_bottom))
cropped_img = img.crop(crop_box)
# 保存结果
cropped_img.save("/Users/log2r/Documents/Projects/RoboMIND2.0/figs/table1.png")
