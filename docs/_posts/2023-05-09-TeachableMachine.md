---
layout: post
title:  "Run Teachable Machine Models in camera"
date: 2023-05-09 00:00:00 +0200
categories: [ACAP]
---
[Teachable Machine]( https://teachablemachine.withgoogle.com/) is a free Google service for AI models.  It is possible to export these models and make them run in cameras.  This is useful when you want to have a specific detection in a specific scene.  Making general models that will work in any arbitrary scene is very difficult.  One example could be to detect if a door is open or closed from a specific camera.  Take several images when the door is closed and when the door is open in various light conditions.  Add all label called “open” and add all images when the door is open. Create a new label “closed” and add all images of the door closed.  How many images needed may depend.  Use between 25-100 in as many light scenarios as possible.  Generate the model.  How and what to export and how to compile is described in

## [TFLITE ACAP Open Source Code Package](https://github.com/pandosme/TFLITE_1)

Limited coding experience is need unless you want to extend that ACAP with additional behavior or customized outputs, and integration.
