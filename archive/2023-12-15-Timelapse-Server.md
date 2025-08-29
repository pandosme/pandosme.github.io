---
layout: post
title:  "Timelapse Server"
date: 2023-12-15 00:00:00 +0200
categories: [Node-RED]
---

The [Timelapse ACAP](https://pandosme.github.io/acap/2020/01/01/timelapse.html) makes it easy to create timelapse videos using Axis camera.  A server-based solution may be a more suitable solution if you want a centralized interface for multiple cameras.  The timelapse-server collects images from Axis cameras and stores them in directories so user can generate and play MP4 video at configurable frame rates.  The Timelapse-server does not need any ACAP installed on the device.

Common use cases:
* Construction site progress.  Typically capturing one image every day at sun noon.
* Monitor slow changes for outdoor seasonal, warehouse stock or rooms.  Typically capturing images based on a timer. 
* Forensic search.  Typically capturing images on motion detection.  

Features:
* Web-based dashboard
* Supports both local cameras (pull images) and remote cameras (push images).
* User-selectable image capture triggers
* Set GPS location to generate Sun noon event to be used as trigger.
* Condition filters to limit image capturing only between sunrise and sunset, between dawn and dusk or during office hours
* View status of all ongoing recordings
* Inspect frames in timelapse
* Generate, play and download MP4 videos

## [Installation instructions](https://github.com/pandosme/timelapse-server)

{% include youtube.html id="1AwLA3Yd9QU" %}

  
![image](https://api.juhlin.me/image/timelapse-server)
