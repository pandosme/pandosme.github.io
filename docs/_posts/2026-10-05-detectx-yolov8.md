---
layout: post
title: "Run Your YOLOv8 Models on Axis Cameras"
date: 2026-10-05
categories: [ACAP]
excerpt: "Deploy YOLOv8 models on ARTPEC-8 cameras with DetectX 5.x. ARTPEC-9 users must wait for AXIS OS 13."
image: /assets/yolov8.png
---

Have a YOLOv8 model trained to detect the objects that matter to your application? **DetectX 5.x** runs an exported, quantized TFLite version of that model on an Axis camera, without a separate inference server. Integrators can use the detections through MQTT, ONVIF events or HTTP.

> **ARTPEC-9: wait for AXIS OS 13.** DetectX's YOLOv8 models do not work correctly on ARTPEC-9 cameras running firmware older than OS 13. The model can load and run, but a firmware bug causes incorrect, high-confidence detections. You must wait until AXIS OS 13 is released for your camera and upgrade before deploying DetectX 5.x. ARTPEC-8 is not affected by this firmware issue.

My [earlier YOLOv5 article]({% post_url 2025-07-14-DetectX-Custom_Object_Detection %}) introduced the training-to-camera workflow. The updated [DetectX repository](https://github.com/pandosme/DetectX) now provides the training, export and ACAP build instructions for **YOLOv8**.

## Why YOLOv8?

- **Train once for both chipsets.** You do not need to train one model for ARTPEC-8 and another for ARTPEC-9. Export the same trained YOLOv8 `.pt` checkpoint into two different quantized `.tflite` files: per-tensor quantization for ARTPEC-8 and per-channel quantization for ARTPEC-9. Each camera needs its matching export and ACAP package.
- **Widescreen inputs for 16:9 scenes.** Instead of the 1:1 square inputs used in the legacy DetectX YOLOv5 workflow, you can export a rectangular input that better matches the camera's view, reducing wasted padding. Both input dimensions must be multiples of 32, so sizes such as `640x384` or `1280x736` approximate 16:9 rather than matching it exactly.

## From Training to the Camera

**The camera cannot run the YOLOv8 PyTorch `.pt` model. It must first be exported into a quantized TFLite (`.tflite`) model.** Training produces the checkpoint; export produces the model DetectX can run on the camera's DLPU.

Train a custom YOLOv8 detection model with your labeled dataset, or start with an existing trained YOLOv8 `.pt` checkpoint. Use DetectX's `export_yolov8.py` with representative calibration images to create the quantized TFLite export for each target chipset, then build the ACAP with the exported model and its labels. DetectX reads the model parameters automatically, so changing the input resolution or class count does not require editing the application code.

Use the supplied exporter: the standard Ultralytics TFLite export does not produce the quantized input/output and split output tensors DetectX needs. Unsigned development packages on OS 13 require Axis's Developer Mode ACAP.

## Moving from YOLOv5

This is a new model pipeline, not a drop-in application upgrade. DetectX 5.x cannot load your old YOLOv5 model. Reuse your labeled dataset to train a YOLOv8 model, then export it with the updated tools. Existing YOLOv5 deployments can remain on the frozen [DetectX 4.1.1 release](https://github.com/pandosme/DetectX/tree/v4.1.1), but that line is no longer maintained.

For training, export and installation details, follow the [YOLOv8 training and build guide](https://github.com/pandosme/DetectX/blob/main/Train-Build.md). Start with one camera and verify its detections before migrating a deployment.

![image](https://api.juhlin.me/image/detectx-yolov8)