---
layout: post
title:  "Custom Object Detection ACAP (Using YOLO5)"
date: 2024-09-05 00:00:00 +0200
categories: [ACAP]
---

While Axis cameras offer robust built-in object detection analytics for common use cases, some scenarios require more specialized detection. This package allows you to leverage a trained YOLOv5 model on the camera itself, bypassing the need for server-based processing.
If you have a labeld dataset, you can train a YOLO5 model, export it and create an ACAP to run it in the camera.

Note that this will require time, effort and some skills.
[DetecX ACAP Package](https://github.com/pandosme/DetectX)
