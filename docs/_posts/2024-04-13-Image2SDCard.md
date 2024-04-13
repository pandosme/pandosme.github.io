---
layout: post
title:  "Capture Images to SD Card with API"
date: 2024-04-13 00:00:00 +0200
categories: [Node-RED]
---

This Node-RED flows provides trigger image captured to and SD Card.  Any event can be used to trigger image capturing including inject timer, camera events, or external clients using API.  
The flow also provides API to list images and get/download selected image.  You can modify the flow to fit all your needs.

## Prerequisite 
1. Axis Camera with mounted SD Card
2. [Node-RED Installer](https://pandosme.github.io/acap/node-red/2023/09/12/nodered-acap.html)
3. Copy content of [SD Capture flow](https://acap.juhlin.me/package/image2sdcard) and import it to the Node-RED


## API
### http://camera:1880/list
Provide a JSON array of timestamps when image was captured.  The timestamps are EPOCH UTC with millisecond resolution.

### http://camera:1880/capture
For external HTTP clients to trigger image capturing

### http://camera:1880/image/TIMESTAMP
View the image in a browser.  Use the TIMESTAMP from list.

### http://camera:1880/download/TIMESTAMP
Download the image as a file.  Use the TIMESTAMP from list.

### Flow
[SD Capture flow](https://acap.juhlin.me/package/image2sdcard)  
<br/>
![flow]({{ site.url }}/assets/image2sdcard.jpg)

