# USAGE
# python test_network.py --model santa_not_santa.model --image examples/d876283.jpg

# import the necessary packages
from keras.preprocessing.image import img_to_array
from keras.models import load_model
import numpy as np
import argparse
import imutils
import cv2

ap = argparse.ArgumentParser()
ap.add_argument("-m", "--model", required=True,help="path to trained model model")
ap.add_argument("-i", "--image", required=True,help="path to input image")
args = vars(ap.parse_args())

# 讀入欲辨識圖像
image = cv2.imread(args["image"])
orig = image.copy()

# 對圖像進行欲處理
image = cv2.resize(image, (28, 28))
image = image.astype("float") / 255.0
image = img_to_array(image)
image = np.expand_dims(image, axis=0)

# 讀取之前訓練好的卷積神經網路模型
print("[INFO] loading network...")
model = load_model(args["model"])

# 對輸入的圖像進行分類
(notSanta, santa) = model.predict(image)[0]

# 建立標籤
label = "Santa" if santa > notSanta else "Not Santa"
proba = santa if santa > notSanta else notSanta
label = "{}: {:.2f}%".format(label, proba * 100)

# 在圖像上繪製標籤
output = imutils.resize(orig, width=400)
cv2.putText(output, label, (10, 25), cv2.FONT_HERSHEY_SIMPLEX, 0.7, (0, 255, 0), 2)

# 顯示圖像及辨識結果
cv2.imshow("Output", output)
cv2.waitKey(0)
