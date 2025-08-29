---
layout: post
title:  "DetectX: Custom Object Detection ACAP using YOLO5"
date: 2025-07-14 00:00:00 +0200
categories: [ACAP]
---

While Axis cameras offer robust built-in object detection analytics for common use cases, some scenarios require more specialized detection. This package allows you to leverage a trained YOLOv5 model on the camera itself, bypassing the need for server-based processing.
If you have a labeled dataset, you can train a YOLO5 model, export it and create an ACAP to run it in the camera.
  
Please watch the video to understand the process  

{% include youtube.html id="BGySMLDPx0s" %}  

### [GitHub DetectX repository](https://github.com/pandosme/DetectX)
<br>
There you will find instructions how to train the model and build the ACAP.
![image](https://api.juhlin.me/image/yolo5)

