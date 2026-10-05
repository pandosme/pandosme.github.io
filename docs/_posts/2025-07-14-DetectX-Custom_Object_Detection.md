---
layout: post
title: "Custom Object Detection ACAP using YOLOv5"
date: 2025-07-14 00:00:00 +0200
categories: [ACAP]
excerpt: "Train and deploy custom YOLOv5 object detection models directly on Axis cameras."
image: /assets/custom_detection.png
---

> **Update:** DetectX 5.x now uses YOLOv8 and cannot load YOLOv5 models. For new training and deployments, see [Run Your YOLOv8 Models on Axis Cameras]({% post_url 2026-10-05-detectx-yolov8 %}). This article and its video describe the legacy YOLOv5 workflow; the last YOLOv5 release, 4.1.1, is no longer maintained.

While Axis cameras offer robust built-in object detection analytics for common use cases, some scenarios require more specialized detection. This package allows you to leverage a trained YOLOv5 model on the camera itself, bypassing the need for server-based processing.
If you have a labeled dataset, you can train a YOLOv5 model, export it and create an ACAP to run it in the camera.
  
Please watch the video to understand the process  

{% include youtube.html id="BGySMLDPx0s" %}  

### [Legacy DetectX YOLOv5 release](https://github.com/pandosme/DetectX/tree/v4.1.1)
<br>
There you will find the legacy instructions for training the model and building the ACAP. The [current DetectX repository](https://github.com/pandosme/DetectX) contains the updated YOLOv8 workflow.
![image](https://api.juhlin.me/image/yolo5)

