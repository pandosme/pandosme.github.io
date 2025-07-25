---
layout: post
title:  "DetectX - Detected Image Export"
date: 2025-07-23 00:00:00
categories: [ACAP]
---

DetectX gives you the ability to run custom YOLOv5 models in an Axis cameras.  It fires events when labels are detected and it sends object detection data on MQTT for data-driven applications.

Version 3.5.0 extends the use cases.  By adding the ability to export detected cropped images, it enalbels:
  - Building two-stage detection and analytics workflows, where the camera generates rough detections and exports limited amount of cropped images for advanced processing by LLMs or other AI/image analytics services.
  - Simplifies dataset collection expansion and refinement by automatically generating pre-labeled cropped images to be stored for training or analysis.

**Highlights:**
  - Supports both **MQTT** and **HTTP** output for flexible integration.
  - Optional border padding on cropped images (top, left, bottom, right) for context preservation.
  - Built-in visual inspection page to review the latest detected images directly.
  - Configurable export throttling to prevent bursts and control image delivery rate.

For more information and to download the latest version, visit the [DetectX GIT repository](https://github.com/pandosme/DetectX).

![image](https://api.juhlin.me/image/geospace)
