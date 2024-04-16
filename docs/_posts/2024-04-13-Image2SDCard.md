---
layout: post
title:  "Capture Images to SD Card with API"
date: 2024-04-13 00:00:00 +0200
categories: [Node-RED]
---

This Node-RED flow provides capturing images to SD Card and interfaces to view, list and download images.  It is possible to use any event to trigger image capturing.  You can modify the flow to fit all your needs.

## Prerequisite 
1. Axis Camera with mounted SD Card
2. [Node-RED Installer](https://pandosme.github.io/acap/node-red/2023/09/12/nodered-acap.html)
3. Copy content of [SD Capture flow](https://acap.juhlin.me/package/image2sdcard) and import it to the Node-RED


## Dashboard
In a browser, go to http://CAMERA_ADDRESS:1880/ui

## API
### http://camera:1880/list
Provide a JSON array of timestamps when image was captured.  The timestamps are EPOCH UTC with millisecond resolution.

### http://camera:1880/capture
For external HTTP clients to trigger image capturing

### http://camera:1880/image/TIMESTAMP
View the image in a browser.  Use and replace TIMESTAMP from the list request.
Example http://camera:1880/image/1713036454675

### http://camera:1880/download/TIMESTAMP
Download the image as a file.   Use and replace TIMESTAMP from the list request.
Example http://camera:1880/download/1713036454675

### http://camera:1880/flush
Removes all images

### Flow
[SD Capture flow](https://acap.juhlin.me/package/image2sdcard)  

![flow]({{ site.url }}/assets/image2sdcard.jpg)
