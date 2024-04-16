---
layout: post
title:  "Run Teachable Machine Models in camera"
date: 2023-05-09 00:00:00 +0200
categories: [ACAP]
---
[Teachable Machine]( https://teachablemachine.withgoogle.com/) is a free Google service for making AI models.  It is possible to export these models and make them run in a camera.  This is useful when you want to have a specific detection in a specific scene.  Making an AI model that will work in any arbitrary scene is very difficult.  One example could be to detect if a door is open or closed from a specific camera.  Take several images when the door is closed and when the door is open in various light conditions.  In Teachable Machine, add a label called “open” and add all images when the door is open. Create a new label “closed” and add all images of the door being closed.  How many images are needed to make a predictable model depends.  Use between 25-100 taken with various levels of door being open and in many light conditions.  Generate the model.  Limited coding experience is need unless you want to extend the ACAP with additional behavior or customized outputs, and integration.

{% include youtube.html id="nQQAZ_Eztpg" %}  

## [TFLITE ACAP Open Source Code Package](https://github.com/pandosme/TFLITE_1)

![image](https://api.aintegration.team/image/teachable-machine)


